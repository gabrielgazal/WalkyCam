import SwiftUI

final class LegalDocumentationRouter: Router, LegalDocumentationRouterProtocol {
    
    private(set) var appNavigator: AppNavigatorProtocol

    init(state: RouterStateProtocol,
         appNavigator: AppNavigatorProtocol = AppNavigator.shared) {
        self.appNavigator = appNavigator
        super.init(state: state)
    }
    
    // MARK: - Public API

    func routeToCammerConfirmation() {
        appNavigator.view = TabBarRoute(isPresented: .constant(false)).build()
    }
}

