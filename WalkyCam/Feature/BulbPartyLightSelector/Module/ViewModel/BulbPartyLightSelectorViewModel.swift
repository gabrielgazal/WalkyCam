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

    // MARK: - Initialization

    init(interactor: BulbPartyLightSelectorInteractorProtocol = BulbPartyLightSelectorInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func screenTitle() -> String {
        return isRunningLightParty ? "Seleccione dispositivos para activar RGB Bulb Party" : "RBG Bulb Party"
    }
    
    func fetchRgbDevices() -> [HMAccessory] {
        return homekitManager.fetchRGBLights()
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
    
    // MARK: - Private Methods
    
    private func updateColors(_ color: CGFloat) async {
        for device in selectedDevices {
            await homekitManager.updateColor(deviceId: device, hue: color)
        }
    }
}
