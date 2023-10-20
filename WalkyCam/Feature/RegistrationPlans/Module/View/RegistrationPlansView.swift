import SwiftUI

struct RegistrationPlansView<ViewModel:RegistrationPlansViewModelProtocol, Router: RegistrationPlansRouterProtocol>: View {

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
                ForEach(viewModel.availablePlans, id: \.self) { item in
                    assemblePlanCard(item) {
                        print(item.name)
                    }
                }
                WCUIButton(title: L10n.RegistrationPlans.Button.title,
                           rightIcon: Asset.Icons.compare.name,
                           style: .standard,
                           descriptor: BlackButtonStyleDescriptor(),
                           action: {})
            }
        }
        .padding(Tokens.Size.Spacing.regular)
        .background(Asset.Fondos.planFondo .swiftUIImage
            .ignoresSafeArea())
        .navigation(router)
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
                    Text(item.name)
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .foregroundColor(Color.blanco)
                    Spacer()
                    Text(L10n.RegistrationPlans.value(item.value))
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .foregroundColor(Color.blanco)
                }
                WCUIButton(title: L10n.RegistrationPlans.Plan.Button.title,
                           style: .outline,
                           descriptor: WhiteButtonStyleDescriptor(),
                           action: {})
                .frame(width: 100, height: 32)
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
    }
}

struct RegistrationPlansView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPlansView(
            viewModel: RegistrationPlansViewModel(),
            router: RegistrationPlansRouter(isPresented: .constant(false))
        )
    }
}
