package com.example_bridge_android

import android.util.Log
import com.example_bridge_android.NativeExampleModuleSpec
import com.facebook.react.bridge.ReactApplicationContext

class NativeExampleModule(
    reactContext: ReactApplicationContext
) : NativeExampleModuleSpec(reactContext) {

    override fun getName() = NAME

    override fun printMessage() {
        Log.d("NativeExampleModule", "Native message with React Native")
    }

    companion object {
        const val NAME = "NativeExampleModule"
    }
}