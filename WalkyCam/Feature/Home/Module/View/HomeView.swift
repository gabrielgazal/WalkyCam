import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol, Router: HomeRouterProtocol>: View {

    // swiftlint:disable line_length
    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    private let recentFunctionsColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.large) {
                ProfileHeaderView(name: viewModel.homeData.profileInfo.name,
                                  imageURL: URL(string: viewModel.homeData.profileInfo.imageURL))
                .padding(.horizontal, Tokens.Size.Spacing.large)
                WalkyBotView()
                recentFunctionsView(proxy)
                Spacer()
            }
                   .padding([.bottom], Tokens.Size.Spacing.large)
                   .padding([.top], Tokens.Size.Spacing.huge)
        }
    }

    private func recentFunctionsView(_ proxy: GeometryProxy) -> some View {
        HomeSectionView(title: "Recientes", icon: Asset.Icons.recent.name) {
            LazyVGrid(columns: recentFunctionsColumns,
                      spacing: 16) {
                ForEach(viewModel.homeData.recentFunctions, id: \.self) { item in
                    RecentFunctionsCell(title: item.title, icon: item.icon, lastItem: isLastRecentsItem(itemId: item.id))
                        .frame(width: proxy.size.width / 3, height: proxy.size.width / 3)
                        .onTapGesture {
                            print("Touched \(item.id)")
                        }
                }
            }
        }
        .padding(.horizontal, Tokens.Size.Spacing.large)
    }

    //    private func remindersView() -> some View {
    //
    //    }

    private func isLastRecentsItem(itemId: Int) -> Bool {
        return itemId == (viewModel.homeData.recentFunctions.count - 1)
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
