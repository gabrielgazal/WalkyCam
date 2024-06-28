import SwiftUI

final class UnavailableFeatureViewModel: UnavailableFeatureViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: UnavailableFeatureInteractorProtocol
    @Published var icon: String
    @Published var title: String
    
    // MARK: - Initialization

    init(
        icon: String,
        title: String,
        interactor: UnavailableFeatureInteractorProtocol = UnavailableFeatureInteractor()
    ) {
        self.icon = icon
        self.title = title
        self.interactor = interactor
    }
}
