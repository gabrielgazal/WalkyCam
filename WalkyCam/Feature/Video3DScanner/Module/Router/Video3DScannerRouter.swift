import SwiftUI

final class Video3DScannerRouter: Router, Video3DScannerRouterProtocol {

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

