package com.rtnexample

import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext

class ExampleModule(reactContext: ReactApplicationContext): NativeRTNExampleSpec(reactContext)  {
    override fun printMessage() {
        println("My message with Turbo Module")
    }

    override fun returnMessage(promise: Promise?) {
        promise?.resolve("My message returned in console log")
    }

    override fun paramsFunction(
        name: String?,
        age: Double,
        promise: Promise?
    ) {
        promise?.resolve("Hello my name is $name and my age is $age")
    }

    override fun emmiterFunction() {
        emitOnValueChanged(432.0)
    }

    companion object {
        const val NAME = "RTNExample"
    }

    override fun getName() = NAME
}