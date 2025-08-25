//
//  UpdateVideoCallInput.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 30/07/24.
//

import Foundation

struct UpdateVideoCallInput: Hashable {
    let callId: String
    let date: String
    let startTime: String
    let endTime: String
    let pixelationEnabled: Bool
}
