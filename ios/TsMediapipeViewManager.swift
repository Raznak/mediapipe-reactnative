import Foundation
import React

@objc(TsMediapipeViewManager)
class TsMediapipeViewManager: RCTViewManager {

  private var cameraView: CameraView?

  override func view() -> (UIView) {
    let view = CameraView()
    cameraView = view
    return view
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }

  @objc func switchCamera() {
    cameraView?.switchCamera()
  }

  @objc func startRecording(
    _ resolve: RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock
  ) {

    DispatchQueue.main.async {
      guard let cameraView = self.cameraView else {
        reject("NO_VIEW", "CameraView not initialized", nil)
        return
      }

      do {
        try cameraView.startRecording()
        resolve(nil)
      } catch {
        reject("ERR", error.localizedDescription, error)
      }
    }
  }

  @objc func stopRecording(
    _ resolve: RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock
  ) {

    DispatchQueue.main.async {
      guard let cameraView = self.cameraView else {
        reject("NO_VIEW", "CameraView not initialized", nil)
        return
      }

      cameraView.stopRecording { path in
        resolve(path)
      }
    }
  }
}
