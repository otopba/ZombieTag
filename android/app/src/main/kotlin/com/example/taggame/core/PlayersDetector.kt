package com.example.bledetector.core

import android.content.Context
import java.util.UUID

class PlayersDetector(
    gameUUID: UUID,
    userUUID: UUID,
    updatesCallback: Scanner.UpdatesCallback
) {

    private val advertiser = Advertiser(gameUUID, userUUID)
    private val scanner = Scanner(gameUUID, updatesCallback)

    fun start(context: Context, zombie: Boolean = false) {
        advertiser.startService(
            context = context,
            zombie = zombie
        )
        scanner.startService(context)
    }

    fun stop() {
        advertiser.stopService()
        scanner.stopService()
    }

    fun restartAdvertising(context: Context, zombie: Boolean = false) {
        advertiser.stopService()
        advertiser.startService(context, zombie)
    }
}