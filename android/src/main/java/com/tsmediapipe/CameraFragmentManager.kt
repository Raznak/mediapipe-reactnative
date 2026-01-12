package com.tsmediapipe

import com.tsmediapipe.fragment.CameraFragment

object CameraFragmentManager {
  var cameraFragment: CameraFragment? = null
}

fun startRecording(path: String) {
  val videoCapture = videoCapture ?: return

  val file = File(path)
  val outputOptions = FileOutputOptions.Builder(file).build()

  recording = videoCapture.output
    .prepareRecording(context, outputOptions)
    .start(ContextCompat.getMainExecutor(context)) { event ->
      if (event is VideoRecordEvent.Finalize) {
        // Optionnel: callback JS
      }
    }
}

fun stopRecording() {
  recording?.stop()
  recording = null
}

