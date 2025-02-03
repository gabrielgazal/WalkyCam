import SwiftUI

final class StreetCamMenuRouter: Router, StreetCamMenuRouterProtocol {

    // MARK: - Public API

    func routeToSearchCammer() {
        navigateTo(
            SearchWalkyCammerRoute(isPresented: isNavigating)
        )
    }

    func routeToBookCammer() {
        navigateTo(
            BookWalkycamerRoute(isPresented: isNavigating)
        )
    }
    
    func routeToMeetRoom(_ link: String) {
        navigateTo(
            WebRoute(isPreseted: isNavigating,
                     webViewURL: link)
        )
    }
}

