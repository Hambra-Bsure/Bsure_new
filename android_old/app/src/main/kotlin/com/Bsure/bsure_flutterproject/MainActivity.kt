package com.bsure

import io.flutter.embedding.android.FlutterActivity

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry.PluginRegistrantCallback


class MainActivity : FlutterActivity() {
    @Override
    fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine?) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        // Initialize SMS autofill
        MethodChannel(
            getFlutterEngine().getDartExecutor().getBinaryMessenger(),
            "dev.fluttercommunity.plus/sms_autofill"
        ).setMethodCallHandler { call, result -> }
    }
}


