package com.callinfo.application.call_info

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onStart() {
        super.onStart()
        val serviceIntent = Intent(this, CallHandlingService::class.java)
        serviceIntent.action = "START_FOREGROUND"
        startService(serviceIntent)
    }
}
