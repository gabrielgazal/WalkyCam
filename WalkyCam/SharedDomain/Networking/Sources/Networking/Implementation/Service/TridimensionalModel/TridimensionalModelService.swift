//
//  File.swift
//
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Combine
import Moya
import Foundation
import CombineMoya

final class TridimensionalModelService: TridimensionalModelServiceProtocol {
    // MARK: - Dependencies

    private let provider: MoyaProvider<TridimensionalModelRouter>
    // MARK: - Initialization

    public convenience init() {
        self.init(provider: .default)
    }

    init(provider: MoyaProvider<TridimensionalModelRouter>) {
        self.provider = provider
    }

    // MARK: - Public API
    
    func generateModelFromImages(userId: String, images: [Data], completion: @escaping Completion) {
        provider.request(
            .generateModelFromImages(
                userId: userId,
                images: images
            ),
            completion: completion
        )
    }
    
    func generateModelFromVideo(userId: String, video: Data, completion: @escaping Completion) {
        provider.request(
            .generateModelFromVideo(
                userId: userId,
                video: video
            ),
            completion: completion
        )
    }
}
