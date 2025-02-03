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
                    remindersView()
                    newsView()
                    favoritesView()
                    filesView()
                    planView
                }
                       .padding([.bottom], Tokens.Size.Spacing.large)
                       .padding([.top], Tokens.Size.Spacing.huge)
            }
        }
        .navigation(router)
        .id(LanguageManager.shared.language.rawValue)
    }
    
    private func recentFunctionsView(_ proxy: GeometryProxy) -> some View {
        HomeSectionView(title: L10n.HomeView.RecentFunctions.title, icon: Asset.Icons.recent.name) {
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
                      .padding([.leading, .trailing], Tokens.Size.Spacing.regular)
        }
    }
    
    private func remindersView() -> some View {
        HomeSectionView(title: L10n.HomeView.Reminders.title, icon: Asset.Icons.notes.name) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    Asset.Ads.premium1.swiftUIImage
                        .cornerRadius(Tokens.Size.Border.Radius.large)
                        .onTapGesture {
                            router.routeToRegistrationPlans()
                        }
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
            .navigation(router)
        }
    }
    
    private func newsView() -> some View {
        HomeSectionView(title: L10n.HomeView.News.title, icon: Asset.Icons.newspaper.name) {
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
                        .onTapGesture {
                            router.routeToRegistrationPlans()
                        }
                        .navigation(router)
                }
                       .padding()
            }
        }
    }
    
    private func favoritesView() -> some View {
        HomeSectionView(title: L10n.HomeView.Favorites.title,
                        icon: Asset.Icons.heart.name,
                        action: {}) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    ForEach(viewModel.homeData.favorites, id: \.self) { item in
                        FavoriteItemView(name: item.name,
                                         photo: item.imageUrl,
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
        HomeSectionView(title: L10n.HomeView.Files.title,
                        icon: Asset.Icons.images.name,
                        action: {
            router.routeToGallery()
        }) {
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
    
    private var planView: some View {
            HStack(alignment: .top,
                   spacing: Tokens.Size.Spacing.regular) {
                Image(systemName: "crown.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.blanco)
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    Text("Compara beneficios")
                        .font(.projectFont(size: Tokens.Size.Font.medium))
                        .foregroundColor(.blanco)
                    Text("Ver todos los planes")
                        .underline()
                        .font(.projectFont(size: Tokens.Size.Font.medium, weight: .black))
                        .foregroundColor(Color.naranja)
                }
                Spacer()
            }
               .padding()
               .background(
                ZStack {
                    Asset.Fondos.planFondo.swiftUIImage
                        .resizable()
                        .scaledToFill()
                        .frame(height: 130)
                        .clipped()
                    Color.negro.opacity(0.5)
                }
               )
               .onTapGesture {
                   router.routeToRegistrationPlans()
               }
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
