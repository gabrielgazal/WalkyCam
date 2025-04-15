import SwiftUI
import WebRTC

struct RTCVideoRendererView: UIViewRepresentable {
    let videoTrack: RTCVideoTrack?
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var backgroundColor: UIColor = .black
    var mirror: Bool = false
    
    func makeUIView(context: Context) -> RTCMTLVideoView {
        let view = RTCMTLVideoView()
        view.backgroundColor = backgroundColor
        
        switch contentMode {
        case .scaleAspectFill:
            view.videoContentMode = .scaleAspectFill
        case .scaleAspectFit:
            view.videoContentMode = .scaleAspectFit
        default:
            view.videoContentMode = .scaleAspectFill
        }
        
        view.isUserInteractionEnabled = false
        view.transform = mirror ? CGAffineTransform(scaleX: -1.0, y: 1.0) : .identity
        
        return view
    }

    func updateUIView(_ uiView: RTCMTLVideoView, context: Context) {
        videoTrack?.remove(uiView)
        videoTrack?.isEnabled = true
        videoTrack?.add(uiView)
    }
}

// For performance monitoring and debugging
class FrameMetricsRenderer: NSObject, RTCVideoRenderer {
    private var lastFrameTimestamp: CFTimeInterval = 0
    private var frameCount: Int = 0
    private var totalFrames: Int = 0
    private var startTime: CFTimeInterval = 0
    
    override init() {
        super.init()
        startTime = CACurrentMediaTime()
        lastFrameTimestamp = startTime
    }
    
    func setSize(_ size: CGSize) {
        print("📏 Frame size: \(size.width) x \(size.height)")
    }
    
    func renderFrame(_ frame: RTCVideoFrame?) {
        guard let frame = frame else { return }
        
        totalFrames += 1
        frameCount += 1
        
        let currentTime = CACurrentMediaTime()
        let elapsed = currentTime - lastFrameTimestamp
        
        // Log FPS every second
        if elapsed >= 1.0 {
            let fps = Double(frameCount) / elapsed
            let avgFps = Double(totalFrames) / (currentTime - startTime)
            
            print("🔄 Current FPS: \(String(format: "%.1f", fps)) | Avg FPS: \(String(format: "%.1f", avgFps)) | Resolution: \(frame.width)x\(frame.height)")
            
            frameCount = 0
            lastFrameTimestamp = currentTime
        }
    }
}
