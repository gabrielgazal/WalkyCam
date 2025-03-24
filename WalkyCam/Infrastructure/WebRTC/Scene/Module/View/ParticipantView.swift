//
//  ParticipantView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 24/03/25.
//

import Foundation
import SwiftUI

struct ParticipantView: View {
    
    private let participant: Participant
    
    public init(
        participant: Participant
    ) {
        self.participant = participant
    }
    
    var body: some View {
        Group {
            if let videoTrack = participant.videoTrack {
                VideoView(videoTrack: videoTrack)
                    .frame(width: 250, height: 200)
            } else {
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
                .frame(width: 200, height: 150)
            }
        }
    }
}
