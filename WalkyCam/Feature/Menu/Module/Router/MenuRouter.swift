import SwiftUI

final class MenuRouter: Router, MenuRouterProtocol {
    
    // MARK: - Public API
    
    func routeToBasic() {
        navigateTo(
            PlansPagesRoute(isPresented: isNavigating, currentPage: 1)
        )
    }
    
    func routeToStandard() {
        navigateTo(
            PlansPagesRoute(isPresented: isNavigating, currentPage: 2)
        )
    }
    
    func routeToPremium() {
        navigateTo(
            PlansPagesRoute(isPresented: isNavigating, currentPage: 4)
        )
    }
}

