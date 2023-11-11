package com.example.bledetector.core

import android.annotation.SuppressLint
import android.bluetooth.BluetoothManager
import android.bluetooth.le.BluetoothLeScanner
import android.bluetooth.le.ScanCallback
import android.bluetooth.le.ScanFilter
import android.bluetooth.le.ScanResult
import android.bluetooth.le.ScanSettings
import android.bluetooth.le.ScanSettings.MATCH_MODE_AGGRESSIVE
import android.bluetooth.le.ScanSettings.SCAN_MODE_LOW_LATENCY
import android.content.Context
import android.os.ParcelUuid
import android.util.Log
import java.util.UUID
import java.util.concurrent.atomic.AtomicBoolean

@SuppressLint("MissingPermission")
class Scanner(
    private val gameUUID: UUID,
    private val updatesCallback: UpdatesCallback
) {

    private val scanStarted = AtomicBoolean(false)

    private lateinit var bluetoothLeScanner: BluetoothLeScanner
    private lateinit var scanCallback: ScanCallback

    fun startService(context: Context) {
        if (!scanStarted.compareAndSet(false, true)) {
            return
        }

        val manager = context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        bluetoothLeScanner = manager.adapter.bluetoothLeScanner

        val scanSettings = ScanSettings.Builder()
            .setMatchMode(MATCH_MODE_AGGRESSIVE)
            .setScanMode(SCAN_MODE_LOW_LATENCY)
            .setReportDelay(0)
            .build()

        val scanFilter = ScanFilter.Builder()
            .setServiceUuid(ParcelUuid(gameUUID))
            .build()

        scanCallback = object : ScanCallback() {

            private fun itemFromScanResult(result: ScanResult?): DetectedPlayer? {
                result ?: return null
                val scanRecord = result.scanRecord ?: return null
                val serviceData = scanRecord.serviceData ?: return null

                val (parcelUuid, data) = serviceData.entries.first()
                val id = parcelUuid.toString()
                return DetectedPlayer(
                    id = id,
                    isZombie = data[0].toInt() == 1,
                    signalPower = result.rssi
                )
            }

            override fun onScanResult(callbackType: Int, result: ScanResult?) {
                result ?: return
                val detectedItem = itemFromScanResult(result) ?: return
                val items = listOf(detectedItem)
                updatesCallback.onPlayersDetected(items)
                Log.d(TAG, "found items: $items")
            }

            override fun onBatchScanResults(results: MutableList<ScanResult>?) {
                results ?: return
                val items = results.mapNotNull { itemFromScanResult(it) }
                updatesCallback.onPlayersDetected(items)
            }

            override fun onScanFailed(errorCode: Int) {
                //Toast.makeText(context, "Scan failed. ErrorCode=$errorCode", Toast.LENGTH_LONG).show()
                scanStarted.set(false)
            }
        }

        bluetoothLeScanner.startScan(listOf(scanFilter), scanSettings, scanCallback)
    }

    fun stopService() {
        if (!scanStarted.compareAndSet(true, false)) {
            return
        }

        bluetoothLeScanner.stopScan(scanCallback)
    }

    interface UpdatesCallback {
        fun onPlayersDetected(items: List<DetectedPlayer>)
    }

    class DetectedPlayer(
        val id: String,
        val isZombie: Boolean,
        val signalPower: Int
    )

    companion object {
        const val TAG: String = "Scanner"
    }
}