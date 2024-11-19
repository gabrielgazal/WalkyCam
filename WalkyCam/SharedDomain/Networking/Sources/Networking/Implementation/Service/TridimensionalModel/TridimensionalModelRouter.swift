//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum TridimensionalModelRouter {
    case generateModelFromImages(userId: String, images: [Data])
    case generateModelFromVideo(userId: String, video: Data)
    case finishModelGeneration(userId: String, modelId: String)
}

extension TridimensionalModelRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }

    var path: String {
        switch self {
        case .generateModelFromImages:
            return "user/3d/generate-obj-model-from-images"
        case .generateModelFromVideo:
            return "user/3d/generate-obj-model-from-video"
        case .finishModelGeneration:
            return "user/3d/finish-model-generation"
        }
    }

    var method: Moya.Method {
        switch self {
        case .generateModelFromImages, .generateModelFromVideo, .finishModelGeneration:
            return .post
        }
    }

    var task: Task {
        switch self {
        case let .generateModelFromImages(userId, images):
            return generateModelFromImages(userId, images)
        case let .generateModelFromVideo(userId, video):
            return generateModelFromVideo(userId, video)
        case let .finishModelGeneration(userId, modelId):
            return finishModelGeneration(userId, modelId)
        }
    }
    
    private func generateModelFromImages(_ userId: String, _ images: [Data]) -> Task {
        var formData: [MultipartFormData] = []

        // Adiciona o userId como parte do formulário
        let userIdPart = MultipartFormData(provider: .data(userId.data(using: .utf8)!), name: "id_user")
        formData.append(userIdPart)

        // Adiciona cada imagem como uma parte do formulário
        for (index, imageData) in images.enumerated() {
            let imagePart = MultipartFormData(
                provider: .data(imageData),
                name: "images[\(index)]", // Nome da chave no formato de array
                fileName: "image\(index).jpg", // Nome do arquivo
                mimeType: "image/jpeg" // Tipo MIME adequado
            )
            formData.append(imagePart)
        }

        return .uploadMultipart(formData)
    }
    
    private func generateModelFromVideo(_ userId: String, _ video: Data) -> Task {
        let userIdPart = MultipartFormData(provider: .data(userId.data(using: .utf8)!), name: "id_user")
        
        let videoPart = MultipartFormData(
            provider: .data(video),
            name: "video",
            fileName: "video.mp4",
            mimeType: "video/mp4"
        )
        
        return .uploadMultipart([userIdPart, videoPart])
    }
    
    private func finishModelGeneration(_ userId: String, _ modelId: String) -> Task {
        
            let parameters = [
                "id_user": userId,
                "model_id": modelId
            ] as [String:Any]

            return .requestParameters(
                parameters: parameters,
                encoding: JSONEncoding.default
            )
    }
}
