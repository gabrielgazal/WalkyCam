import SwiftUI

struct RegisterWalkcamerView<ViewModel: RegisterWalkcamerViewModelProtocol, Router: RegisterWalkcamerRouterProtocol>: View {

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
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Group {
                    Text("Genera ganancias, hazte ")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .foregroundStyle(Color.blanco) +
                    Text("WalkCamer")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .foregroundStyle(Color.naranja)
                }
                Text("Registrate hoy!")
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .regular))
                    .foregroundStyle(Color.blanco)
                registrationCard
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
        .scrollIndicators(.hidden)
        .background {
            Asset.Fondos.loginFondo.swiftUIImage
                .ignoresSafeArea()
        }
        .navigation(router)
        .withInfoIcon()
    }
    
    private var registrationCard: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            TextInputView(text: $viewModel.registrationData.email,
                          topDescriptionText: "Email",
                          placeholder: "nombre@email.com",
                          textColor: .negro)
            TextInputView(text: $viewModel.registrationData.name,
                          topDescriptionText: "Nombre",
                          placeholder: "Nombre",
                          textColor: .negro)
            TextInputView(text: $viewModel.registrationData.lastName,
                          topDescriptionText: "Apellido",
                          placeholder: "Apellido",
                          textColor: .negro)
            TextInputView(text: $viewModel.registrationData.phoneNumber,
                          topDescriptionText: "Telefono",
                          placeholder: "Telefono",
                          textColor: .negro)
        
            CheckBoxToggle(model: viewModel.acceptedTerms,
                           foregroundColor: .negro)
                .onTapGesture {
                    viewModel.acceptedTerms.isSelected.toggle()
                }
            WCUIButton(title: "Registrame",
                       style: .standard,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {
                saveUserPhone()
                viewModel.saveUserDataToRegistration()
                router.routeToProfit(registrationData: viewModel.registrationData)
            })
            .disabled(viewModel.isRegisterButtonDisabled())
        }
               .padding(Tokens.Size.Spacing.xlarge)
               .background {
                   RoundedRectangle(cornerRadius: 16)
                       .fill(Color.blanco)
               }
    }
    
    private func saveUserPhone() {
        do {
            var user = try UserSession().user()
            user.phone = viewModel.registrationData.phoneNumber
            _ = try UserSession().save(user: user)
        } catch {}
    }
}

struct RegisterWalkcamerView_Previews: PreviewProvider {
    static var previews: some View {
    RegisterWalkcamerView(
            viewModel: RegisterWalkcamerViewModel(),
            router: RegisterWalkcamerRouter(isPresented: .constant(false))
        )
    }
}
