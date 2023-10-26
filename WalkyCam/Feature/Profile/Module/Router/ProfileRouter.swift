import SwiftUI

final class ProfileRouter: Router, ProfileRouterProtocol {

    private(set) var appNavigator: AppNavigatorProtocol

    init(state: RouterStateProtocol,
         appNavigator: AppNavigatorProtocol = AppNavigator.shared) {
        self.appNavigator = appNavigator
        super.init(state: state)
    }

    // MARK: - Public API

    func routeToLogin() {
        appNavigator.view = LoginRoute(isPresented: .constant(false)).build()
    }
}
