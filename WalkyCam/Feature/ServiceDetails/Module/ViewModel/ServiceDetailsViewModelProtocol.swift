import SwiftUI

protocol ServiceDetailsViewModelProtocol: ViewModelProtocol {
    var service: FunctionData { get set }
    var currentStep: Int { get set}
    var totalSteps: Int { get set}
    var detailItems: [ServiceDetailsItemModel] { get set }
    var devices: [DevicesInfo] { get set }
    var abilities: [AbilityInfo] { get set }
    
    func cancelAction()
}
