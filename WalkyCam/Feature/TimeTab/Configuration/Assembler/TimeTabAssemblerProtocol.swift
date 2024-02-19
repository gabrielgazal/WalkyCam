import SwiftUI

protocol TimeTabAssemblerProtocol {
    func resolveView(
        route: TimeTabRoute
    ) -> TimeTabView<TimeTabViewModel, TimeTabRouter>
}