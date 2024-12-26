import SwiftUI
import HomeKit

protocol BulbPartyLightSelectorViewModelProtocol: ViewModelProtocol {
    var isRunningLightParty: Bool { get set }
    var selectedDevices: [String] { get set }
    
    func screenTitle() -> String
    func fetchRgbDevices() -> [HMAccessory]
    func startColorChange() async
    func stopColorChange()
}
