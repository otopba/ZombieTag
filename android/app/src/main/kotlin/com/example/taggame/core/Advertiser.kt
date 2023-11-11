package com.example.bledetector.core

import android.annotation.SuppressLint
import android.bluetooth.BluetoothManager
import android.bluetooth.le.AdvertiseCallback
import android.bluetooth.le.AdvertiseData
import android.bluetooth.le.AdvertiseSettings
import android.bluetooth.le.BluetoothLeAdvertiser
import android.content.Context
import android.os.ParcelUuid
import android.widget.Toast
import java.util.UUID
import java.util.concurrent.atomic.AtomicBoolean

@SuppressLint("MissingPermission")
class Advertiser(
    private val gameUUID: UUID,
    private val userUUID: UUID,
) {

    private val advertiseStarted = AtomicBoolean(false)
    private lateinit var bluetoothLeAdvertiser: BluetoothLeAdvertiser
    private lateinit var advertiseCallback: AdvertiseCallback

    fun startService(context: Context, zombie: Boolean) {
        restart(context, zombie)
    }

    private fun restart(context: Context, zombie: Boolean) {
        stopAdvertise()
        startAdvertise(context, zombie)
    }

    private fun startAdvertise(context: Context, zombie: Boolean) {
        if (!advertiseStarted.compareAndSet(false, true)) {
            return
        }

        val manager = context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        bluetoothLeAdvertiser = manager.adapter.bluetoothLeAdvertiser

        val settings = AdvertiseSettings.Builder()
            .setAdvertiseMode(AdvertiseSettings.ADVERTISE_MODE_LOW_LATENCY)
            .setTxPowerLevel(AdvertiseSettings.ADVERTISE_TX_POWER_ULTRA_LOW)
            .setTimeout(0)
            .build()

        val data = AdvertiseData.Builder()
            .setIncludeDeviceName(false)
            .setIncludeTxPowerLevel(false)
            .addServiceUuid(ParcelUuid(gameUUID))
            .addServiceData(ParcelUuid(userUUID), byteArrayOf((if (zombie) 1 else 0)))
            .build()

        advertiseCallback = object : AdvertiseCallback() {

            override fun onStartSuccess(settingsInEffect: AdvertiseSettings?) {
                super.onStartSuccess(settingsInEffect)
                //Toast.makeText(context, "Start succeed", Toast.LENGTH_SHORT).show()
            }

            override fun onStartFailure(errorCode: Int) {
                super.onStartFailure(errorCode)
                //Toast.makeText(context, "Advertise start failed. ErrorCode=$errorCode", Toast.LENGTH_SHORT).show()
                advertiseStarted.set(false)
            }
        }

        bluetoothLeAdvertiser.startAdvertising(settings, data, advertiseCallback)
    }

    fun stopService() {
        stopAdvertise()
    }

    private fun stopAdvertise() {
        if (!advertiseStarted.compareAndSet(true, false)) {
            return
        }
        bluetoothLeAdvertiser.stopAdvertising(advertiseCallback)
    }
}