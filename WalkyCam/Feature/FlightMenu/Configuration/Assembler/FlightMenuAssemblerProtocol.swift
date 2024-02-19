import SwiftUI

protocol FlightMenuAssemblerProtocol {
    func resolveView(
        route: FlightMenuRoute
    ) -> FlightMenuView<FlightMenuViewModel, FlightMenuRouter>
}