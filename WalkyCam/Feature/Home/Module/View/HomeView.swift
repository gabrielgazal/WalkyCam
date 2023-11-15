import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol, Router: HomeRouterProtocol>: View {

    // swiftlint:disable line_length
    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    @EnvironmentObject var tabBar: TabBarViewModel

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
            ScrollView {
                VStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.large) {
                    ProfileHeaderView(name: viewModel.homeData.profileInfo.name,
                                      imageURL: URL(string: viewModel.homeData.profileInfo.imageURL),
                                      actions: .init(notificationsAction: handleNotificationsAction,
                                                     profileAction: handleProfileAction))
                    .padding(.horizontal, Tokens.Size.Spacing.large)
                    WalkyBotView()
                    recentFunctionsView(proxy)
                    remindersView()
                    Spacer()
                }
                       .padding([.bottom], Tokens.Size.Spacing.large)
                       .padding([.top], Tokens.Size.Spacing.huge)
            }
        }
        .navigation(router)
    }

    private func recentFunctionsView(_ proxy: GeometryProxy) -> some View {
        HomeSectionView(title: "Recientes", icon: Asset.Icons.recent.name) {
            LazyVGrid(columns: recentFunctionsColumns,
                      spacing: 16) {
                ForEach(viewModel.homeData.recentFunctions, id: \.self) { item in
                    RecentFunctionsCell(title: item.title, icon: item.icon, lastItem: isLastRecentsItem(itemId: item.id))
                        .frame(width: proxy.size.width / 3, height: proxy.size.width / 3)
                        .onTapGesture {
                            if isLastRecentsItem(itemId: item.id) {
                                tabBar.tabSelection = tabBar.tabBarItems[SelectedTabItem.funcitons.rawValue]
                            } else {
                                print("Touched \(item.id)")
                            }
                        }
                }
            }
        }
        .padding(.horizontal, Tokens.Size.Spacing.large)
    }

        private func remindersView() -> some View {
            HomeSectionView(title: "Recordatorios", icon: Asset.Icons.notes.name) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center,
                           spacing: Tokens.Size.Spacing.regular) {
                        Rectangle()
                            .fill(Color.red)
                        ForEach(viewModel.homeData.reminders, id: \.self) { item in
                            ReminderCardView(date: item.date, camerName: item.camerName)
                                .shadow(
                                    color: .black.opacity(0.1),
                                    radius: 8,
                                    x: 0,
                                    y: 2
                                )
                        }
                    }
                }
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
        }

    private func isLastRecentsItem(itemId: Int) -> Bool {
        return itemId == (viewModel.homeData.recentFunctions.count - 1)
    }

    private func handleNotificationsAction() {
        router.routeToNotifications()
    }

    private func handleProfileAction() {
        router.routeToProfile()
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
