package com.example.taggame

import com.example.taggame.core.PlayersDetector
import com.example.taggame.core.Scanner
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.UUID


class MainActivity : FlutterActivity(), Scanner.UpdatesCallback {
    private val channel = "com.example/my_channel"

    private var playersDetector: PlayersDetector? = null
    private var flutterEngine: FlutterEngine? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        this.flutterEngine = flutterEngine

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channel
        ).setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
            when (call.method) {
                "startGame" -> {
                    val argumentsArray = call.arguments as List<String>
                    val gameUUID = UUID.fromString(argumentsArray[0])
                    val userUUID = UUID.fromString(argumentsArray[1])

                    playersDetector?.stop()

                    playersDetector = PlayersDetector(
                        gameUUID = gameUUID,
                        userUUID = userUUID,
                        updatesCallback = this
                    ).also {
                        it.start(this)
                    }
                    result.success("OK")
                }

                "endGame" -> {
                    playersDetector?.stop()

                    result.success("OK")
                }

                "restartAdvertising" -> {
                    playersDetector?.restartAdvertising(this)
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    override fun onPlayersDetected(items: List<Scanner.DetectedPlayer>) {
        val ids = items.map { it.id }

        MethodChannel(
            flutterEngine!!.dartExecutor.binaryMessenger,
            channel
        ).invokeMethod("onPlayersDetected", ids, object : MethodChannel.Result {
            override fun success(result: Any?) {
                println("success: $result")
            }

            override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
                println("error: errorCode = ${errorCode}, errorMessage = ${errorMessage}, errorDetails = $errorDetails")
            }

            override fun notImplemented() {
                println("notImplemented")
            }
        })
    }

}
