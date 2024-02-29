import SwiftUI

struct IOTOnboardingView<ViewModel:IOTOnboardingViewModelProtocol, Router: IOTOnboardingRouterProtocol>: View {

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

struct IOTOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
    IOTOnboardingView(
            viewModel: IOTOnboardingViewModel(),
            router: IOTOnboardingRouter(isPresented: .constant(false))
        )
    }
}
