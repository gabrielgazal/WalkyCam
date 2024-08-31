import SwiftUI

protocol TimedLoadingScreenAssemblerProtocol {
    func resolveView(
        route: TimedLoadingScreenRoute
    ) -> TimedLoadingScreenView<TimedLoadingScreenViewModel, TimedLoadingScreenRouter>
}