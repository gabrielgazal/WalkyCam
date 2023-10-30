import SwiftUI

protocol StartupAssemblerProtocol {
    func resolveView(
        route: StartupRoute
    ) -> StartupView<StartupViewModel, StartupRouter>
}