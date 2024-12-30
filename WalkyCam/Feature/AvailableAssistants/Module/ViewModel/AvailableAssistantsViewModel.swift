import SwiftUI

final class AvailableAssistantsViewModel: AvailableAssistantsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AvailableAssistantsInteractorProtocol
    @Published var walkyCammers: AsyncData<[CammerData], ErrorProtocol> = .idle

    // MARK: - Initialization

    init(interactor: AvailableAssistantsInteractorProtocol = AvailableAssistantsInteractor()) {
        self.interactor = interactor
        getWalkyCammers()
    }

    // MARK: - Public API

    private func getWalkyCammers() {
        walkyCammers = .loading
        let cammers: [CammerData] = [
            .init(
                id: "0",
                name: "Camila Pérez",
                stars: 5,
                description: "*4 min* de distancia - Desde $6",
                about: "6 años de experiencia\nAmante de la fotografía\nEstudiante para Chef de comida Koreana\nMe encanta la arqueología y la historia.\nEstoy disponible todas las tardes de Lunes a Viernes.",
                profileImage: .womanMock1,
                technologies: [.scan, .smartphone, .video, .camera],
                coordinates: .init(
                    latitude: -25.4300744,
                    longitude: -49.2717098
                ),
                devices: [
                  .init(name: "Samsung Galaxy S11", type: .camera),
                  .init(name: "Nikon 4493", type: .smartphone),
                  .init(name: "Videocamara JVC", type: .video)
                ],
                availability: .init(
                  hourlyCost: 60.0,
                  recordingTime: 3,
                  availabilityTime: 3
                ),
                abilities: [
                  .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                  .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                ]
            ),
            .init(
                id: "1",
                name: "Lali Espósito",
                stars: 4,
                description: "*16 min* de distancia - Desde $4",
                about: "6 años de experiencia\nAmante de la fotografía\nEstudiante para Chef de comida Koreana\nMe encanta la arqueología y la historia.\nEstoy disponible todas las tardes de Lunes a Viernes.",
                profileImage: .womanMock3,
                technologies: [.scan, .smartphone],
                coordinates: .init(
                    latitude: -25.426678,
                    longitude: -49.272280
                ),
                devices: [
                  .init(name: "Samsung Galaxy S11", type: .camera),
                  .init(name: "Nikon 4493", type: .smartphone),
                  .init(name: "Videocamara JVC", type: .video)
                ],
                availability: .init(
                  hourlyCost: 60.0,
                  recordingTime: 3,
                  availabilityTime: 3
                ),
                abilities: [
                  .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                  .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                ]
            ),
            .init(
                id: "2",
                name: "Diego Salas",
                stars: 4,
                description: "*4 min* de distancia - Desde %6",
                about: "6 años de experiencia\nAmante de la fotografía\nEstudiante para Chef de comida Koreana\nMe encanta la arqueología y la historia.\nEstoy disponible todas las tardes de Lunes a Viernes.",
                profileImage: .manMock2,
                technologies: [.drone, .smartphone],
                coordinates: .init(
                    latitude: -25.431048,
                    longitude: -49.271921
                ),
                devices: [
                  .init(name: "Samsung Galaxy S11", type: .camera),
                  .init(name: "Nikon 4493", type: .smartphone),
                  .init(name: "Videocamara JVC", type: .video)
                ],
                availability: .init(
                  hourlyCost: 60.0,
                  recordingTime: 3,
                  availabilityTime: 3
                ),
                abilities: [
                  .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                  .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                ]
            ),
            .init(
                id: "3",
                name: "Maria Casas",
                stars: 5,
                description: "*4 min* de distancia - Desde %6",
                about: "6 años de experiencia\nAmante de la fotografía\nEstudiante para Chef de comida Koreana\nMe encanta la arqueología y la historia.\nEstoy disponible todas las tardes de Lunes a Viernes.",
                profileImage: .womanMock4,
                technologies: [.scan, .smartphone, .video, .camera],
                coordinates: .init(
                    latitude: -25.429866,
                    longitude: -49.270048
                ),
                devices: [
                  .init(name: "Samsung Galaxy S11", type: .camera),
                  .init(name: "Nikon 4493", type: .smartphone),
                  .init(name: "Videocamara JVC", type: .video)
                ],
                availability: .init(
                  hourlyCost: 60.0,
                  recordingTime: 3,
                  availabilityTime: 3
                ),
                abilities: [
                  .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                  .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                ]
            ),
            .init(id: "4",

                  name: "Gabriel Silva",
                  stars: 3,
                  description: "*4 min* de distancia - Desde %6",
                  about: "6 años de experiencia\nAmante de la fotografía\nEstudiante para Chef de comida Koreana\nMe encanta la arqueología y la historia.\nEstoy disponible todas las tardes de Lunes a Viernes.",
                  profileImage: .manMock4,
                  technologies: [.drone],
                  coordinates: .init(
                    latitude: -25.430924,
                    longitude: -49.2272714
                  ),
                  devices: [
                    .init(name: "Samsung Galaxy S11", type: .camera),
                    .init(name: "Nikon 4493", type: .smartphone),
                    .init(name: "Videocamara JVC", type: .video)
                  ],
                  availability: .init(
                    hourlyCost: 60.0,
                    recordingTime: 3,
                    availabilityTime: 3
                  ),
                  abilities: [
                    .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                    .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                  ]
                 ),

        ]
        walkyCammers = .loaded(cammers)
    }

}
