import SwiftUI

final class VideoCallRouter: Router, VideoCallRouterProtocol {
    
    // MARK: - Public API
    
    func routeToMeetRoom(_ callId: String) {
        //        navigateTo(
        //            WebRoute(
        //                isPreseted: isNavigating,
        //                webViewURL: link
        //            )
        //        )
        navigateTo(
            NativeVideoCallRoute(videoCallId: callId, isPresented: isNavigating)
        )
    }
    
    func routeToBookCammer() {
        navigateTo(
            ScheduleVideoCallRoute(isPresented: isNavigating)
        )
    }
}
