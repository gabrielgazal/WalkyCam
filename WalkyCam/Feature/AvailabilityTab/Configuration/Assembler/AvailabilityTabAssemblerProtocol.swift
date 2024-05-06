import SwiftUI

protocol AvailabilityTabAssemblerProtocol {
    func resolveView(
        route: AvailabilityTabRoute
    ) -> AvailabilityTabView<AvailabilityTabViewModel, AvailabilityTabRouter>
}