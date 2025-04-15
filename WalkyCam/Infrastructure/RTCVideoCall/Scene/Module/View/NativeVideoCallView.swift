import SwiftUI
import WebRTC

struct NativeVideoCallView<ViewModel: NativeVideoCallViewModelProtocol, Router: NativeVideoCallRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    @ObservedObject var socketManager = SocketManagerService.shared
    @State var isVideoEnabled = false
    
    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
            ZStack {
                if socketManager.participants.isEmpty {
                    Color.black.edgesIgnoringSafeArea(.all)
                } else {
                    ForEach(socketManager.participants) { participant in
                        if let remoteTrack = WebRTCManager.shared.getRemoteTrack(for: participant.connectionId) {
                            RTCVideoRendererView(videoTrack: remoteTrack)
                                .background(Color.red)
                        }
                    }
                }

                VStack {
                    Spacer()
                    HStack {
                        if let localTrack = WebRTCManager.shared.localVideoTrack {
                            RTCVideoRendererView(videoTrack: localTrack)
                                .frame(width: 100, height: 150)
                                .cornerRadius(8)
                                .padding(8)
                                .background(Color.black.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        Spacer()
                        Button(action: {
                            isVideoEnabled.toggle()
                            WebRTCManager.shared.setVideoEnabled(isVideoEnabled)
                        }) {
                            Image(systemName: isVideoEnabled ? "video.fill" : "video.slash.fill")
                        }
                    }
                }
            }
            .onAppear {
                socketManager.connect()
                socketManager.updateVideocallId(videocallId: "67ede3aff2c817084c0dbd25")
            }
            .onDisappear {
                socketManager.disconnect()
            }
        }
}
