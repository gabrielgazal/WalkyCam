import SwiftUI

struct RegisterWalkcamerView<ViewModel: RegisterWalkcamerViewModelProtocol, Router: RegisterWalkcamerRouterProtocol>: View {

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

struct RegisterWalkcamerView_Previews: PreviewProvider {
    static var previews: some View {
    RegisterWalkcamerView(
            viewModel: RegisterWalkcamerViewModel(),
            router: RegisterWalkcamerRouter(isPresented: .constant(false))
        )
    }
}
