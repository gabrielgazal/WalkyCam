import SwiftUI

final class VideoCallRouter: Router, VideoCallRouterProtocol {

    // MARK: - Public API

    func routeToMeetRoom(_ link: String) {
        navigateTo(
            VideoCallRoomRoute(isPresented: isPresentingSheet,
                               meetLink: link)
        )
    }
}
