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
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.large) {
                    ProfileHeaderView(name: viewModel.homeData.profileInfo.name,
                                      imageURL: URL(string: viewModel.homeData.profileInfo.imageURL),
                                      actions: .init(chatAction: handleChatAction,
                                                     notificationsAction: handleNotificationsAction,
                                                     profileAction: handleProfileAction))
                    .padding(.horizontal, Tokens.Size.Spacing.large)
                    WalkyBotItemView(action: {
                        router.routeToWalkyBot()
                    })
                    recentFunctionsView(proxy)
                        .padding([.leading, .trailing], Tokens.Size.Spacing.regular)
                    remindersView()
                    newsView()
                    favoritesView()
                    filesView()
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
                                tabBar.tabSelection = tabBar.tabBarItems[SelectedTabItem.functions.rawValue]
                            } else {
                                switch item.id {
                                case 0:
                                    router.routeToVideoCall()
                                case 1:
                                    router.routeToWalkCamer()
                                case 2:
                                    router.routeToScan3D()
                                case 3:
                                    router.routeToARHands()
                                case 4:
                                    router.routeToDrone()
                                default:
                                    print("Touched \(item.id)")
                                }
                            }
                        }
                }
            }
        }
    }

    private func remindersView() -> some View {
        HomeSectionView(title: "Recordatorios", icon: Asset.Icons.notes.name) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    Asset.Ads.premium1.swiftUIImage
                        .cornerRadius(Tokens.Size.Border.Radius.large)
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
                       .padding()
            }
        }
    }

    private func newsView() -> some View {
        HomeSectionView(title: "Novedades", icon: Asset.Icons.newspaper.name) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    ForEach(viewModel.homeData.news, id: \.self) { item in
                        NewsItemView(title: item.title, description: item.description, icon: item.icon)
                            .shadow(
                                color: .black.opacity(0.1),
                                radius: 8,
                                x: 0,
                                y: 2
                            )
                    }
                    Asset.Ads.premium1.swiftUIImage
                        .cornerRadius(Tokens.Size.Border.Radius.large)
                }
                       .padding()
            }
        }
    }

    private func favoritesView() -> some View {
        HomeSectionView(title: "Favoritos",
                        icon: Asset.Icons.heart.name,
                        action: {}) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    ForEach(viewModel.homeData.favorites, id: \.self) { item in
                        FavoriteItemView(name: item.name,
                                         photo: .imageMock,
                                         location: item.location,
                                         stars: item.stars,
                                         technologies: item.technologies)
                    }
                }
                       .padding()
            }
        }
    }

    private func filesView() -> some View {
        HomeSectionView(title: "Galeria de archivos",
                        icon: Asset.Icons.images.name,
                        action: { tabBar.tabSelection = tabBar.tabBarItems[SelectedTabItem.menu.rawValue] }) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    ForEach(viewModel.homeData.files, id: \.self) { item in
                        VStack(alignment: .center,
                               spacing: Tokens.Size.Spacing.regular) {
                            Image(item.icon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 64, height: 64)
                            Text(item.title)
                                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        }
                               .padding(Tokens.Size.Spacing.large)
                               .background(
                                Color.blanco
                               )
                               .cornerRadius(Tokens.Size.Border.Radius.xlarge, corners: .allCorners)
                               .shadow(
                                color: Color.negro.opacity(0.1),
                                radius: 10,
                                x: 0,
                                y: 2
                               )
                    }
                }
                       .padding()
            }
        }
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

    private func handleChatAction() {
        router.routeToChat()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel(
                interactor: HomeInteractor(
                    useCases: .init(
                        fetchUserHeaderDataUseCase: .empty
                    )
                )
            ),
            router: HomeRouter(isPresented: .constant(false))
        )
    }
}
