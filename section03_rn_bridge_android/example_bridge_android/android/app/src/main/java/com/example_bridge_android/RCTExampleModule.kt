package com.example_bridge_android

import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

class RCTExampleModule(
    reactContext: ReactApplicationContext
) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String = NAME

    @ReactMethod
    fun printMessage(title: String, age: Int) {
        Log.d("RCTExampleModule", "Hello from Android native module! $title - $age")
    }

    @ReactMethod
    fun returnMessage(title: String, promise: Promise) {
        if (title == "Lucas") {
            promise.resolve("Message processed: $title")
        } else {
            promise.reject("Erro", "Mensagem de erro")
        }
    }

    companion object {
        const val NAME = "ExampleModule"
    }
}