import SwiftUI

final class UnreleasedFeatureViewModel: UnreleasedFeatureViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: UnreleasedFeatureInteractorProtocol
    @Published var banners: [String]

    // MARK: - Initialization

    init(interactor: UnreleasedFeatureInteractorProtocol = UnreleasedFeatureInteractor(),
         banners: [String]) {
        self.interactor = interactor
        self.banners = banners
    }
}
