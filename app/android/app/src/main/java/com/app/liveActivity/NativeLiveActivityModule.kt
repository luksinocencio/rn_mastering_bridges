package com.app.liveActivity

import com.facebook.react.bridge.ReactApplicationContext
import com.liveActivity.NativeLiveActivitySpec

class NativeLiveActivityModule(reactContext: ReactApplicationContext) : NativeLiveActivitySpec(reactContext) {
    override fun getName() = NAME

    override fun startNotification(
        restaurant: String?,
        order: String?,
        status: String?,
        decription: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        println("startNotification")
    }

    override fun updateNotification(
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        println("updateNotification")
    }

    override fun cancelNotification(
        status: String?,
        description: String?,
        step: Double,
        stepMessage: String?,
        imageStep: String?
    ) {
        println("cancelNotification")
    }

    companion object {
        const val NAME = "NativeLiveActivity"
    }
}