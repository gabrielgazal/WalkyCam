import SwiftUI

final class VideoCallRouter: Router, VideoCallRouterProtocol {

    // MARK: - Public API

    func routeToMeetRoom() {
        navigateTo(
            VideoCallRoomRoute(isPresented: isPresentingSheet)
        )
    }
}
