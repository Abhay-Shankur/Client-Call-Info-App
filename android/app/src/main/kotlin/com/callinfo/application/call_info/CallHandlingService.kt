package com.callinfo.application.call_info

import android.app.*
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.telephony.PhoneStateListener
import android.telephony.TelephonyManager
import androidx.core.app.NotificationCompat
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

class CallHandlingService : Service() {

    private val CHANNEL_NAME = "com.callinfo.application.call_info/callType"
    private val CHANNEL_ID = "ForegroundServiceChannel"
    private val NOTIFICATION_ID = 1
    private var isIncoming = false
    private var isOngoing = false


    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent != null) {
            val action = intent.action
            if (action != null && action == "START_FOREGROUND") {
                startForegroundService()
            }
        }
        return super.onStartCommand(intent, flags, startId)
    }

    private fun startForegroundService() {
        val notification = createNotification()
        startForeground(NOTIFICATION_ID, notification)
        listenForCallEvents()
    }

    private fun createNotification(): Notification {
        createNotificationChannel()

        return NotificationCompat.Builder(this, CHANNEL_ID)
                .setContentTitle("Call Handling Service")
                .setContentText("Listening for call events")
                .setSmallIcon(android.R.drawable.ic_dialog_info) // Use Android's built-in icon
                .build()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val serviceChannel = NotificationChannel(
                    CHANNEL_ID,
                    "Foreground Service Channel",
                    NotificationManager.IMPORTANCE_DEFAULT
            )
            val manager = getSystemService(NotificationManager::class.java)
            manager?.createNotificationChannel(serviceChannel)
        }
    }

    private fun listenForCallEvents() {
        val telephonyManager = getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
        telephonyManager.listen(callStateListener, PhoneStateListener.LISTEN_CALL_STATE)
    }

    private val callStateListener = object : PhoneStateListener() {
        override fun onCallStateChanged(state: Int, incomingNumber: String?) {
            super.onCallStateChanged(state, incomingNumber)
            when (state) {
                TelephonyManager.CALL_STATE_RINGING -> {
                    // Incoming call
                    isIncoming = true
                    if (incomingNumber != null) {
                        sendCallTypeToFlutter("Incoming", incomingNumber)
                    }
                }
                TelephonyManager.CALL_STATE_OFFHOOK -> {
                    // Call in progress
                    isOngoing = true
                    if (incomingNumber != null) {

                        sendCallTypeToFlutter("Outgoing", incomingNumber)
                    }
                }
                TelephonyManager.CALL_STATE_IDLE -> {
                    // Call ended
//                    android.util.Log.w("TAG", "onCallStateChanged: "+isIncoming.toString()+isOngoing.toString(),)
                    android.util.Log.w("TAG", "onCallStateChanged: "+incomingNumber.toString(),)
                    if (isIncoming.and(isOngoing)) {
                        if (incomingNumber != null) {
                            sendCallTypeToFlutter("Ongoing", incomingNumber)
                        }
                    } else if (isIncoming && isOngoing.not()) {
                        if (incomingNumber != null) {
                            sendCallTypeToFlutter("Missed", incomingNumber)
                        }

                    }

                    isOngoing=false
                    isIncoming=false
//                    if (incomingNumber != null) {
//                        sendCallTypeToFlutter("Missed")
//                    } else {
//                        sendCallTypeToFlutter("Idle")
//                    }
                }
            }
        }
    }

    private fun sendCallTypeToFlutter(callType: String, phoneNumber: String) {
        // Initialize a FlutterEngine instance
        val flutterEngine = FlutterEngine(this)

        // Execute the Dart entry point
        flutterEngine.dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        )

        // Create a MethodChannel with the specified channel name
        val channel = MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                CHANNEL_NAME
        )

        // Create a map to pass both callType and phoneNumber to Flutter
        val arguments = mapOf(
                "callType" to callType,
                "phoneNumber" to phoneNumber
        )
        // Invoke the method on the MethodChannel to send the callType to Flutter
//        channel.invokeMethod("receiveCallType", callType)
        channel.invokeMethod("receiveCallType", arguments)
    }

    override fun onBind(intent: Intent): IBinder? {
        return null
    }
}
