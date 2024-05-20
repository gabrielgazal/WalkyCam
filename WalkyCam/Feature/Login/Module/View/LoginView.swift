import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol, Router: LoginRouterProtocol>: View {

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
        ScrollView {
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Asset.logo.swiftUIImage
                    .frame(height: Tokens.Size.Spacing.huge)
                Text(L10n.LoginView.Title.text)
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
                    .foregroundColor(Color.blanco)
                TextInputView(text: $viewModel.userName,
                              topDescriptionText: L10n.LoginView.Input.User.text,
                              placeholder: L10n.LoginView.Input.User.placeholder)
                VStack(spacing: Tokens.Size.Spacing.small) {
                    SecureTextInputView(text: $viewModel.password,
                                        placeholder: L10n.LoginView.Input.Password.placeholder,
                                        topDescriptionText: L10n.LoginView.Input.Password.text,
                                        bottomDescriptionText: "Fuerza de contraseña: \(getPasswordStrength())")
                    VStack(alignment: .leading,
                           spacing: Tokens.Size.Spacing.small) {
                        ForEach(PasswordConfigurationError.allCases, id: \.self) { item in
                            passwordRuleItem(item)
                        }
                    }
                    CheckBoxToggle(model: viewModel.rememberPassword)
                        .onTapGesture {
                            viewModel.rememberPassword.isSelected.toggle()
                        }
                }
                HStack {
                    LinkButton(title: L10n.LoginView.Button.forgotPassword,
                               color: .naranja,
                               action: {})
                    Spacer()
                }
                WCUIButton(title: L10n.LoginView.Button.login,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: handleLogin)
                .disabled(!viewModel.validateFields())
                .loading(viewModel.loginUserAsyncData == .loading)
                WCUIButton(title: L10n.LoginView.Button.signup,
                           descriptor: BlackButtonStyleDescriptor(),
                           action: handleSignUp)
                Spacer()
                    .frame(height: 30)
                HStack(spacing: Tokens.Size.Spacing.small) {
                    Divider()
                    Text(L10n.LoginView.Divider.text)
                        .font(.projectFont(size: Tokens.Size.Font.small))
                        .foregroundColor(Color.plateado)
                    Divider()
                }
                HStack {
                    WCUIButton(leftIcon: Asset.SocialMedia.facebook.name,
                               style: .outline,
                               descriptor: WhiteButtonStyleDescriptor(),
                               action: {})
                    WCUIButton(leftIcon: Asset.SocialMedia.google.name,
                               style: .outline,
                               descriptor: WhiteButtonStyleDescriptor(),
                               action: {})
                    WCUIButton(leftIcon: Asset.SocialMedia.apple.name,
                               style: .outline,
                               descriptor: WhiteButtonStyleDescriptor(),
                               action: {})
                }
                .frame(height: 70)
            }
            Text(L10n.Copyright.text)
                .font(.projectFont(size: Tokens.Size.Font.xsmall))
                .foregroundColor(Color.blanco)
        }
        .padding(.horizontal, Tokens.Size.Spacing.regular)
        .background(Asset.Fondos.loginFondo.swiftUIImage
            .ignoresSafeArea())
        .navigation(router)
    }
    
    private func passwordRuleItem(_ type: PasswordConfigurationError) -> some View {
        HStack(spacing: Tokens.Size.Spacing.small) {
            ruleIcon(type)
            Text(type.asRule())
                .font(.projectFont(size: Tokens.Size.Font.small, weight: .medium))
                .foregroundColor(.blanco)
            Spacer()
        }
    }
    
    private func ruleIcon(_ item: PasswordConfigurationError) -> some View {
        let isRuleMissing = viewModel.isPasswordRight().contains(where: { $0 == item })
        return Image(systemName: isRuleMissing ? "xmark" : "checkmark")
            .foregroundColor(isRuleMissing ? .rojo : .green2)
    }

    private func handleForgotPassword() {}

    private func handleLogin() {
        viewModel.loginUserAsyncData = .loading
        Task {
            await viewModel.loginUser(
                onSuccess: {
                    router.routeToHome()
                },
                onFailure: { print("Error") }
            )
        }
    }

    private func handleSignUp() {
        router.routeToOnboarding()
    }
    
    private func getPasswordStrength() -> String {
        switch viewModel.isPasswordRight().count {
        case 0:
            return "Strong"
        case 1, 2:
            return "Medium"
        default:
            return "Weak"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            viewModel: LoginViewModel(
                interactor: LoginInteractor(
                    useCases: .init(login: .empty)
                )
            ),
            router: LoginRouter(isPresented: .constant(false))
        )
    }
}
