import SwiftUI

struct PlansPagesView<ViewModel: PlansPagesViewModelProtocol, Router: PlansPagesRouterProtocol>: View {

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
            HStack {
                Image(Asset.logo.name)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .foregroundColor(.naranja)
                Spacer()
                WCUIButton(title: "Comparar",
                           rightIcon: Asset.Icons.compare.name,
                           style: .standard,
                           descriptor: BlackButtonStyleDescriptor(),
                           action: {})
                .frame(width: 140)
                .isHidden(viewModel.currentPage == 4)
            }
            TabView(selection: $viewModel.currentPage) {
                ForEach(0..<viewModel.plans.count) { index in
                    PlanPageView(planData: viewModel.plans[index], lastPlan: index == 0 ? nil : viewModel.plans[index - 1])
                        .tag(index)
                }
                Color.green
                    .tag(4)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            if let title = currentPlan()?.title {
                WCUIButton(
                    title: "Start \(title)",
                    style: .standard,
                    descriptor: getButtonDescriptor(),
                    action: {}
                )
                .frame(maxWidth: .infinity)
            }
            PageControl(numberOfPages: viewModel.plans.count + 1, currentPage: $viewModel.currentPage)
        }
               .background(
                Image(currentPlan()?.backgroundImage ?? "")
               )
               .onAppear {
                   setupAppearence()
               }
               .navigation(router)
               .padding(.horizontal, Tokens.Size.Spacing.regular)
               .background(ignoresSafeAreaEdges: .all)
    }

    private func setupAppearence() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.naranja)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.blancoGris)
    }

    private func currentPlan() -> PlansPagesModel? {
        if viewModel.currentPage < viewModel.plans.count {
            return viewModel.plans[viewModel.currentPage]
        } else {
            return nil
        }
    }

    private func getButtonDescriptor() -> ButtonStyleDescriptorProtocol {
        switch viewModel.currentPage {
        case 0:
            return GreyButtonStyleDescriptor()
        case 1:
            return BlueButtonStyleDescriptor()
        case 2:
            return OrangeButtonStyleDescriptor()
        case 3:
            return YellowButtonStyleDescriptor()
        default:
            return OrangeButtonStyleDescriptor()
        }
    }
}

struct PlansPagesView_Previews: PreviewProvider {
    static var previews: some View {
        PlansPagesView(
            viewModel: PlansPagesViewModel(currentPage: 0),
            router: PlansPagesRouter(isPresented: .constant(false))
        )
    }
}
