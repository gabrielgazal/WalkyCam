import SwiftUI

final class RegistrationRouter: Router, RegistrationRouterProtocol {

    private(set) var appNavigator: AppNavigatorProtocol

    init(state: RouterStateProtocol,
         appNavigator: AppNavigatorProtocol = AppNavigator.shared) {
        self.appNavigator = appNavigator
        super.init(state: state)
    }

    // MARK: - Public API

    func routeToOnboarding() {
        appNavigator.view = LoginRoute(isPresented: .constant(false)).build()
    }

    func routeToConfirmMail() {
        navigateTo(
            ConfirmMailRoute(isPresented: isNavigating)
        )
    }
}
