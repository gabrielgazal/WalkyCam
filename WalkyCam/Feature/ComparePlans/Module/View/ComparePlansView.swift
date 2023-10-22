import SwiftUI

struct ComparePlansView<ViewModel: ComparePlansViewModelProtocol, Router: ComparePlansRouterProtocol>: View {

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
               spacing: Tokens.Size.Spacing.regular) {
            TabView(selection: $viewModel.currentPage) {
                ComparePlansPageView(title: "Free",
                                     monthlyCost: 0.0,
                                     accentColor: .plateado,
                                     content: {}).tag(0)
                ComparePlansPageView(title: "Basic",
                                     monthlyCost: 30.0,
                                     accentColor: .acentoFondoDark,
                                     content: {}).tag(1)
                ComparePlansPageView(title: "Standard",
                                     monthlyCost: 60.0,
                                     accentColor: .naranja,
                                     content: {}).tag(2)
                ComparePlansPageView(title: "Premium",
                                     monthlyCost: 180.0,
                                     accentColor: .premium,
                                     content: {}).tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            PageControl(numberOfPages: 5, currentPage: $viewModel.currentPage)
        }
               .onAppear {
                   setupAppearence()
               }
               .onChange(of: viewModel.currentPage) { _ in
                   setupAppearence()
               }
               .navigation(router)
    }

    private func setupAppearence() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(getCurrentAccentColor())
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.blancoGris)
    }

    private func getCurrentAccentColor() -> Color {
        guard viewModel.currentPage < viewModel.availablePlans.count else { return .naranja }
        return viewModel.availablePlans[viewModel.currentPage].color
    }
}

struct ComparePlansView_Previews: PreviewProvider {
    static var previews: some View {
    ComparePlansView(
            viewModel: ComparePlansViewModel(),
            router: ComparePlansRouter(isPresented: .constant(false))
        )
    }
}
