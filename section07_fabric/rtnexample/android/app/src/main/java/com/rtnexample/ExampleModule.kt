package com.rtnexample

import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext

class ExampleModule(reactContext: ReactApplicationContext): NativeRTNExampleSpec(reactContext)  {
    override fun printMessage() {
        println("Hello from Kotlin! printMessage")
    }

    override fun returnMessage(promise: Promise?) {
        println("Hello from Kotlin! returnMessage")
    }

    override fun paramsFunction(
        name: String?,
        age: Double,
        promise: Promise?
    ) {
        println("Hello from Kotlin! paramsFunction")
    }

    override fun emmiterFunction() {
        println("Hello from Kotlin! emmiterFunction")
    }

    companion object {
        const val NAME = "RTNExample"
    }

    override fun getName() = NAME
}