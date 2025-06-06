import SwiftUI

struct TabBarView<ViewModel: TabBarViewModelProtocol, Router: TabBarRouterProtocol>: View {
    // MARK: - Constants

    private struct ViewMetrics {}

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var languageSelected = false
    @AppStorage("language")
    private var language = LanguageManager.shared.language
    private let viewMetrics: ViewMetrics = .init()

    // MARK: - Initialization

    init(
        viewModel: ViewModel,
        router: Router
    ) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        WCTabBarContainerView(
            tabBarItems: viewModel.tabBarItems,
            selection: $viewModel.tabSelection
        )
        .ignoresSafeArea(edges: [.top])
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .environmentObject(viewModel)
        .environment(\.locale, LanguageManager.shared.language.locale)
//        .onAppear {
//            Task {
//                await viewModel.fetchStreetcammers()
//            }
//        }
    }
}
