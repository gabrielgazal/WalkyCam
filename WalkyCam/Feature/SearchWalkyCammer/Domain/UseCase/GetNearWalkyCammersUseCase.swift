//
//  GetNearWalkyCammersUseCase.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 21/12/24.
//

import Foundation
import Networking
import Combine
import MapKit

typealias GetNearWalkyCammersUseCase = GenericUseCase<CLLocationCoordinate2D, [CammerData]>

extension GetNearWalkyCammersUseCase {
    
    static func live(
        repository: WalkcamerRepositoryProtocol
    ) -> Self {
        Self.init { credentials in
            Deferred {
                Future { promise in
                    repository.getNearWalkcammers { result in
                        switch result {
                        case let .failure(error):
                            promise(.failure(error))
                        case let .success(response):
                            promise(.success(response.map { mapResponseToCammerData($0) }))
                        }
                        return
                    }
                }
            }
            .eraseToAnyPublisher()
        }
    }

    static func mapResponseToCammerData(_ input: WalkyCammersResponse) -> CammerData {
        return .init(
            id: input.id,
            name: "\(input.name) \(input.lastName)",
            stars: 5,
            description: mapDescription(input),
            about: input.aboutMe,
            profileImage: input.urlProfilePicture,
            technologies: mapTechnologies(input),
            coordinates: .init(
                latitude: Double(input.locationLatitude) ?? 0.0,
                longitude: Double(input.locationLongitude) ?? 0.0
            ),
            devices: mapDevices(input),
            availability: .init(
                hourlyCost: 100.0,
                recordingTime: 10.0,
                availabilityTime: 10.0
            ),
            abilities: []
        )
    }
    
    static func mapTechnologies(_ input: WalkyCammersResponse) -> [CammerTechnology] {
        var technologiesToReturn: [CammerTechnology] = []
        if !input.walkycamerInfo.smartphonesInfo.isEmpty {
            technologiesToReturn.append(.camera)
            technologiesToReturn.append(.scan)
            technologiesToReturn.append(.smartphone)
            technologiesToReturn.append(.video)
        }
        
        if !input.walkycamerInfo.rovsInfo.isEmpty {
            technologiesToReturn.append(.drone)
        }
        return technologiesToReturn
    }
    
    static func mapDevices(_ input: WalkyCammersResponse) -> [DevicesInfo] {
        var devicesToReturn: [DevicesInfo] = []
        devicesToReturn.append(
            contentsOf: input.walkycamerInfo.smartphonesInfo.compactMap { device in
                return DevicesInfo(
                    name: "\(device.brand) - \(device.model)",
                    type: .smartphone
                )
            }
        )
        devicesToReturn.append(
            contentsOf: input.walkycamerInfo.rovsInfo.compactMap {
                device in
                return DevicesInfo(
                    name: "\(device.brand) - \(device.model)",
                    type: .drone
                )
            }
        )
        return devicesToReturn
    }
    
    static func mapDescription(_ input: WalkyCammersResponse) -> String {
        return "\(4) min de distancia - Desde $\(10)"
    }
}
