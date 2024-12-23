import SwiftUI

final class Photo3DScannerRouter: Router, Photo3DScannerRouterProtocol {

    // MARK: - Public API

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

