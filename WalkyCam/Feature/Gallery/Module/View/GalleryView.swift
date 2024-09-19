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
                Text(L10n.GalleryView.title)
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
            .padding(.horizontal, Tokens.Size.Spacing.regular)
            AsyncDataView(viewModel.asyncTabBarItems) { tabBarItems in
                WCTopBarContainerView(
                    topBarItems: tabBarItems,
                    selection: $viewModel.tabSelection
                )
                .environmentObject(viewModel)
            } errorAction: {
                Task {
                    await viewModel.initializeTabs()
                }
            }
        }
        .task {
            await viewModel.initializeTabs()
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
    GalleryView(
        viewModel: GalleryViewModel(
            interactor: GalleryInteractor(
                useCases: .init(
                    fetchUserFiles: .empty
                )
            )
        ),
            router: GalleryRouter(isPresented: .constant(false))
        )
    }
}
