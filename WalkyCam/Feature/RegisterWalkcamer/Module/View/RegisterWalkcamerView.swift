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
                    Text(L10n.RegisterWalkcamerView.gainText)
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .foregroundStyle(Color.blanco) +
                    Text(L10n.RegisterWalkcamerView.walkcamer)
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .foregroundStyle(Color.naranja)
                }
                Text(L10n.RegisterWalkcamerView.registerToday)
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
                          topDescriptionText: L10n.RegisterWalkcamerView.email,
                          placeholder: L10n.RegisterWalkcamerView.emailPlaceholder,
                          textColor: .negro)
            TextInputView(text: $viewModel.registrationData.name,
                          topDescriptionText: L10n.RegisterWalkcamerView.name,
                          placeholder: L10n.RegisterWalkcamerView.namePlaceholder,
                          textColor: .negro)
            TextInputView(text: $viewModel.registrationData.lastName,
                          topDescriptionText: L10n.RegisterWalkcamerView.lastName,
                          placeholder: L10n.RegisterWalkcamerView.lastNamePlaceholder,
                          textColor: .negro)
            TextInputView(
                text: $viewModel.registrationData.phoneNumber,
                status: $viewModel.phoneNumberStatus,
                topDescriptionText: L10n.RegisterWalkcamerView.phone,
                placeholder: L10n.RegisterWalkcamerView.phonePlaceholder,
                textColor: .negro,
                actions: .init(
                    onCommitAction: {
                        viewModel.phoneIsValid()
                    },
                    isFocusChanging: { focused in
                        if !focused {
                            viewModel.phoneIsValid()
                        } else {
                            viewModel.phoneNumberStatus = .default
                        }
                    }
                )
            )
        
            CheckBoxToggle(model: viewModel.acceptedTerms,
                           foregroundColor: .negro)
                .onTapGesture {
                    viewModel.acceptedTerms.isSelected.toggle()
                }
            WCUIButton(title: L10n.RegisterWalkcamerView.register,
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
