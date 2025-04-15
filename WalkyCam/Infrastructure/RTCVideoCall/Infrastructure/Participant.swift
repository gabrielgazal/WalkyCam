//
//  Participant.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 14/04/25.
//

import Foundation

class Participant: Identifiable, ObservableObject {
    let id = UUID()
    let connectionId: String
    let userId: String
    let userName: String
    var isHandRaised: Bool = false
    @Published var isVideoEnabled: Bool = true

    init(connectionId: String, userId: String, userName: String, isHandRaised: Bool = false) {
        self.connectionId = connectionId
        self.userId = userId
        self.userName = userName
        self.isHandRaised = isHandRaised
    }
}
