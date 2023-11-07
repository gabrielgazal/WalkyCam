import SwiftUI

struct CashTabView<ViewModel: CashTabViewModelProtocol, Router: CashTabRouterProtocol>: View {

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

struct CashTabView_Previews: PreviewProvider {
    static var previews: some View {
    CashTabView(
            viewModel: CashTabViewModel(),
            router: CashTabRouter(isPresented: .constant(false))
        )
    }
}
