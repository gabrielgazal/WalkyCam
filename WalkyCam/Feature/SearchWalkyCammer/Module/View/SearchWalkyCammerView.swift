import SwiftUI

struct SearchWalkyCammerView<ViewModel: SearchWalkyCammerViewModelProtocol, Router: SearchWalkyCammerRouterProtocol>: View {

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

struct SearchWalkyCammerView_Previews: PreviewProvider {
    static var previews: some View {
    SearchWalkyCammerView(
            viewModel: SearchWalkyCammerViewModel(),
            router: SearchWalkyCammerRouter(isPresented: .constant(false))
        )
    }
}
