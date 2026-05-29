package com.app.liveActivity

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import android.widget.RemoteViews
import androidx.core.app.NotificationCompat
import com.app.MainActivity
import com.app.R

class LiveActivity(private val context: Context) {
    private var channelId = "channel_live_activity"
    private var channelName = "Live Activity Delivery"
    private var notificationId = 1
    private var restaurant: String? = null
    private var order: String? = null

    private val notificationManager: NotificationManager =
        context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

    private var notificationSmall = RemoteViews(context.packageName, R.layout.small_notification)
    private var notificationLarge = RemoteViews(context.packageName, R.layout.large_notification)

    private val intent = Intent(context, MainActivity::class.java).apply {
        flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
    }

    private val pendingIntent = PendingIntent.getActivity(
        context,
        0,
        intent,
        PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
    )

    fun startNotification(
        paramRestaurant: String?,
        paramOrder: String?,
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        createNotificationChannel()
        restaurant = paramRestaurant
        order = paramOrder

        updateLayout(
            status = status,
            description = description,
            step = step,
            stepMessage = stepMessage,
            imageStep = imageStep
        )
    }

    fun updateNotification(
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        updateLayout(
            status = status,
            description = description,
            step = step,
            stepMessage = stepMessage,
            imageStep = imageStep
        )
    }

    fun cancelNotification(

        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        updateLayout(
            status = status,
            description = description,
            step = step,
            stepMessage = stepMessage,
            imageStep = imageStep
        )
    }

    private fun updateLayout(
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        notificationSmall.setTextViewText(R.id.small_notification_stepMessage, stepMessage)
        notificationSmall.setTextViewText(R.id.small_notification_status, status)

        val resourceId = context.resources.getIdentifier(imageStep, "drawable", context.packageName)
        notificationSmall.setImageViewResource(R.id.small_notification_image, resourceId)

        notificationLarge.setTextViewText(R.id.large_notification_restaurant, restaurant)
        notificationLarge.setTextViewText(R.id.large_notification_order, order)
        notificationLarge.setTextViewText(R.id.large_notification_description, description)
        notificationLarge.setTextViewText(R.id.large_notification_status, status)

        updateSteps(step)

        val notificationApp = NotificationCompat.Builder(context, channelId)
            .setSmallIcon(R.mipmap.ic_launcher_round)
            .setStyle(NotificationCompat.DecoratedCustomViewStyle())
            .setCustomContentView(notificationSmall)
            .setCustomBigContentView(notificationLarge)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setContentIntent(pendingIntent)
            .build()

        notificationManager.notify(notificationId, notificationApp)
    }

    private fun updateSteps(step: Double) {
        listOf(
            R.id.small_notification_step1 to R.id.large_notification_step1,
            R.id.small_notification_step2 to R.id.large_notification_step2,
            R.id.small_notification_step3 to R.id.large_notification_step3
        ).forEachIndexed { index, (smallStepId, largeStepId) ->
            val backgroundId =
                if (step >= index + 1) R.drawable.active_background_step else R.drawable.inactive_background_step
            notificationSmall.setInt(smallStepId, "setBackgroundResource", backgroundId)
            notificationLarge.setInt(largeStepId, "setBackgroundResource", backgroundId)
        }
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                channelName,
                NotificationManager.IMPORTANCE_HIGH
            ).apply { }

            notificationManager.createNotificationChannel(channel)
        }
    }
}
