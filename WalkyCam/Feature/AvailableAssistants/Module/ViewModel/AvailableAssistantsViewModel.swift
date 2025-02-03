import SwiftUI

final class AvailableAssistantsViewModel: AvailableAssistantsViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: AvailableAssistantsInteractorProtocol
    @Published var walkyCammers: AsyncData<[CammerData], ErrorProtocol> = .idle

    // MARK: - Initialization

    init(interactor: AvailableAssistantsInteractorProtocol = AvailableAssistantsInteractor()) {
        self.interactor = interactor
        getWalkyCammers()
    }

    // MARK: - Public API

    private func getWalkyCammers() {
        walkyCammers = .loading
        let cammers: [CammerData] = StreetcammerManager.shared.streetCammers
        walkyCammers = .loaded(cammers)
    }

}
