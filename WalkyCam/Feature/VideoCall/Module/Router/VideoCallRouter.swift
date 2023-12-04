import SwiftUI

final class VideoCallRouter: Router, VideoCallRouterProtocol {

    // MARK: - Public API

    func routeToMeetRoom() {
        presentSheet(
            VideoCallRoomRoute(isPresented: isPresentingSheet)
        )
    }
}
