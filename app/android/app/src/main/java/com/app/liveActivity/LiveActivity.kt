package com.app.liveActivity

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.widget.RemoteViews
import androidx.core.app.NotificationCompat
import com.app.R

class LiveActivity(private val context: Context) {
    private var channelId = "channel_live_activity"
    private var channelName = "Live Activity Delivery"
    private var notificationId = 1

    private val notificationManager: NotificationManager =
        context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

    private var notificationSmall = RemoteViews(context.packageName, R.layout.small_notification)
    private var notificationLarge = RemoteViews(context.packageName, R.layout.large_notification)

    fun startNotification(
        restaurant: String?,
        order: String?,
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        createNotificationChannel()

        updateSmallNotification(status, stepMessage, imageStep)
        updateLargeNotification(restaurant, order, description)

        val notificationApp = NotificationCompat.Builder(context, channelId)
            .setSmallIcon(R.mipmap.ic_launcher_round)
            .setStyle(NotificationCompat.DecoratedCustomViewStyle())
            .setCustomContentView(notificationSmall)
            .setCustomBigContentView(notificationLarge)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .build()

        notificationManager.notify(notificationId, notificationApp)
    }

    private fun updateSmallNotification(status: String?, stepMessage: String?, imageStep: String?) {
        notificationSmall.setTextViewText(R.id.small_notification_stepMessage, stepMessage)
        notificationSmall.setTextViewText(R.id.small_notification_status, status)
        
        val resourceId = context.resources.getIdentifier(imageStep, "drawable", context.packageName)
        notificationSmall.setImageViewResource(R.id.small_notification_image, resourceId)
    }

    private fun updateLargeNotification(restaurant: String?, order: String?, description: String?) {
        notificationSmall.setTextViewText(R.id.large_notification_restaurant, restaurant)
        notificationSmall.setTextViewText(R.id.large_notification_order, order)
        notificationSmall.setTextViewText(R.id.large_notification_description, description)
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