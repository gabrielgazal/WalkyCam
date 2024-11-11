//
//  File.swift
//  
//
//  Created by Gabriel Gazal on 11/11/24.
//

import Combine
import Moya
import Foundation

protocol TridimensionalModelServiceProtocol {
    func generateModelFromImages(userId: String, images: [Data], completion: @escaping Completion)
    func generateModelFromVideo(userId: String, video: Data, completion: @escaping Completion)
    func finishModelGeneration(userId: String, modelId: String, completion: @escaping Completion)
}
