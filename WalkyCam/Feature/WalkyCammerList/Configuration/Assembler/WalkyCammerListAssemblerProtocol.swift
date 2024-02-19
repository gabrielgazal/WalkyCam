import SwiftUI

protocol WalkyCammerListAssemblerProtocol {
    func resolveView(
        route: WalkyCammerListRoute
    ) -> WalkyCammerListView<WalkyCammerListViewModel, WalkyCammerListRouter>
}