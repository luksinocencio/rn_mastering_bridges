package com.app.LiveActivity

import android.util.Log
import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import com.facebook.react.modules.core.DeviceEventManagerModule

class RCTLiveActivityModule(
    reactContext: ReactApplicationContext
) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String = NAME

    @ReactMethod
    fun startNotification() {
        println("startNotification")
    }

    @ReactMethod
    fun updateNotification() {
        println("updateNotification")
    }

    @ReactMethod
    fun cancelNotification() {
        println("cancelNotification")
    }

    companion object {
        const val NAME = "RCTLiveActivityModule"
    }
}