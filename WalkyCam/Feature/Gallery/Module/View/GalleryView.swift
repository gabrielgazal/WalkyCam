import SwiftUI

struct GalleryView<ViewModel: GalleryViewModelProtocol, Router: GalleryRouterProtocol>: View {

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
        VStack {
            HStack {
                Text("Galería")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
            .padding(.horizontal, Tokens.Size.Spacing.regular)
            WCTopBarContainerView(
                topBarItems: viewModel.tabBarItems,
                selection: $viewModel.tabSelection
            )
            .environmentObject(viewModel)
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
    GalleryView(
            viewModel: GalleryViewModel(),
            router: GalleryRouter(isPresented: .constant(false))
        )
    }
}
