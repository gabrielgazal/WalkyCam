import SwiftUI

struct CashWalletView<ViewModel: CashWalletViewModelProtocol, Router: CashWalletRouterProtocol>: View {

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
        WCTopBarContainerView(
            topBarItems: viewModel.tabBarItems,
            selection: $viewModel.tabSelection
        )
        .environmentObject(viewModel)
    }
}

struct CashWalletView_Previews: PreviewProvider {
    static var previews: some View {
        CashWalletView(
            viewModel: CashWalletViewModel(),
            router: CashWalletRouter(isPresented: .constant(false))
        )
    }
}
