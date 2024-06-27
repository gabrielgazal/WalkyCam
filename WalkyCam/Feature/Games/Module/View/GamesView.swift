import SwiftUI

struct GamesView<ViewModel: GamesViewModelProtocol, Router: GamesRouterProtocol>: View {

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

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
    GamesView(
            viewModel: GamesViewModel(),
            router: GamesRouter(isPresented: .constant(false))
        )
    }
}
