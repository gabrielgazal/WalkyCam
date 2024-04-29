import SwiftUI

struct ProfileView<ViewModel: ProfileViewModelProtocol, Router: ProfileRouterProtocol>: View {

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
            headerView
            ScrollView(showsIndicators: false) {
                profileImageView
                    .frame(width: 120, height: 120)
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(60, corners: .allCorners)
                    .padding(Tokens.Size.Spacing.regular)
                    .overlay {
                        ZStack(alignment: .center) {
                            Color.negro.opacity(0.4)
                                .clipped()
                                .cornerRadius(60, corners: .allCorners)
                                .padding(Tokens.Size.Spacing.regular)
                            Image(Asset.Icons.edit.name)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
                                .foregroundColor(.naranja)
                        }
                        .isHidden(!viewModel.isEditingModeEnabled)
                    }
                VStack(spacing: Tokens.Size.Spacing.large) {
                    Divider()
                    Group {
                        Toggle(isOn: $viewModel.userData.isWalkCamer) {
                            Text(L10n.ProfileView.Toggle.walkycamer)
                        }
                        .toggleStyle(WCToggleStyle())
                        .disabled(true)
                        Divider()
                    }
                    .isHidden(viewModel.isEditingModeEnabled)
                    assembleItemView(title: L10n.ProfileView.Field.name,
                                     text: viewModel.userData.name,
                                     editableText: $viewModel.temporaryName)
                    Divider()
                    assembleItemView(title: L10n.ProfileView.Field.lastname,
                                     text: viewModel.userData.lastName,
                                     editableText: $viewModel.temporaryLastname)
                    Divider()
                    assembleItemView(title: L10n.ProfileView.Field.birthDate,
                                     text: viewModel.userData.birthDate,
                                     editableText: $viewModel.temporaryBirthDate)
                    Divider()
                    Group {
                        Group {
                            HStack(spacing: Tokens.Size.Spacing.regular) {
                                Image(Asset.Icons.wIcon.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
                                VStack(alignment: .leading,
                                       spacing: Tokens.Size.Spacing.small) {
                                    Text(L10n.ProfileView.Convert.walkycamer)
                                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                                    Text("(genera ganacias con nosotros)")
                                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                                }
                                Spacer()
                            }
                            Divider()
                            HStack(spacing: Tokens.Size.Spacing.regular) {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
                                Text(L10n.ProfileView.Section.logout)
                                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                                Spacer()
                            }
                            .onTapGesture {
                                handleLogoutAction()
                            }
                            Divider()
                        }
                        .isHidden(viewModel.isEditingModeEnabled)
                        Group {
                            WCUIButton(title: L10n.ProfileView.Button.save,
                                       style: .standard,
                                       descriptor: OrangeButtonStyleDescriptor(),
                                       action: {})
                            WCUIButton(title: L10n.ProfileView.Button.cancel,
                                       style: .standard,
                                       descriptor: BlackButtonStyleDescriptor(),
                                       action: { viewModel.isEditingModeEnabled.toggle() })
                        }
                        .isHidden(!viewModel.isEditingModeEnabled)
                    }
                }
            }
            .padding(Tokens.Size.Spacing.regular)
        }
               .background(Color.blanco)
               .navigation(router)
    }

    private var headerView: some View {
        HStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            Text(viewModel.isEditingModeEnabled ? L10n.ProfileView.Navigation.Edit.title: L10n.ProfileView.Navigation.Default.title)
                .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
            Spacer()
            Image(Asset.Icons.edit.name)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
                .foregroundColor(.naranja)
                .isHidden(viewModel.isEditingModeEnabled)
                .onTapGesture {
                    viewModel.isEditingModeEnabled.toggle()
                }
        }
               .padding(.horizontal, Tokens.Size.Spacing.large)
    }

    private var profileImageView: some View {
        Group {
            if let url = URL(string: viewModel.userData.profileImage) {
                AsyncImageView(imageLoadable: url) { status in
                    Group {
                        switch status {
                        case .failured:
                            placeholder
                        case .loading:
                            ProgressView()
                        default:
                            placeholder
                        }
                    }
                }
            } else {
                placeholder
            }
        }
    }

    private var placeholder: some View {
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: 120, height: 120)
            .scaledToFit()
    }

    private func assembleItemView(title: String, text: String, editableText: Binding<String>) -> some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.small) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                Text(text)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                    .isHidden(viewModel.isEditingModeEnabled)
                Spacer()
            }
            TextInputView(text: editableText, placeholder: "")
                .isHidden(!viewModel.isEditingModeEnabled)
        }
    }

    private func handleLogoutAction() {
        viewModel.logout()
        router.routeToLogin()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            viewModel: ProfileViewModel(
                interactor: ProfileInteractor(
                    useCases: .init(fetchUserDataUseCase: .empty)
                )
            ),
            router: ProfileRouter(state: RouterState(isPresented: .constant(false)))
        )
    }
}
