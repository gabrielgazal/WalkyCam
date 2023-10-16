import SwiftUI

final class TabBarRouter: Router, TabBarRouterProtocol {

    // MARK: - Public API
    func getViewFromRoute(from route: Route?) -> AnyView? {
        return route?.build()
    }
}
