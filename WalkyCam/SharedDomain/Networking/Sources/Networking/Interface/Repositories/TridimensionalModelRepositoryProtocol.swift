//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 11/11/24.
//

import Foundation

public protocol TridimensionalModelRepositoryProtocol {
    typealias GenerateModelFromImagesResult = Result<Void, RepositoryError>
    typealias GenerateModelFromVideoResult = Result<Void, RepositoryError>


    func generateModelFromImages(
        userId: String,
        images: [String: Data],
        completion: @escaping (GenerateModelFromImagesResult) -> Void
    )
    func generateModelFromVideo(
        userId: String,
        video: Data,
        completion: @escaping (GenerateModelFromVideoResult) -> Void
    )
}
