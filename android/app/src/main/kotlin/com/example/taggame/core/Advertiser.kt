package com.example.taggame.core

import android.annotation.SuppressLint
import android.bluetooth.BluetoothManager
import android.bluetooth.le.AdvertiseCallback
import android.bluetooth.le.AdvertiseData
import android.bluetooth.le.AdvertiseSettings
import android.bluetooth.le.BluetoothLeAdvertiser
import android.content.Context
import android.os.ParcelUuid
import android.util.Log
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
        Log.d(TAG, "startService")
        restart(context, zombie)
    }

    private fun restart(context: Context, zombie: Boolean) {
        Log.d(TAG, "restart")
        stopAdvertise()
        startAdvertise(context, zombie)
    }

    private fun startAdvertise(context: Context, zombie: Boolean) {
        Log.d(TAG, "startAdvertise: zombie=$zombie")
        if (!advertiseStarted.compareAndSet(false, true)) {
            return
        }

        Log.d(TAG, "startAdvertise: zombie=$zombie, started")

        val manager = context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        bluetoothLeAdvertiser = manager.adapter.bluetoothLeAdvertiser

        val settings = AdvertiseSettings.Builder()
            .setAdvertiseMode(AdvertiseSettings.ADVERTISE_MODE_LOW_LATENCY)
            .setTxPowerLevel(AdvertiseSettings.ADVERTISE_TX_POWER_ULTRA_LOW)
            .setTimeout(0)
            .build()

        val bytes = byteArrayOf((if (zombie) 1 else 0)) + gameUUID.toString().takeLast(4).toByteArray()
        val data = AdvertiseData.Builder()
            .setIncludeDeviceName(false)
            .setIncludeTxPowerLevel(false)
            .addServiceUuid(ParcelUuid(SERVICE_UUID))
            .addServiceData(ParcelUuid(userUUID), bytes)
            .build()

        advertiseCallback = object : AdvertiseCallback() {

            override fun onStartSuccess(settingsInEffect: AdvertiseSettings?) {
                super.onStartSuccess(settingsInEffect)
                Log.d(TAG, "onStartSuccess")
            }

            override fun onStartFailure(errorCode: Int) {
                super.onStartFailure(errorCode)
                Log.e(TAG, "onStartFailure. ErrorCode=$errorCode")
                advertiseStarted.set(false)
            }
        }

        bluetoothLeAdvertiser.startAdvertising(settings, data, advertiseCallback)
    }

    fun stopService() {
        Log.d(TAG, "stopService")
        stopAdvertise()
    }

    private fun stopAdvertise() {
        Log.d(TAG, "stopAdvertise")
        if (!advertiseStarted.compareAndSet(true, false)) {
            return
        }
        Log.d(TAG, "stopAdvertise: stop")
        bluetoothLeAdvertiser.stopAdvertising(advertiseCallback)
    }

    companion object {
        private const val TAG : String = "Advertiser"

        val SERVICE_UUID: UUID =  UUID.fromString("0000b81d-0000-1000-8000-00805f9b34fb")
    }
}