import SwiftUI

struct RegistrationView<ViewModel: RegistrationViewModelProtocol, Router: RegistrationRouterProtocol>: View {

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
                Text("Registro")
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
                    .foregroundColor(Color.blanco)
                Group {
                    TextInputView(text: $viewModel.name,
                                  topDescriptionText: "Nombre",
                                  placeholder: "Nombre")
                    TextInputView(text: $viewModel.lastName,
                                  topDescriptionText: "Apellido",
                                  placeholder: "Apellido")
                    TextInputView(text: $viewModel.username,
                                  topDescriptionText: "Usuario",
                                  placeholder: "Nombre Usuario")
                    SecureTextInputView(text: $viewModel.password,
                                        placeholder: "Contraseña",
                                        topDescriptionText: "Contraseña",
                                        bottomDescriptionText: "Fuerza de contraseña: \(getPasswordStrength())")
                    VStack(alignment: .leading,
                           spacing: Tokens.Size.Spacing.small) {
                        ForEach(PasswordConfigurationError.allCases, id: \.self) { item in
                            passwordRuleItem(item)
                        }
                    }
                    TextInputView(text: $viewModel.email,
                                  topDescriptionText: "Email",
                                  placeholder: "nombre@email.com")
                }
                CheckBoxToggle(model: viewModel.acceptedTerms)
                    .onTapGesture {
                        viewModel.acceptedTerms.isSelected.toggle()
                    }
                WCUIButton(title: "Registrame",
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: routeToConfirmMail)
                .disabled(viewModel.isRegisterButtonDisabled())
                .loading(viewModel.registerUserAsyncData.isLoading)
                LinkButton(title: "Ya tengo una cuenta",
                           color: .naranja,
                           action: handleAlreadyRegistered)
                Text(L10n.Copyright.text)
                    .font(.projectFont(size: Tokens.Size.Font.xsmall))
                    .foregroundColor(Color.blanco)
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, Tokens.Size.Spacing.regular)
        .background(Asset.Fondos.loginFondo.swiftUIImage
            .ignoresSafeArea())
        .navigation(router)
        .snackbar(router)
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

    private func handleAlreadyRegistered() {
        router.routeToOnboarding()
    }

    private func routeToConfirmMail() {
        Task {
            await viewModel.registerUser()
        }
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(
            viewModel: RegistrationViewModel(
                interactor: RegistrationInteractor(
                    useCases: .init(registerUseCase: .empty
                                   )
                ), 
                router: RegistrationRouter(state: RouterState(isPresented: .constant(false)))
            ),
            router: RegistrationRouter(state: RouterState(isPresented: .constant(false)))
        )
    }
}
