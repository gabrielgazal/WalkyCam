import SwiftUI

protocol ServiceDetailsAssemblerProtocol {
    func resolveView(
        route: ServiceDetailsRoute
    ) -> ServiceDetailsView<ServiceDetailsViewModel, ServiceDetailsRouter>
}