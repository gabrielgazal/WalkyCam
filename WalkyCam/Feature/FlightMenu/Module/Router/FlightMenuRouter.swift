import SwiftUI

final class FlightMenuRouter: Router, FlightMenuRouterProtocol {

    // MARK: - Public API

    func routeToSearchCammer() {
        navigateTo(
            SearchWalkyCammerRoute(isPresented: isNavigating)
        )
    }

    func routeToScheduleCammer() {
        navigateTo(
            BookWalkycamerRoute(isPresented: isNavigating)
        )
    }
    
    func routeToJoinDrone() {
        navigateTo(
            DroneConnectionRoute(isPresented: isNavigating)
        )
    }
}

