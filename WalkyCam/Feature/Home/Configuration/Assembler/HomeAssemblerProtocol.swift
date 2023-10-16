import SwiftUI

protocol HomeAssemblerProtocol {
    func resolveView(
        route: HomeRoute
    ) -> HomeView<HomeViewModel, HomeRouter>
}