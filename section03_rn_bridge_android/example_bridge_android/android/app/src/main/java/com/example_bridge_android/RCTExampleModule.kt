package com.example_bridge_android

import android.util.Log
import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import com.facebook.react.modules.core.DeviceEventManagerModule

class RCTExampleModule(
    reactContext: ReactApplicationContext
) : ReactContextBaseJavaModule(reactContext) {

    private var listenerCount = 0

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
            // code + message (fica mais “padrão”)
            promise.reject("ERR_GENERIC", "Mensagem de erro")
        }
    }

    @ReactMethod
    fun eventMessage(value: Int) {
        var params = Arguments.createMap()
        params.putInt("value", value)
        sendEvent("onMessagePrinted", params)
    }

    private fun sendEvent(eventName: String, params: Any?) {
        reactApplicationContext
            .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter::class.java)
            .emit(eventName, params)
    }

    @ReactMethod
    fun addListener(eventName: String) {
        listenerCount += 1
    }

    @ReactMethod
    fun removeListeners(event: Int) {
        listenerCount -= 1
    }

    companion object {
        const val NAME = "ExampleModule"
    }
}