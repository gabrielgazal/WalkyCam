import SwiftUI

final class VideoCallRoomViewModel: VideoCallRoomViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: VideoCallRoomInteractorProtocol
    @Published var meetURL: String

    // MARK: - Initialization

    init(meetURL: String,
         interactor: VideoCallRoomInteractorProtocol = VideoCallRoomInteractor()) {
        self.meetURL = meetURL
        self.interactor = interactor
    }
}
