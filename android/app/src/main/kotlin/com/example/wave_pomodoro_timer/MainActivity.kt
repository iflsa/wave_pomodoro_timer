package com.example.wave_pomodoro_timer

<<<<<<< HEAD
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
=======
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
>>>>>>> b09f3ef99d35d5538c708ebdf4094df9d4b08f46
}
