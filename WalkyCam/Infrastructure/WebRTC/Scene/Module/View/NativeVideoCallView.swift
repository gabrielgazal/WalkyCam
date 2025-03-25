import SwiftUI
import WebRTC

struct NativeVideoCallView<ViewModel: NativeVideoCallViewModelProtocol, Router: NativeVideoCallRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    @StateObject private var socketManager = SocketManagerService.shared
    @State private var localTrack: RTCVideoTrack?

    // MARK: - Initialization
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    
    var body: some View {
        VStack {
            // Todo - Botar o video local
            if let localTrack = localTrack {
                VideoView(videoTrack: localTrack)
                    .frame(width: 150, height: 200)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white, lineWidth: 1))
                    .padding()
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
            toolbarView
        }
        .onAppear {
            socketManager.connect()
            socketManager.updateVideocallId(videocallId: viewModel.videoCallId)
            WebRTCManager.shared.startLocalVideo { track in
                self.localTrack = track
            }
        }
        .onDisappear {
            socketManager.disconnect()
        }
        .background {
            Color.negro
                .ignoresSafeArea()
        }
    }
    
    private var toolbarView: some View {
        HStack(
            alignment: .center,
            spacing: 20) {
                HStack(
                    alignment: .center,
                    spacing: 20) {
                        Image(systemName: "microphone.slash.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                        Image(systemName: "video.slash")
                            .resizable()
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                        Image(systemName: "hand.raised.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                        Image(systemName: "person")
                            .resizable()
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .frame(width: 25)
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
}
