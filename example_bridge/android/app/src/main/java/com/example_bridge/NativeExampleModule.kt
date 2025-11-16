package com.example_bridge

import android.util.Log
import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.modules.core.DeviceEventManagerModule

class NativeExampleModule(reactContext: ReactApplicationContext) : NativeExampleModuleSpec(reactContext) {
    private var listenerCount = 0

    override fun getName() = NAME

    override fun printMessage(name: String?, age: Double) {
        Log.d("NativeModule", "Meu nome é $name e tenho ${age.toInt()} anos.")
    }

    override fun returnMessage(title: String?, promise: Promise?) {
        if (title == "Lucas") {
            promise?.resolve("Message processed: $title")
        } else {
            // code + message (fica mais “padrão”)
            promise?.reject("ERR_GENERIC", "Mensagem de erro")
        }
    }

    override fun eventMessage(value: Double) {
        val params = Arguments.createMap()
        params.putInt("value", value.toInt())
        sendEvent("onMessagePrinted", params)
    }

    override fun addListener(eventType: String?) {
        listenerCount += 1
    }

    override fun removeListeners(count: Double) {
        listenerCount -= 1
    }

    private fun sendEvent(eventName: String, params: Any?) {
        reactApplicationContext
            .getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter::class.java)
            .emit(eventName, params)
    }

    companion object {
        const val NAME = "NativeExampleModule"
    }
}