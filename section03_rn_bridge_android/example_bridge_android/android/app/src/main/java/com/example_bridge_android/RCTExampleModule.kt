package com.example_bridge_android

import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class RCTExampleModule(
    reactContext: ReactApplicationContext
) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String = NAME

    @ReactMethod
    fun printMessage() {
        Log.d("RCTExampleModule", "Hello from Android native module!")
    }

    companion object {
        const val NAME = "ExampleModule"
    }
}