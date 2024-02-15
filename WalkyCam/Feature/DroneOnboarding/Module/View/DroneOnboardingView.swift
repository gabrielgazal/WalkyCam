import SwiftUI

struct DroneOnboardingView<ViewModel:DroneOnboardingViewModelProtocol, Router: DroneOnboardingRouterProtocol>: View {

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
        Text("Hello World!")
    }
}

struct DroneOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
    DroneOnboardingView(
            viewModel: DroneOnboardingViewModel(),
            router: DroneOnboardingRouter(isPresented: .constant(false))
        )
    }
}
