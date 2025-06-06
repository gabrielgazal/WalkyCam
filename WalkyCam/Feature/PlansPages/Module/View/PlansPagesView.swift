import SwiftUI
import StripePaymentSheet

struct PlansPagesView<ViewModel: PlansPagesViewModelProtocol, Router: PlansPagesRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    @State var isPaymentSheetPresented = false
    @State var clientSecret: String? = nil

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack {
            if let paymentSheet = viewModel.paymentSheet {
                VStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    HStack {
                        Image(Asset.logo.name)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                            .foregroundColor(.naranja)
                            .isHidden(viewModel.currentPage == 5)
                        Spacer()
                        if viewModel.currentPage == 4 {
                            Image(systemName: "crown.fill")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.premium)
                                .frame(width: 50, height: 50)
                            Spacer()
                        }
                        WCUIButton(title: L10n.PlansPagesView.Button.compare,
                                   rightIcon: Asset.Icons.compare.name,
                                   style: .standard,
                                   descriptor: BlackButtonStyleDescriptor(),
                                   action: {
                            viewModel.currentPage = 5
                        })
                        .frame(width: 140)
                        .isHidden(viewModel.currentPage == 5)
                    }
                    TabView(selection: $viewModel.currentPage) {
                        ForEach(0..<viewModel.plans.count) { index in
                            PlanPageView(planData: viewModel.plans[index], lastPlan: index == 0 ? nil : viewModel.plans[index - 1])
                                .environment(\.colorScheme, .dark)
                                .tag(index)
                        }
                        PlansComparisonPageView(plansData: viewModel.plans,
                                                startPlanAction: { title in
                            if let selectedPlanIndex = viewModel.plans.firstIndex(where: { $0.title == title }) {
                                viewModel.currentPage = selectedPlanIndex
                            }
                        })
                            .tag(5)
                    }
                    .accentColor(.naranja)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                    if let title = currentPlan()?.title {
                        WCUIButton(
                            title: String(format: L10n.PlansPagesView.Button.start(title.uppercased())),
                            style: .standard,
                            descriptor: PlanButtonStyleDescriptor(planName: title),
                            action: {
                                if viewModel.currentPage > 0 {
                                    isPaymentSheetPresented = true
                                } else {
                                    router.routeToHome()
                                }
                            }
                        )
                        .frame(maxWidth: .infinity)
                        .loading(viewModel.isPaymentSheetLoading)
                        .disabled(viewModel.isPaymentSheetLoading)
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
                       .paymentSheet(isPresented: $isPaymentSheetPresented,
                                     paymentSheet: paymentSheet,
                                     onCompletion: viewModel.onPaymentCompletion)

            } else {
                VStack {
                    Spacer()
                    ProgressView()
                        .controlSize(.large)
                        .tint(.white)
                    Spacer()
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
        }
        .task {
            await viewModel.preparePaymentSheet()
        }
        .onChange(of: viewModel.currentPage) { newValue in
            if newValue > 0 && newValue < 5 {
                Task {
                    await viewModel.preparePaymentSheet()
                }
            }
        }
        .simultaneousGesture(
            DragGesture()
                .onEnded { value in
                    let dragThreshold: CGFloat = 0 // Ajuste o limite de sensibilidade ao arrasto.
                    if value.translation.width < -dragThreshold && viewModel.currentPage < viewModel.plans.count {
                        // Arrastou para a esquerda
                        withAnimation {
                            viewModel.currentPage += 1
                        }
                    } else if value.translation.width > dragThreshold && viewModel.currentPage > 0 {
                        // Arrastou para a direita
                        withAnimation {
                            viewModel.currentPage -= 1
                        }
                    }
                }
        )
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
}

struct PlansPagesView_Previews: PreviewProvider {
    static var previews: some View {
        PlansPagesView(
            viewModel: PlansPagesViewModel(
                interactor: PlansPagesInteractor(
                    useCases: .init(createSubscriptionIntent: .empty,
                                    createSubscription: .empty)
                ),
                router: PlansPagesRouter(isPresented: .constant(false)),
                currentPage: 0
            ),
            router: PlansPagesRouter(isPresented: .constant(false))
        )
    }
}
