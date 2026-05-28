package com.app.liveActivity

import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.liveActivity.NativeLiveActivitySpec

class NativeLiveActivityModule(reactContext: ReactApplicationContext) : NativeLiveActivitySpec(reactContext) {
    override fun getName() = NAME

    private val liveNotification = LiveActivity(reactContext)

    override fun startNotification(
        restaurant: String?,
        order: String?,
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
//        Log.d(NAME, "startNotification $restaurant, $order, $status, $description, $step, $stepMessage, $imageStep")
        liveNotification.startNotification()
    }

    override fun updateNotification(
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        Log.d(NAME, "updateNotification $status, $description, $step, $stepMessage, $imageStep")
    }

    override fun cancelNotification(
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        Log.d(NAME, "cancelNotification $status, $description, $step, $stepMessage, $imageStep")
    }

    companion object {
        const val NAME = "NativeLiveActivity"
    }
}
