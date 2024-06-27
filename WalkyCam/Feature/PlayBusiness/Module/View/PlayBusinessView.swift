import SwiftUI

struct PlayBusinessView<ViewModel: PlayBusinessViewModelProtocol, Router: PlayBusinessRouterProtocol>: View {

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

struct PlayBusinessView_Previews: PreviewProvider {
    static var previews: some View {
    PlayBusinessView(
            viewModel: PlayBusinessViewModel(),
            router: PlayBusinessRouter(isPresented: .constant(false))
        )
    }
}
