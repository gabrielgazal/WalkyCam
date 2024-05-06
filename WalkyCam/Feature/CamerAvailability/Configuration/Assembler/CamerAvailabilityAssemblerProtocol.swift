import SwiftUI

protocol CamerAvailabilityAssemblerProtocol {
    func resolveView(
        route: CamerAvailabilityRoute
    ) -> CamerAvailabilityView<CamerAvailabilityViewModel, CamerAvailabilityRouter>
}