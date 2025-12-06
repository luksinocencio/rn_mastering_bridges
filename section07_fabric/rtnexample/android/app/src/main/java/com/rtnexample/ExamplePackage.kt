package com.rtnexample

import com.facebook.react.BaseReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.model.ReactModuleInfo
import com.facebook.react.module.model.ReactModuleInfoProvider


class ExamplePackage : BaseReactPackage() {
    override fun getModule(
        name: String,
        reactContext: ReactApplicationContext
    ): NativeModule? = if (name == ExampleModule.NAME) {
        ExampleModule(reactContext)
    } else {
        null
    }

    override fun getReactModuleInfoProvider() = ReactModuleInfoProvider {
        mapOf(
            ExampleModule.NAME to ReactModuleInfo(
                ExampleModule.NAME,
                ExampleModule.NAME,
                canOverrideExistingModule = false,
                needsEagerInit = false,
                isCxxModule = false,
                isTurboModule = true
            )
        )
    }

}