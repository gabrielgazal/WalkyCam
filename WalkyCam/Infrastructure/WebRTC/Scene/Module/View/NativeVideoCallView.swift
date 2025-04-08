import SwiftUI
import WebRTC

struct NativeVideoCallView<ViewModel: NativeVideoCallViewModelProtocol, Router: NativeVideoCallRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    @StateObject private var socketManager = SocketManagerService.shared
    @State private var localTrack: RTCVideoTrack?
    
    @State private var isVideoEnabled = false
    @State private var isAudioEnabled = false
    @State private var isHandRaised = false
    @State private var isUserToolbarHidden = false
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    
    var body: some View {
        VStack {
            if let localTrack = localTrack {
                if isVideoEnabled {
                    VideoView(videoTrack: localTrack)
                        .frame(width: 150, height: 200)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white, lineWidth: 1))
                        .padding()
                } else {
                    emptyStateView
                }
            }
            Spacer()
            ScrollView(
                .horizontal,
                showsIndicators: false
            ) {
                HStack(spacing: 0) {
                    ForEach(socketManager.participants, id: \.connectionId) { participant in
                            ParticipantView(participant: participant)
                    }
                }
            }
            .isHidden(isUserToolbarHidden)
            toolbarView
        }
        .onAppear {
            WebRTCManager.shared.startLocalVideo { track in
                self.localTrack = track
                socketManager.connect()
                socketManager.updateVideocallId(videocallId: viewModel.videoCallId)
            }
        }
        .onDisappear {
            socketManager.disconnect()
        }
        .background {
            Color.negro
                .ignoresSafeArea()
        }
        .frame(idealWidth: .infinity)
    }
    
    private var toolbarView: some View {
        HStack(
            alignment: .center,
            spacing: 20) {
                HStack(
                    alignment: .center,
                    spacing: 20) {
                        Asset.Icons.microphone.swiftUIImage
                            .resizable()
                            .foregroundColor(isAudioEnabled ? Color.naranja : Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                            .onTapGesture {
                                isAudioEnabled.toggle()
                            }
                        Image(systemName: "video")
                            .resizable()
                            .foregroundColor(isVideoEnabled ? Color.naranja : Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                            .onTapGesture {
                                isVideoEnabled.toggle()
                                socketManager.updateVideoStatus(isEnabled: isVideoEnabled)
                            }
                        Image(systemName: "hand.raised.fill")
                            .resizable()
                            .foregroundColor(isHandRaised ? Color.naranja : Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                            .onTapGesture {
                                isHandRaised.toggle()
                            }
                        Image(systemName: "person")
                            .resizable()
                            .foregroundColor(isUserToolbarHidden ? Color.white : Color.naranja)
                            .scaledToFit()
                            .frame(width: 25)
                            .onTapGesture {
                                isUserToolbarHidden.toggle()
                            }
                        Image(systemName: "ellipsis")
                            .resizable()
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                    }
                    .padding(15)
                    .background {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.grisOscuro)
                            .frame(height: 50)
                    }
                
                Image(systemName: "phone.circle.fill")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(Color.red)
                    .scaledToFit()
                    .frame(height: 60)
                    .background(Color.blanco.cornerRadius(50))
                    .onTapGesture {
                        router.dismiss()
                    }
            }
    }
    
    private var emptyStateView: some View {
        VStack(
            alignment: .center,
            spacing: 5
        ) {
            ZStack(alignment: .center) {
                Color.black
                Circle()
                    .fill(Color.naranja)
                    .frame(width: 90)
                Image(systemName: "person.circle")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(height: 90)
                    .foregroundColor(Color.blanco)
                VStack {
                    Spacer()
                    Text("Você")
                        .foregroundColor(Color.white)
                        .background {
                            Capsule()
                                .fill(Color.negro.opacity(0.2))
                        }
                }
            }
        }
        .frame(width: 150, height: 200)
    }
}
