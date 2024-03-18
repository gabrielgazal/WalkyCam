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
            AsyncDataView(viewModel.availablePlans) { plans in
                TabView(selection: $viewModel.currentPage) {
                    ForEach(plans, id: \.self) { plan in
                        ComparePlansPageView(
                            title: plan.name.capitalized,
                            monthlyCost: plan.monthlyPrice,
                            accentColor: planAccentColor(plan.name),
                            content: {}
                        )
                        .tag(plan.order)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                PageControl(numberOfPages: 5, currentPage: $viewModel.currentPage)
            } errorAction: {}
        }
               .onAppear {
                   setupAppearence()
               }
               .onChange(of: viewModel.currentPage) { _ in
                   setupAppearence()
               }
               .navigation(router)
               .task {
                   await viewModel.fetchAvailablePlans()
               }
    }

    private func setupAppearence() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(getCurrentAccentColor())
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.blancoGris)
    }

    private func getCurrentAccentColor() -> Color {
        guard let plans = viewModel.availablePlans.loadedValue,
              viewModel.currentPage < plans.count else { return .naranja }
        return planAccentColor(plans[viewModel.currentPage].name)
    }

    private func planAccentColor(_ title: String) -> Color {
        switch title {
        case "free":
            return .plateado
        case "basic":
            return .acentoFondoDark
        case "standard":
            return .naranja
        case "premium":
            return .premium
        default:
            return .clear
        }
    }
}

struct ComparePlansView_Previews: PreviewProvider {
    static var previews: some View {
        ComparePlansView(
            viewModel: ComparePlansViewModel(
                interactor: ComparePlansInteractor(
                    useCases: .init(fetchAllPlans: .empty)
                )
            ),
            router: ComparePlansRouter(isPresented: .constant(false))
        )
    }
}
