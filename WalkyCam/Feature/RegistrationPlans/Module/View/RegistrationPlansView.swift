import SwiftUI

struct RegistrationPlansView<ViewModel:RegistrationPlansViewModelProtocol, Router: RegistrationPlansRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var monthlyToggle: Bool = false

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Asset.logo.swiftUIImage
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: Tokens.Size.Spacing.large)
                    .foregroundColor(.naranja)
                Text(L10n.RegistrationPlans.title)
                    .font(.projectFont(size: Tokens.Size.Font.huge, weight: .bold))
                    .foregroundColor(Color.blanco)
                Text(L10n.RegistrationPlans.description)
                    .font(.projectFont(size: Tokens.Size.Font.medium, weight: .medium))
                    .foregroundColor(Color.blanco)
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    Toggle(isOn: $monthlyToggle) {
                        Text("Toggle Test")
                    }
                    .toggleStyle(WCNamelessToggleStyle())
                    HStack(alignment: .center,
                           spacing: Tokens.Size.Spacing.xsmall) {
                        Text("Plan anual")
                            .font(.projectFont(size: Tokens.Size.Font.medium, weight: .medium))
                            .foregroundColor(.blanco)
                        Text("(ahora 5%)")
                            .font(.projectFont(size: Tokens.Size.Font.medium, weight: .bold))
                            .foregroundColor(monthlyToggle ? .naranja : .blanco)
                    }
                }
                
                AsyncDataView(viewModel.availablePlans) { plans in
                    ForEach(plans, id: \.self) { item in
                        assemblePlanCard(item) {
                            print(item.name)
                        }
                    }
                } errorAction: {}
                    .preferredColorScheme(.dark)
                WCUIButton(title: L10n.RegistrationPlans.Button.title,
                           rightIcon: Asset.Icons.compare.name,
                           style: .standard,
                           descriptor: BlackButtonStyleDescriptor(),
                           action: {
                    handlePlanAction(4)
                })
            }
        }
        .padding(Tokens.Size.Spacing.regular)
        .background(Asset.Fondos.planFondo .swiftUIImage
            .ignoresSafeArea())
        .navigation(router)
        .task {
            await viewModel.fetchAvailablePlans()
        }
    }

    private func assemblePlanCard(_ item: AvailablePlanData, action: (() -> Void)?) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.negro.opacity(0.6))
                .cornerRadius(Tokens.Size.Border.Radius.large, corners: .allCorners)
            Rectangle()
                .fill(item.color)
                .cornerRadius(Tokens.Size.Border.Radius.large, corners: .allCorners)
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                HStack(alignment: .center,
                       spacing: 0) {
                    Text(item.name.capitalized)
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .foregroundColor(Color.blanco)
                    Spacer()
                    Text(
                        monthlyToggle ?
                        L10n.RegistrationPlans.Value.yearly(formatDouble(item.yearlyPrice)): L10n.RegistrationPlans.Value.monthly(formatDouble(item.monthlyPrice))
                    )
                    .font(.projectFont(size: Tokens.Size.Font.larger, weight: .bold))
                        .foregroundColor(Color.blanco)
                }
                LinkButton(
                    title: L10n.RegistrationPlans.Plan.Button.title,
                    color: .blanco) {
                        handlePlanAction(item.order - 1)
                    }
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
    }

    private func handlePlanAction(_ index: Int = 0) {
        router.routeToPlansPages(index)
    }
    
    private func formatDouble(_ data: String) -> String {
        let stringnDouble = Double(data) ?? 0.0
        return String(format: "%.f", stringnDouble)
    }
}

struct RegistrationPlansView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPlansView(
            viewModel: RegistrationPlansViewModel(
                interactor: RegistrationPlansInteractor(
                    useCases: .init(
                        fetchAllPlans: .static(
                            [ .init(
                                id: "teste",
                                name: "TESTE",
                                monthlyPrice: "120.0",
                                yearlyPrice: "240.0",
                                color: .naranja,
                                order: 0
                            )]
                        )
                    )
                )
            ),
            router: RegistrationPlansRouter(isPresented: .constant(false))
        )
    }
}

extension String {
    func toDouble() -> Double? {
        if let doubleValue = Double(self) {
            return nearbyint(doubleValue)  // Trunca o número para a parte inteira
        } else {
            return nil
        }
    }
}
