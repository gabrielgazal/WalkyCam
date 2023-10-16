import SwiftUI

protocol TabBarAssemblerProtocol {
    func resolveView(
        route: TabBarRoute
    ) -> TabBarView<TabBarViewModel, TabBarRouter>
}