package com.just_audio_jni.just_audio_jni;

import android.content.Context;

import com.ryanheise.audioservice.AudioServicePlugin;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.android.FlutterFragmentActivity;


public class MainActivity extends FlutterFragmentActivity {
    @Override
    public FlutterEngine provideFlutterEngine(Context context) {
        return AudioServicePlugin.getFlutterEngine(context);
    }
}