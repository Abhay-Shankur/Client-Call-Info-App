package com.callinfo.application.call_info

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.telephony.PhoneStateListener
import android.telephony.TelephonyManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

class CallReceiver : BroadcastReceiver() {
    private val CHANNEL_NAME = "com.callinfo.application.call_info/callType"

    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.action
        if (action == TelephonyManager.ACTION_PHONE_STATE_CHANGED) {
            val telephonyManager = context.getSystemService(Context.TELEPHONY_SERVICE) as? TelephonyManager
            telephonyManager?.listen(object : PhoneStateListener() {
                override fun onCallStateChanged(state: Int, phoneNumber: String?) {
                    super.onCallStateChanged(state, phoneNumber)
                    val callType = getCallType(state)
                    sendCallTypeToFlutter(context, callType)
                }
            }, PhoneStateListener.LISTEN_CALL_STATE)
        }
    }

    private fun getCallType(state: Int): String {
        return when (state) {
//            Telepho
            TelephonyManager.CALL_STATE_RINGING -> "Incoming"
            TelephonyManager.CALL_STATE_OFFHOOK -> "Outgoing"
            TelephonyManager.CALL_STATE_IDLE -> "Idle"
            else -> "Unknown"
        }
    }

    private fun sendCallTypeToFlutter(context: Context, callType: String) {
        val flutterEngine = FlutterEngine(context)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
        channel.invokeMethod("receiveCallType", callType)
    }
}
