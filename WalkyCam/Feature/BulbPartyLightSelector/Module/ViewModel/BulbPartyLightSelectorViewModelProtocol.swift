import SwiftUI
import HomeKit

protocol BulbPartyLightSelectorViewModelProtocol: ViewModelProtocol {
    var isRunningLightParty: Bool { get set }
    var selectedDevices: [String] { get set }
    var availableDevices: [HMAccessory] { get set }
    
    func screenTitle() -> String
    func startColorChange() async
    func stopColorChange()
    func returnImage(item: HMAccessory) -> Image
}
