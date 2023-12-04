import SwiftUI

final class VideoCallRoomViewModel: VideoCallRoomViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: VideoCallRoomInteractorProtocol

    // MARK: - Initialization

    init(interactor: VideoCallRoomInteractorProtocol = VideoCallRoomInteractor()) {
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
