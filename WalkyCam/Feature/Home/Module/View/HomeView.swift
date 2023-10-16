import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol, Router: HomeRouterProtocol>: View {

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
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.large) {
            ProfileHeaderView(name: viewModel.homeData.profileInfo.name,
                              imageURL: URL(string: viewModel.homeData.profileInfo.imageURL))
            .padding(.horizontal, Tokens.Size.Spacing.large)
            WalkyBotView(search: $viewModel.homeData.searchText)
        }
               .padding([.bottom], Tokens.Size.Spacing.large)
               .padding([.top], Tokens.Size.Spacing.huge)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
    HomeView(
            viewModel: HomeViewModel(),
            router: HomeRouter(isPresented: .constant(false))
        )
    }
}
