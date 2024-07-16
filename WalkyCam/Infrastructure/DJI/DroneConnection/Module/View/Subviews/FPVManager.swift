//
//  FPVManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 06/06/24.
//

import SwiftUI
import DJISDK
import DJIWidget

public enum FPVCaptureMode {
    case record
    case capture
}

public protocol FPVConnectionManagerProtocol {
    var isRecording: Bool { get set }
    var currentRecordingTime: UInt? { get set }
    var captureMode: FPVCaptureMode { get set }
    var view: UIView { get set }
    
    func setupVideoPreviewer()
}

class FPVConnectionManager: NSObject, FPVConnectionManagerProtocol, ObservableObject, DJIVideoFeedListener, DJICameraDelegate, DJIVideoPreviewerFrameControlDelegate {
    @Published var isRecording: Bool = false
    @Published var currentRecordingTime: UInt? = nil
    @Published var captureMode: FPVCaptureMode = .capture
    
    var view: UIView
    var enableBridgeMode: Bool = false
    var bridgeAppIP: String = "10.81.52.50"
    
    public init(
        isRecording: Bool = false,
        currentRecordingTime: UInt? = nil,
        captureMode: FPVCaptureMode = .capture,
        view: UIView = UIView()
    ) {
        self.isRecording = isRecording
        self.currentRecordingTime = currentRecordingTime
        self.captureMode = captureMode
        self.view = view
    }
    
    func setupVideoPreviewer() {
        DJIVideoPreviewer.instance().setView(view)
        let product = DJISDKManager.product()
        
        if ((product?.model == DJIAircraftModelNameA3) || (product?.model == DJIAircraftModelNameN3)
            || (product?.model == DJIAircraftModelNameMatrice600)
            || (product?.model == DJIAircraftModelNameMatrice600Pro)) {
            DJISDKManager.videoFeeder()?.secondaryVideoFeed.add(self, with: nil)
        } else {
            DJISDKManager.videoFeeder()?.primaryVideoFeed.add(self, with: nil)
        }
        DJIVideoPreviewer.instance().start()
        DJIVideoPreviewer.instance().frameControlHandler = self
    }
    
    func resetVideoPreviewer() {
        DJIVideoPreviewer.instance().unSetView()
        let product = DJISDKManager.product()
        
        if ((product?.model == DJIAircraftModelNameA3)
            || (product?.model == DJIAircraftModelNameN3)
            || (product?.model == DJIAircraftModelNameMatrice600)
            || (product?.model == DJIAircraftModelNameMatrice600Pro)) {
            DJISDKManager.videoFeeder()?.secondaryVideoFeed.remove(self)
        } else {
            DJISDKManager.videoFeeder()?.primaryVideoFeed.remove(self)
        }
    }
    
    // MARK: - Delegate Methods
    
    func camera(_ camera: DJICamera, didUpdate cameraState: DJICameraSystemState) {
        isRecording = cameraState.isRecording
        currentRecordingTime = cameraState.isRecording ? cameraState.currentVideoRecordingTimeInSeconds : nil
        captureMode = (cameraState.mode == .shootPhoto) ? .capture : .record
    }
    
    func videoFeed(_ videoFeed: DJIVideoFeed, didUpdateVideoData rawData: Data) {
        let videoData = rawData as NSData
        let videoBuffer = UnsafeMutablePointer<UInt8>.allocate(capacity: videoData.length)
        videoData.getBytes(videoBuffer, length: videoData.length)
        DJIVideoPreviewer.instance().push(videoBuffer, length: Int32(videoData.length))
    }
    
    func parseDecodingAssistInfo(withBuffer buffer: UnsafeMutablePointer<UInt8>!, length: Int32, assistInfo: UnsafeMutablePointer<DJIDecodingAssistInfo>!) -> Bool {
        return DJISDKManager.videoFeeder()?.primaryVideoFeed.parseDecodingAssistInfo(withBuffer: buffer, length: length, assistInfo: assistInfo) ?? false
    }
    
    func isNeedFitFrameWidth() -> Bool {
        let displayName = fetchCamera()?.displayName
        if displayName == DJICameraDisplayNameMavic2ZoomCamera ||
            displayName == DJICameraDisplayNameMavic2ProCamera {
            return true
        }
        return false
    }
    
    func syncDecoderStatus(_ isNormal: Bool) {
        DJISDKManager.videoFeeder()?.primaryVideoFeed.syncDecoderStatus(isNormal)
    }
    
    func decodingDidSucceed(withTimestamp timestamp: UInt32) {
        DJISDKManager.videoFeeder()?.primaryVideoFeed.decodingDidSucceed(withTimestamp: UInt(timestamp))
    }
    
    func decodingDidFail() {
        DJISDKManager.videoFeeder()?.primaryVideoFeed.decodingDidFail()
    }
    
    func fetchCamera() -> DJICamera? {
        guard let product = DJISDKManager.product() else {
            return nil
        }
        if product is DJIAircraft {
            return (product as! DJIAircraft).camera
        }
        if product is DJIHandheld {
            return (product as! DJIHandheld).camera
        }
        return nil
    }
    
    func showAlertViewWithTitle(title: String, withMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
