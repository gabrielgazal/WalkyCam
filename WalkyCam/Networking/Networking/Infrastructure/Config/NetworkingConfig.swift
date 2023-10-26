//
//  NetworkingConfig.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 25/10/23.
//

import Foundation

public final class NetworkingConfig {

    public static let shared = NetworkingConfig()
    public var delegate: NetworkDelegateProtocol?
    public var deviceId: String?

    public func configure(
        networkDelegate: NetworkDelegateProtocol?,
        deviceId: String?
    ) {
        self.delegate = networkDelegate
        self.deviceId = deviceId
    }
}
