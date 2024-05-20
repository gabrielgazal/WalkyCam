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
//                    TextInputView(text: $viewModel.name,
//                                  topDescriptionText: "Nombre",
//                                  placeholder: "Nombre")
//                    TextInputView(text: $viewModel.lastName,
//                                  topDescriptionText: "Apellido",
//                                  placeholder: "Apellido")
//                    TextInputView(text: $viewModel.username,
//                                  topDescriptionText: "Usuario",
//                                  placeholder: "Nombre Usuario")
//                    SecureTextInputView(text: $viewModel.password,
//                                        placeholder: "Contraseña",
//                                        topDescriptionText: "Contraseña")
//                    TextInputView(text: $viewModel.email,
//                                  topDescriptionText: "Email",
//                                  placeholder: "nombre@email.com")
                    Text("teste")
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
                LinkButton(title: "Ya tengo una cuenta",
                           color: .naranja,
                           action: handleAlreadyRegistered)
                Text(L10n.Copyright.text)
                    .font(.projectFont(size: Tokens.Size.Font.xsmall))
                    .foregroundColor(Color.blanco)
            }
        }
        .padding(.horizontal, Tokens.Size.Spacing.regular)
        .background(Asset.Fondos.loginFondo.swiftUIImage
            .ignoresSafeArea())
        .navigation(router)
    }

    private func handleAlreadyRegistered() {
        router.routeToOnboarding()
    }

    private func routeToConfirmMail() {
        Task {
            await viewModel.registerUser(
                onSuccess: {
                    router.routeToConfirmMail()
                },
                onFailure: {})
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
                )
            ),
            router: RegistrationRouter(state: RouterState(isPresented: .constant(false)))
        )
    }
}
