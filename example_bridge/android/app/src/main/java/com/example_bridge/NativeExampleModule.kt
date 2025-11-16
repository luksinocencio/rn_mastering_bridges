package com.example_bridge

import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext

class NativeExampleModule(reactContext: ReactApplicationContext) : NativeExampleModuleSpecSpec(reactContext) {
    override fun getName() = NAME


    override fun printMessage(name: String?, age: Double) {
        Log.d("NativeModule", "Meu nome é $name e tenho $age anos.")
    }

    companion object {
        const val NAME = "NativeExampleModule"
    }
}