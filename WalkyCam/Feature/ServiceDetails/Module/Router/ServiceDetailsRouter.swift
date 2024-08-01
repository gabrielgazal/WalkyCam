import SwiftUI

final class ServiceDetailsRouter: Router, ServiceDetailsRouterProtocol {
    
    private(set) var appNavigator: AppNavigatorProtocol

    init(state: RouterStateProtocol,
         appNavigator: AppNavigatorProtocol = AppNavigator.shared) {
        self.appNavigator = appNavigator
        super.init(state: state)
    }
    
    // MARK: - Public API

    func routeToConfirmation() {
        navigateTo(
            ServiceConfirmationRoute(isPresented: isNavigating)
        )
    }
    
    func routeToPlans() {
        navigateTo(
         PlansPagesRoute(isPresented: isNavigating, currentPage: 3)
        )
    }
}

