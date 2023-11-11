package com.example.taggame

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private val channel = "com.example/my_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel)
            .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
                if (call.method == "getNativeData") {
                    val nativeData = "Native Data from Android"
                    result.success(nativeData)
                } else {
                    result.notImplemented()
                }
            }
    }
}
