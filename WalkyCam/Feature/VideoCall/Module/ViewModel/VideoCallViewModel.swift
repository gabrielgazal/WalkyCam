import SwiftUI

final class VideoCallViewModel: VideoCallViewModelProtocol {

    // MARK: - Dependencies
   @Published var videoCallLink: String = ""

    private let interactor: VideoCallInteractorProtocol

    // MARK: - Initialization

    init(interactor: VideoCallInteractorProtocol = VideoCallInteractor()) {
        self.interactor = interactor
    }
    
    // MARK: - Public API
    
    func assembleVideoCallLink() -> String {
        guard let userId = try? UserSession().user().id else {
            fatalError("Unable to locate user id")
        }
        return "https://meet.walkycam.com/videocall/\(videoCallLink)/\(userId)"
    }

    // MARK: - Private Methods

    private func somePrivateMethod() {

    }
}
