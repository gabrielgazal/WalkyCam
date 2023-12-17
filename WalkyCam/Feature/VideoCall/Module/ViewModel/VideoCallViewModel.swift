import SwiftUI

final class VideoCallViewModel: VideoCallViewModelProtocol {

    // MARK: - Dependencies
   @Published var videoCallLink: String = ""

    private let interactor: VideoCallInteractorProtocol

    // MARK: - Initialization

    init(interactor: VideoCallInteractorProtocol = VideoCallInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Private Methods

    private func somePrivateMethod() {

    }
}
