import SwiftUI

final class WalkyCammerListViewModel: WalkyCammerListViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: WalkyCammerListInteractorProtocol
    @Published var walkyCammers: AsyncData<[CammerData], ErrorProtocol> = .idle

    // MARK: - Initialization

    init(interactor: WalkyCammerListInteractorProtocol = WalkyCammerListInteractor()) {
        self.interactor = interactor
        getWalkyCammersOnLocation()
    }

    // MARK: - Private Methods

    private func getWalkyCammersOnLocation() {
        walkyCammers = .loading
        let cammers = interactor.getCammersOnLocation()
        walkyCammers = .loaded(cammers)
    }
}
