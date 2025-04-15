import SwiftUI

final class VideoCallRouter: Router, VideoCallRouterProtocol {

    // MARK: - Public API

    func routeToMeetRoom(_ link: String) {
        navigateTo(
//            WebRoute(
//                isPreseted: isNavigating,
//                webViewURL: link
//            )
            NativeVideoCallRoute(isPresented: isNavigating)
        )
    }
    
    func routeToBookCammer() {
        navigateTo(
            ScheduleVideoCallRoute(isPresented: isNavigating)
        )
    }
}
