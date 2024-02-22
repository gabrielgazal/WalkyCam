import SwiftUI

struct ScannerMenuView<ViewModel:ScannerMenuViewModelProtocol, Router: ScannerMenuRouterProtocol>: View {

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

struct ScannerMenuView_Previews: PreviewProvider {
    static var previews: some View {
    ScannerMenuView(
            viewModel: ScannerMenuViewModel(),
            router: ScannerMenuRouter(isPresented: .constant(false))
        )
    }
}
