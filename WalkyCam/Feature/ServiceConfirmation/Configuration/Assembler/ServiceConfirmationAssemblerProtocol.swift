import SwiftUI

protocol ServiceConfirmationAssemblerProtocol {
    func resolveView(
        route: ServiceConfirmationRoute
    ) -> ServiceConfirmationView<ServiceConfirmationViewModel, ServiceConfirmationRouter>
}