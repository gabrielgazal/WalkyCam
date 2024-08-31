//
//  FetchUserFilesUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 29/08/24.
//

import Foundation
import Networking
import Combine

typealias FetchUserFilesUseCase = GenericUseCase<String, [GalleryItemModel]>

extension FetchUserFilesUseCase {
    static func live(repository: AuthRepositoryProtocol) -> Self {
        Self.init { input in
            Deferred {
                Future { promise in
                    repository.getUserFiles(userId: input) { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(mapResponseToResult(response)))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }
    
    private static func mapResponseToResult(_ data: [UserFileReponse]) -> [GalleryItemModel] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        return data.compactMap { item -> GalleryItemModel? in
            guard let type = GalleryItemModel.FileType(rawValue: item.type),
                  let tag = GalleryItemModel.FileTag(rawValue: item.tag),
                  let status =  GalleryItemModel.FileStatus(rawValue: item.status),
                  let creationDate = dateFormatter.date(from: item.creationDate) else { return nil }
            return GalleryItemModel(
                id: item.id,
                type: type,
                tag: tag,
                status: status,
                basePath: item.basePath ?? "",
                viewPath: item.viewPath ?? item.path ?? "",
                creationDate: creationDate
            )
        }
    }
}
