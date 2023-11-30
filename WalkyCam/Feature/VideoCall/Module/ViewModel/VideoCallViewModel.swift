import SwiftUI

final class VideoCallViewModel: VideoCallViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: VideoCallInteractorProtocol

    // MARK: - Initialization

    init(interactor: VideoCallInteractorProtocol = VideoCallInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    #warning("Example function. Rename or remove it")
    func someAction() {

    }

    // MARK: - Private Methods

    #warning("Example function. Rename or remove it")
    private func somePrivateMethod() {

    }
}
