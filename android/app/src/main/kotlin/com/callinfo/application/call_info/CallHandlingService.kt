package com.callinfo.application.call_info

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.telephony.PhoneStateListener
import android.telephony.TelephonyManager
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat

class CallHandlingService : Service() {

    private val CHANNEL_NAME = "com.callinfo.application.call_info/callType"

    private val IS_INCOMING = false
    private val CHANNEL_ID = "ForegroundServiceChannel"
    private val NOTIFICATION_ID = 1
    private val NOTIFY_STATUS_ID =2

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
                    IS_INCOMING = true
                    sendCallTypeToFlutter("Incoming")
                    showNotification("Incoming call", "You have an incoming call")
                }
                TelephonyManager.CALL_STATE_OFFHOOK -> {
                    // Call in progress
                    sendCallTypeToFlutter("Outgoing")
                    showNotification("Incoming call", "You have an incoming call")
                }
                TelephonyManager.CALL_STATE_IDLE -> {
                    // Call ended
                    if (incomingNumber != null && IS_INCOMING) {
                        sendCallTypeToFlutter("Missed")
                        showNotification("Missed call", "You missed a call")
                    } else {
                        sendCallTypeToFlutter("Idle")
                        showNotification("Missed call", "You missed a call")
                    }
                }
            }
        }
    }

    private fun sendCallTypeToFlutter(callType: String) {
        // Send call type to Flutter using MethodChannel or any other suitable mechanism
        // For example:
//         val intent = Intent("com.example.call_detection.CALL_TYPE")
//         intent.putExtra("callType", callType)
//         sendBroadcast(intent)
    }

    private fun showNotification(title: String, content: String) {
        val notificationIntent = Intent(this, MainActivity::class.java)
        val pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent, PendingIntent.FLAG_UPDATE_CURRENT)

        val notification = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle(title)
            .setContentText(content)
            .setSmallIcon(android.R.drawable.ic_dialog_info)
            .setContentIntent(pendingIntent)
            .setAutoCancel(true)
            .build()

        val notificationManager = NotificationManagerCompat.from(this)
        notificationManager.notify(NOTIFY_STATUS_ID, notification)
    }

    override fun onBind(intent: Intent): IBinder? {
        return null
    }
}
