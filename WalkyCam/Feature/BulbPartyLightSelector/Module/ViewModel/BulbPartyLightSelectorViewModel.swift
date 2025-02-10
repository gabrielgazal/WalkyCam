import SwiftUI
import HomeKit

final class BulbPartyLightSelectorViewModel: BulbPartyLightSelectorViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: BulbPartyLightSelectorInteractorProtocol
    
    @Published var isRunningLightParty: Bool = false
    var homekitManager = HomeKitManager.shared
    var audioManager = AudioManager.shared
    @Published var selectedDevices: [String] = []
    @State var timer: Timer?
    @Published var availableDevices: [HMAccessory] = []

    // MARK: - Initialization

    init(interactor: BulbPartyLightSelectorInteractorProtocol = BulbPartyLightSelectorInteractor()) {
        self.interactor = interactor
        fetchRgbDevices()
    }

    // MARK: - Public API

    func screenTitle() -> String {
        return !isRunningLightParty ? "Seleccione dispositivos para activar RGB Bulb Party" : "RBG Bulb Party"
    }
    
    func fetchRgbDevices() {
        if homekitManager.fetchRGBLights().isEmpty {
            // THIS IS FOR MOCKING PURPOSES ONLY
            availableDevices = [
                .mock(name: "Teste 1"),
                .mock(name: "Teste 2"),
                .mock(name: "Teste 3"),
            ]
        } else {
            availableDevices = homekitManager.fetchRGBLights()
        }
    }
    
    @MainActor func startColorChange() async {
        audioManager.startListening { color in
            let normalizedColor = min(max(color * 360.0 * CGFloat.random(in: 0...100), 1.0), 360.0)
            Task {
                await self.updateColors(normalizedColor)
            }
        }
    }
    
    func stopColorChange() {
        audioManager.stopListening()
    }
    
    func returnImage(item: HMAccessory) -> Image {
        guard let index = availableDevices.firstIndex(of: item) else {
            return Asset.BulbParty.rgbBulb1.swiftUIImage
        }
        
        switch (index % 3) {
            case 0:
                return Asset.BulbParty.rgbBulb1.swiftUIImage
            case 1:
                return Asset.BulbParty.rgbBulb2.swiftUIImage
            case 2:
                return Asset.BulbParty.rgbBulb3.swiftUIImage
            default:
                return Asset.BulbParty.rgbBulb1.swiftUIImage
            }
    }
    
    // MARK: - Private Methods
    
    private func updateColors(_ color: CGFloat) async {
        for device in selectedDevices {
            await homekitManager.updateColor(deviceId: device, hue: color)
        }
    }
}

extension HMAccessory {
    static func mock(name: String) -> HMAccessory {
        let accessory = HMAccessory()
        return accessory
    }
}
