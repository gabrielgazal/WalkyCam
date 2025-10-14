import SwiftUI

protocol FeatureInformationViewModelProtocol: ViewModelProtocol {
    var vehicleModel: [SelectorModel] { get set }
    var deepnessModel: [SelectorModel] { get set }
    
    func saveData()
}
