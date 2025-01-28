import SwiftUI

struct AppleWatchSimulatorView<ViewModel: AppleWatchSimulatorViewModelProtocol, Router: AppleWatchSimulatorRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        WatchMenuView()
            .applyShadow()
    }
}

struct AppleWatchSimulatorView_Previews: PreviewProvider {
    static var previews: some View {
    AppleWatchSimulatorView(
            viewModel: AppleWatchSimulatorViewModel(),
            router: AppleWatchSimulatorRouter(isPresented: .constant(false))
        )
    }
}
