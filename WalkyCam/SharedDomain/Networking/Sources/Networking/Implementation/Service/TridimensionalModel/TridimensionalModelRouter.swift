//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

enum TridimensionalModelRouter {
    case generateModelFromImages(userId: String, images: [String: Data])
    case generateModelFromVideo(userId: String, video: Data)
}

extension TridimensionalModelRouter: TargetType {
    var baseURL: URL { environment.baseURL }
    var headers: [String : String]? { Constants.defaultHeader }
    var sampleData: Data { .init() }

    var path: String {
        switch self {
        case .generateModelFromImages:
            return "/v1/user/3d/generate-glb-model-from-images"
        case .generateModelFromVideo:
            return "user/3d/generate-obj-model-from-video"
        }
    }

    var method: Moya.Method {
        switch self {
        case .generateModelFromImages, .generateModelFromVideo:
            return .post
        }
    }

    var task: Task {
        switch self {
        case let .generateModelFromImages(userId, images):
            return generateModelFromImages(userId, images)
        case let .generateModelFromVideo(userId, video):
            return generateModelFromVideo(userId, video)
        }
    }
    
    private func generateModelFromImages(_ userId: String, _ images: [String: Data]) -> Task {
        var formData: [MultipartFormData] = []

        // Adiciona o userId como parte do formulário
        let userIdPart = MultipartFormData(provider: .data(userId.data(using: .utf8)!), name: "id_user")
        formData.append(userIdPart)

        // Define as chaves esperadas para as imagens
        let imageKeys = ["front", "back", "left", "right"]
        
        // Adiciona cada imagem usando sua chave específica
        for key in imageKeys {
            if let imageData = images[key] {
                let imagePart = MultipartFormData(
                    provider: .data(imageData),
                    name: "images[\(key)]", // Nome da chave específica (front, back, left, right)
                    fileName: "image_\(key).jpg", // Nome do arquivo com a posição
                    mimeType: "image/jpeg" // Tipo MIME adequado
                )
                formData.append(imagePart)
            }
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
}
