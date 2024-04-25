import SwiftUI

struct StartupView<ViewModel: StartupViewModelProtocol, Router: StartupRouterProtocol>: View {

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
            Asset.logo.swiftUIImage
                .frame(height: Tokens.Size.Spacing.huge)
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 44)
                    .fill(Color.black.opacity(0.7))
                    .frame(height: 295)
                VStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    Text(L10n.StartupView.title(viewModel.userName))
                        .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
                        .foregroundColor(Color.blanco)
                        .multilineTextAlignment(.center)
                    Text(L10n.StartupView.subtitle)
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                        .foregroundColor(Color.blanco)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(height: 40)
                    WCUIButton(title: L10n.StartupView.button,
                               style: .standard,
                               descriptor: OrangeButtonStyleDescriptor(),
                               action: handleAction)
                }
                       .padding(Tokens.Size.Spacing.regular)
            }
            Spacer()
            Text(L10n.Copyright.text)
                .font(.projectFont(size: Tokens.Size.Font.xsmall))
                .foregroundColor(Color.blanco)
        }
               .padding(.horizontal, Tokens.Size.Spacing.regular)
               .background(Asset.Fondos.loginFondo.swiftUIImage
                .ignoresSafeArea())
               .navigation(router)
    }

    private func handleAction() {
        router.routeToRegistrationPlans()
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
    StartupView(
            viewModel: StartupViewModel(),
            router: StartupRouter(isPresented: .constant(false))
        )
    }
}
