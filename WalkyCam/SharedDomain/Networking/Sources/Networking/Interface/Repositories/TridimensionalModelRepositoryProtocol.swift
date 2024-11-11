//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 11/11/24.
//

import Foundation

protocol TridimensionalModelRepositoryProtocol {
    typealias GenerateModelFromImagesResult = Result<Void, RepositoryError>
    typealias GenerateModelFromVideoResult = Result<Void, RepositoryError>
    typealias FinishModelGenerationResult = Result<Void, RepositoryError>


    func generateModelFromImages(
        userId: String,
        images: [Data],
        completion: @escaping (GenerateModelFromImagesResult) -> Void
    )
    func generateModelFromVideo(
        userId: String,
        video: Data,
        completion: @escaping (GenerateModelFromVideoResult) -> Void
    )
    func finishModelGeneration(
        userId: String,
        modelId: String,
        completion: @escaping (FinishModelGenerationResult) -> Void
    )
}
