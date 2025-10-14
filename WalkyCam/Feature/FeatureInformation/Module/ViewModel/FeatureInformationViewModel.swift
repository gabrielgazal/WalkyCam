import SwiftUI

final class FeatureInformationViewModel: FeatureInformationViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: FeatureInformationInteractorProtocol
    @Published var vehicleModel: [SelectorModel] = [
        .init(value: "Auto"),
        .init(value: "Moto"),
        .init(value: "Bici")
    ]
    @Published var deepnessModel: [SelectorModel] = [
        .init(value: "10 mt"),
        .init(value: "20 mt"),
        .init(value: "30 mt")
    ]
    
    // MARK: - Initialization

    init(interactor: FeatureInformationInteractorProtocol = FeatureInformationInteractor()) {
        self.interactor = interactor
    }
    
    func saveData() {
        
    }
}
