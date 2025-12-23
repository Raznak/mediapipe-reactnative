package com.tsmediapipe;

import android.util.Log;

import androidx.appcompat.app.AppCompatActivity;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class MediaPipeNativeModule extends ReactContextBaseJavaModule {

  public MediaPipeNativeModule(ReactApplicationContext reactContext) {
    super(reactContext);

    ReactContextProvider.reactApplicationContext = reactContext;
  }

  @Override
  public String getName() {
    return "MediaPipeNativeModule";
  }

  @ReactMethod
  public void switchCameraMethod() {
    Log.d("switchCameraMethod", "Create event called with name: ");
    AppCompatActivity activity = (AppCompatActivity) getCurrentActivity();

    if (activity != null && CameraFragmentManager.INSTANCE.getCameraFragment() != null) {
      activity.runOnUiThread(new Runnable() {
        @Override
        public void run() {
          CameraFragmentManager.INSTANCE.getCameraFragment().switchCamera();
        }
      });
    } else {
      Log.e("switchCameraMethod", "CameraFragment is not initialized");
    }
  }

  @ReactMethod
  public void startRecording(String path) {
    if (cameraFragmentManager == null) return;

    cameraFragmentManager.startRecording(path);
  }

  @ReactMethod
  public void stopRecording() {
    if (cameraFragmentManager == null) return;

    cameraFragmentManager.stopRecording();
  }
}
