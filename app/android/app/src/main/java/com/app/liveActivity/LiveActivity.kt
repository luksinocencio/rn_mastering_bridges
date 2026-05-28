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

    fun startNotification() {
        createNotificationChannel()

        val notificationApp = NotificationCompat.Builder(context, channelId)
            .setSmallIcon(R.mipmap.ic_launcher_round)
            .setStyle(NotificationCompat.DecoratedCustomViewStyle())
            .setCustomContentView(notificationSmall)
            .setCustomBigContentView(notificationLarge)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .build()

        notificationManager.notify(notificationId, notificationApp)
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