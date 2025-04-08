import SwiftUI
import WebRTC

struct ParticipantView: View {
    
    @ObservedObject private var participant: Participant
    
    public init(
        participant: Participant
    ) {
        self.participant = participant
    }
    
    var body: some View {
        Group {
            if let videoTrack = participant.videoTrack {
                if participant.isVideoEnabled {
                    VideoView(videoTrack: videoTrack)
                } else {
                    emptyStateView
                }
            } else {
                emptyStateView
            }
        }
        .frame(width: 200, height: 150)
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
                    Text(participant.userName)
                        .foregroundColor(Color.white)
                        .background {
                            Capsule()
                                .fill(Color.negro.opacity(0.2))
                        }
                }
            }
        }
    }
}
