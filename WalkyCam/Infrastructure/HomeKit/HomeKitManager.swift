//
//  HomeKitManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 08/12/24.
//

import HomeKit

class HomeKitManager: NSObject, ObservableObject {
    private var homeManager: HMHomeManager = HMHomeManager()
    public static let shared = HomeKitManager()

    @Published var devices: [HMAccessory] = []
    
    override init() {
        super.init()
        homeManager.delegate = self
    }
    
    func fetchDevices() {
        for home in homeManager.homes {
            for accessory in home.accessories {
                devices.append(accessory)
            }
        }
    }
    
    func fetchRGBLights() -> [HMAccessory] {
        return devices.filter { $0.isLightbulb }
    }
    
    func updateColor(deviceId: String, hue: CGFloat) async {
        guard let accessory = devices.first(where: { $0.uniqueIdentifier.uuidString == deviceId }) else { return }
        if let characteristic = accessory.findCharacteristicType(serviceType: HMServiceTypeLightbulb, characteristicType: HMCharacteristicTypeHue),
           accessory.isReachable {
            do {
                _ = try await characteristic.writeValue(hue)
            } catch {
                print("ERROR WRITING \(error.localizedDescription)")
            }

        }
    }
}

extension HomeKitManager: HMHomeManagerDelegate {
    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        fetchDevices()
    }
}

extension HMAccessory {
    var isLightbulb: Bool {
        return self.find(serviceType: HMServiceTypeLightbulb, characteristicType: HMCharacteristicMetadataFormatBool) != nil 
    }
}

extension HMAccessory {
    func find(serviceType: String, characteristicType: String) -> HMCharacteristic? {
        return services.lazy
            .filter { $0.serviceType == serviceType }
            .flatMap { $0.characteristics }
            .first { $0.metadata?.format == characteristicType }
    }
    
    func findCharacteristicType(serviceType: String, characteristicType: String) -> HMCharacteristic? {
        return services.lazy
            .filter { $0.serviceType == serviceType }
            .flatMap { $0.characteristics }
            .first { $0.characteristicType == characteristicType }
    }
}
