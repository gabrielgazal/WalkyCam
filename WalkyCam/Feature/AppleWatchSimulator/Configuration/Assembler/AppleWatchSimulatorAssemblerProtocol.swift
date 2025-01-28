import SwiftUI

protocol AppleWatchSimulatorAssemblerProtocol {
    func resolveView(
        route: AppleWatchSimulatorRoute
    ) -> AppleWatchSimulatorView<AppleWatchSimulatorViewModel, AppleWatchSimulatorRouter>
}