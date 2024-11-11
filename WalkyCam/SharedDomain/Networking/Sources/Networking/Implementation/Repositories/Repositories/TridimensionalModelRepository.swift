//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 11/11/24.
//

import Combine
import Moya
import Foundation

final class TridimensionalModelRepository: TridimensionalModelRepositoryProtocol {
    // MARK: - Dependencies

    private let service: TridimensionalModelServiceProtocol
    private let requestHandler: DefaultRequestHandler

    // MARK: - Initialization

    init(
        service: TridimensionalModelServiceProtocol = TridimensionalModelService(),
        requestHandler: DefaultRequestHandler = DefaultRequestHandler()
    ) {
        self.service = service
        self.requestHandler = requestHandler
    }

    // MARK: - Public API
    
    func generateModelFromImages(userId: String, images: [Data], completion: @escaping (GenerateModelFromImagesResult) -> Void) {
        service.generateModelFromImages(
            userId: userId,
            images: images,
            completion: { result in
                completion(result.mapToRepositoryResult(with: self.requestHandler))
            }
        )
    }
    
    func generateModelFromVideo(userId: String, video: Data, completion: @escaping (GenerateModelFromVideoResult) -> Void) {
        service.generateModelFromVideo(
            userId: userId,
            video: video,
            completion: { result in
                completion(result.mapToRepositoryResult(with: self.requestHandler))
            }
        )
    }
    
    func finishModelGeneration(userId: String, modelId: String, completion: @escaping (FinishModelGenerationResult) -> Void) {
        service.finishModelGeneration(
            userId: userId,
            modelId: modelId,
            completion: { result in
                completion(result.mapToRepositoryResult(with: self.requestHandler))
            }
        )
    }
}
