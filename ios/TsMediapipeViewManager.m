#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE (TsMediapipeViewManager, RCTViewManager)

// Props envoyées à la View
RCT_EXPORT_VIEW_PROPERTY(width, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(height, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(onLandmark, RCTDirectEventBlock)

RCT_EXPORT_VIEW_PROPERTY(face, BOOL)
RCT_EXPORT_VIEW_PROPERTY(leftArm, BOOL)
RCT_EXPORT_VIEW_PROPERTY(rightArm, BOOL)
RCT_EXPORT_VIEW_PROPERTY(leftWrist, BOOL)
RCT_EXPORT_VIEW_PROPERTY(rightWrist, BOOL)
RCT_EXPORT_VIEW_PROPERTY(torso, BOOL)
RCT_EXPORT_VIEW_PROPERTY(leftLeg, BOOL)
RCT_EXPORT_VIEW_PROPERTY(rightLeg, BOOL)
RCT_EXPORT_VIEW_PROPERTY(leftAnkle, BOOL)
RCT_EXPORT_VIEW_PROPERTY(rightAnkle, BOOL)
RCT_EXPORT_VIEW_PROPERTY(frameLimit, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(activeLandmarks, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(activeLandmarkRadius, NSNumber)

// Méthodes natives
RCT_EXTERN_METHOD(switchCamera)

RCT_EXTERN_METHOD(startRecording : (RCTPromiseResolveBlock)
                      resolve rejecter : (RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(stopRecording : (RCTPromiseResolveBlock)
                      resolve rejecter : (RCTPromiseRejectBlock)reject)

@end
