package com.app.liveActivity

import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.liveActivity.NativeLiveActivitySpec

class NativeLiveActivityModule(reactContext: ReactApplicationContext) : NativeLiveActivitySpec(reactContext) {
    override fun getName() = NAME

    override fun startNotification(
        restaurant: String?,
        order: String?,
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        Log.d(NAME, "startNotification")
    }

    override fun updateNotification(
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        Log.d(NAME, "updateNotification")
    }

    override fun cancelNotification(
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        Log.d(NAME, "cancelNotification")
    }

    companion object {
        const val NAME = "NativeLiveActivity"
    }
}
