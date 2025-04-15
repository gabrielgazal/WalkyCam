import SwiftUI
import WebRTC

struct NativeVideoCallView<ViewModel: NativeVideoCallViewModelProtocol, Router: NativeVideoCallRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    @ObservedObject var socketManager = SocketManagerService.shared
    @State var isVideoEnabled = false
    @State var isAudioEnabled = false
    @State var isUsingFrontCamera = true
    
    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        ZStack {
            // Remote video grid
            if socketManager.participants.isEmpty {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Text("Waiting for participants to join...")
                        .foregroundColor(.white)
                    Spacer()
                }
            } else {
                GeometryReader { geometry in
                    let isPortrait = geometry.size.height > geometry.size.width
                    let participants = socketManager.participants
                    
                    // Adapt grid based on number of participants and orientation
                    if participants.count == 1 {
                        // Just one remote participant - full screen
                        participantView(for: participants[0])
                    } else if participants.count <= 4 {
                        // 2-4 participants - 2x2 grid
                        VStack(spacing: 2) {
                            HStack(spacing: 2) {
                                if participants.count > 0 {
                                    participantView(for: participants[0])
                                }
                                if participants.count > 1 {
                                    participantView(for: participants[1])
                                }
                            }
                            HStack(spacing: 2) {
                                if participants.count > 2 {
                                    participantView(for: participants[2])
                                }
                                if participants.count > 3 {
                                    participantView(for: participants[3])
                                }
                            }
                        }
                    } else {
                        // For more participants, use a scrollable grid
                        ScrollView {
                            LazyVGrid(columns: [
                                GridItem(.flexible(), spacing: 2),
                                GridItem(.flexible(), spacing: 2)
                            ], spacing: 2) {
                                ForEach(participants) { participant in
                                    participantView(for: participant)
                                        .aspectRatio(isPortrait ? 3/4 : 4/3, contentMode: .fill)
                                }
                            }
                            .padding(2)
                        }
                    }
                }
            }

            // Local video preview and controls
            VStack {
                Spacer()
                
                // Camera controls
                HStack {
                    // Local video preview
                    if let localTrack = WebRTCManager.shared.localVideoTrack {
                        RTCVideoRendererView(
                            videoTrack: localTrack,
                            contentMode: .scaleAspectFill,
                            mirror: isUsingFrontCamera
                        )
                        .frame(width: 100, height: 150)
                        .cornerRadius(8)
                        .padding(8)
                        .background(Color.black.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    Spacer()
                    
                    // Controls row
                    HStack(spacing: 20) {
                        // Video toggle
                        Button(action: {
                            isVideoEnabled.toggle()
                            WebRTCManager.shared.setVideoEnabled(isVideoEnabled)
                        }) {
                            Image(systemName: isVideoEnabled ? "video.fill" : "video.slash.fill")
                                .font(.system(size: 24))
                                .padding()
                                .background(Circle().fill(isVideoEnabled ? Color.green : Color.red))
                                .foregroundColor(.white)
                        }
                        
                        // Camera switch
                        Button(action: {
                            isUsingFrontCamera.toggle()
                            WebRTCManager.shared.switchCamera()
                        }) {
                            Image(systemName: "camera.rotate.fill")
                                .font(.system(size: 24))
                                .padding()
                                .background(Circle().fill(Color.blue))
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                }
                .padding(.bottom)
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
    
    // Helper function to create a view for each participant
    @ViewBuilder
    private func participantView(for participant: Participant) -> some View {
        ZStack {
            if let remoteTrack = WebRTCManager.shared.getRemoteTrack(for: participant.connectionId) {
                if participant.isVideoEnabled {
                    RTCVideoRendererView(videoTrack: remoteTrack)
                } else {
                    // Video disabled placeholder
                    Color.black
                    VStack {
                        Image(systemName: "video.slash.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                        Text(participant.userName)
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.top)
                    }
                }
            } else {
                // No video track placeholder
                Color.gray
                Text("Loading...")
                    .foregroundColor(.white)
            }
            
            // Participant info overlay
            VStack {
                HStack {
                    Text(participant.userName)
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(4)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(4)
                    
                    Spacer()
                    
                    if participant.isHandRaised {
                        Image(systemName: "hand.raised.fill")
                            .foregroundColor(.yellow)
                            .padding(4)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(4)
                    }
                }
                .padding(8)
                
                Spacer()
            }
        }
    }
}
