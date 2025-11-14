package com.example_bridge_android

import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class RCTExampleModule(
    reactContext: ReactApplicationContext
) : ReactContextBaseJavaModule(reactContext) {

    fun getName() = NAME

    @ReactMethod
    fun printMessage() {
        Log.d("RCTExampleModule", "Native message with React Native")
    }
}