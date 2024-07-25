import SwiftUI

struct ServiceConfirmationView<ViewModel: ServiceConfirmationViewModelProtocol, Router: ServiceConfirmationRouterProtocol>: View {

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

struct ServiceConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
    ServiceConfirmationView(
            viewModel: ServiceConfirmationViewModel(),
            router: ServiceConfirmationRouter(isPresented: .constant(false))
        )
    }
}
