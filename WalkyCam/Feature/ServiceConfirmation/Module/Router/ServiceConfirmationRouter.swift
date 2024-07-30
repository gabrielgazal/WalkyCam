import SwiftUI

final class ServiceConfirmationRouter: Router, ServiceConfirmationRouterProtocol {
    
    private(set) var appNavigator: AppNavigatorProtocol

    init(state: RouterStateProtocol,
         appNavigator: AppNavigatorProtocol = AppNavigator.shared) {
        self.appNavigator = appNavigator
        super.init(state: state)
    }
    
    // MARK: - Public API

    func routeToHome() {
        appNavigator.view = TabBarRoute(isPresented: .constant(false)).build()
    }
}

