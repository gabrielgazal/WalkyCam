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
        ZStack {
            // Background
            Color.black
            
            // Content
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
            
            // Name label overlay at bottom
            VStack {
                Spacer()
                HStack {
                    Text(participant.userName)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(Color.black.opacity(0.6))
                        )
                    Spacer()
                    
                    // Audio indicator
                    if !participant.isAudioEnabled {
                        Image(systemName: "mic.slash.fill")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Circle().fill(Color.red.opacity(0.8)))
                    }
                }
                .padding(8)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipped()
    }
    
    private var emptyStateView: some View {
        ZStack {
            Color.grisOscuro
            
            VStack(spacing: 8) {
                Circle()
                    .fill(Color.naranja)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    )
            }
        }
    }
}
