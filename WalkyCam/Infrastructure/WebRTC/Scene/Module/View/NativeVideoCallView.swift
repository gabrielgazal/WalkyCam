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
    @State private var isFeatureToolbarHidden = false
    @State private var isDirectionsViewHidden = false

    // MARK: - Initialization
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                // Dynamic participants layout
                dynamicParticipantsLayout
                    .isHidden(isUserToolbarHidden)
                
                Spacer()
                
                // Toolbar at bottom
                toolbarView
                    .padding(.bottom, 20)
            }
            VStack {
                HStack {
                    featureView
                    Spacer()
                }
                Spacer()
            }
        }
        .onAppear {
            WebRTCManager.shared.startLocalVideo { track in
                self.localTrack = track
                WebRTCManager.shared.toggleVideo(enabled: false)
                WebRTCManager.shared.toggleAudio(enabled: false)
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
                .frame(idealWidth: .infinity)
        }
        .navigationBarBackButtonHidden()
    }
    
    private var featureView: some View {
        VStack(
            alignment: .center,
            spacing: 20) {
                Image(systemName: isFeatureToolbarHidden ? "chevron.right" : "chevron.left")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(Color.naranja)
                    .onTapGesture {
                        withAnimation {
                            isFeatureToolbarHidden.toggle()
                        }
                    }
                Group {
                    Image(Asset.Icons.directions.name)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(isDirectionsViewHidden ? Color.white : Color.naranja)
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .clipped()
                        .onTapGesture {
                            isDirectionsViewHidden.toggle()
                        }
                    
                    Image(Asset.Icons.location.name)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.white)
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .clipped()
                    
                    Image(Asset.Icons.ar.name)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.white)
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .clipped()
                    
                    Image(Asset.Icons.pixelation.name)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.white)
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .clipped()
                    
                    Image(Asset.Icons.drone.name)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.white)
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .clipped()
                    
                    Image(Asset.Icons.scan3D.name)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.white)
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .clipped()
                    
                    Image(Asset.Icons.iot.name)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.white)
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .clipped()
                    
                    Image(Asset.Icons.aiAnalysis.name)
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(Color.white)
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .clipped()
                }
                .isHidden(isFeatureToolbarHidden)
            }
            .padding(15)
            .background {
                Rectangle()
                    .fill(Color.negro.opacity(0.8))
                    .frame(width: 50)
                    .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
            }
    }
    
    @ViewBuilder
    private var dynamicParticipantsLayout: some View {
        let participantCount = socketManager.participants.count
        
        switch participantCount {
        case 0:
            emptyCallView
        case 1:
            singleParticipantView
        case 2:
            twoParticipantsView
        default:
            googleMeetStyleGrid
        }
    }
    
    // Single participant - full screen
    private var singleParticipantView: some View {
        GeometryReader { geometry in
            if let participant = socketManager.participants.first {
                ParticipantView(participant: participant)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
    
    // Two participants - vertical stack
    private var twoParticipantsView: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                ForEach(socketManager.participants, id: \.connectionId) { participant in
                    ParticipantView(participant: participant)
                        .frame(height: (geometry.size.height - 12) / 2)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white.opacity(0.3), lineWidth: 2)
                        )
                }
            }
            .padding(.horizontal, 12)
        }
    }
    
    // 3+ participants - Google Meet style grid
    private var googleMeetStyleGrid: some View {
        GeometryReader { geometry in
            let participantCount = socketManager.participants.count
            let layout = calculateGoogleMeetLayout(for: participantCount, size: geometry.size)
            
            ScrollView {
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: layout.columns),
                    spacing: 8
                ) {
                    ForEach(socketManager.participants, id: \.connectionId) { participant in
                        ParticipantView(participant: participant)
                            .frame(height: layout.itemHeight)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 2)
                            )
                    }
                }
                .padding(8)
            }
        }
    }
    
    private var emptyCallView: some View {
        VStack {
            Spacer()
            Image(systemName: "video.slash")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            Text("Aguardando participantes...")
                .font(.title3)
                .foregroundColor(.gray)
                .padding(.top, 16)
            Spacer()
        }
    }
    
    // Calculate Google Meet-style layout
    private func calculateGoogleMeetLayout(for count: Int, size: CGSize) -> (columns: Int, itemHeight: CGFloat) {
        let spacing: CGFloat = 8
        let padding: CGFloat = 16
        let availableWidth = size.width - padding
        let availableHeight = size.height - padding
        
        // Determine optimal columns based on participant count
        let columns: Int
        let rows: Int
        
        switch count {
        case 3:
            columns = 2
            rows = 2
        case 4:
            columns = 2
            rows = 2
        case 5...6:
            columns = 3
            rows = 2
        case 7...9:
            columns = 3
            rows = 3
        case 10...12:
            columns = 4
            rows = 3
        default:
            columns = 4
            rows = Int(ceil(Double(count) / 4.0))
        }
        
        // Calculate item height maintaining 16:9 aspect ratio
        let itemWidth = (availableWidth - CGFloat(columns - 1) * spacing) / CGFloat(columns)
        let idealHeight = itemWidth * 9 / 16
        
        // Make sure items fit in available height
        let maxHeight = (availableHeight - CGFloat(rows - 1) * spacing) / CGFloat(min(rows, Int(ceil(Double(count) / Double(columns)))))
        let itemHeight = min(idealHeight, maxHeight)
        
        return (columns, itemHeight)
    }
    
    private var toolbarView: some View {
        HStack(
            alignment: .center,
            spacing: 20) {
                HStack(
                    alignment: .center,
                    spacing: 20) {
                        Image(isAudioEnabled ? Asset.Icons.microphone.name : Asset.Icons.noMicrophone.name)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(isAudioEnabled ? Color.naranja : Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                            .onTapGesture {
                                isAudioEnabled.toggle()
                                WebRTCManager.shared.toggleAudio(enabled: isAudioEnabled)
                                socketManager.updateAudioStatus(isEnabled: isAudioEnabled)
                            }
                        Image(isVideoEnabled ? Asset.Icons.video.name : Asset.Icons.noVideo.name)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(isVideoEnabled ? Color.naranja : Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                            .onTapGesture {
                                isVideoEnabled.toggle()
                                WebRTCManager.shared.toggleVideo(enabled: isVideoEnabled)
                                socketManager.updateVideoStatus(isEnabled: isVideoEnabled)
                            }
                        Image(systemName: "hand.raised.fill")
                            .resizable()
                            .foregroundColor(isHandRaised ? Color.naranja : Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                            .onTapGesture {
                                isHandRaised.toggle()
                                socketManager.updateHandRaiseStatus(isHandRaised: isHandRaised)
                            }
                        Image(systemName: "arrow.triangle.2.circlepath.camera")
                            .resizable()
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .frame(width: 25)
                            .onTapGesture {
                                WebRTCManager.shared.switchCamera()
                            }
//                        Image(systemName: "person")
//                            .resizable()
//                            .foregroundColor(isUserToolbarHidden ? Color.white : Color.naranja)
//                            .scaledToFit()
//                            .frame(width: 25)
//                            .onTapGesture {
//                                isUserToolbarHidden.toggle()
//                            }
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
