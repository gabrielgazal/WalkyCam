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
                    premiumBanner
                        .isHidden(viewModel.userData.planName == "premium")
                    Group {
                        VStack(spacing: 0) {
                            assembleItemView(title: L10n.ProfileView.Field.name,
                                             text: viewModel.userData.name,
                                             editableText: $viewModel.temporaryName)
                            assembleItemView(title: L10n.ProfileView.Field.lastname,
                                             text: viewModel.userData.lastName,
                                             editableText: $viewModel.temporaryLastname)
                            assembleItemView(
                                title: L10n.ProfileView.Field.phoneNumber,
                                text: viewModel.userData.phoneNumber,
                                editableText: $viewModel.temporaryPhoneNumber
                            )
                            assembleItemView(
                                title: L10n.ProfileView.Field.gender,
                                text: viewModel.userData.gender,
                                editableText: $viewModel.temporaryGender
                            )
                            assembleItemView(title: L10n.ProfileView.Field.birthDate,
                                             text: viewModel.userData.birthDate,
                                             editableText: $viewModel.temporaryBirthDate)
                            assembleItemView(title: L10n.ProfileView.Field.address,
                                             text: viewModel.userData.address,
                                             editableText: $viewModel.temporaryAddress)
                            assembleItemView(
                                title: L10n.ProfileView.Field.aboutMe,
                                text: viewModel.userData.additionalInfo,
                                editableText: $viewModel.temporaryAdditionalInfo
                            )
                            assembleItemView(
                                title: L10n.ProfileView.Username.title,
                                text: viewModel.userData.userName,
                                editableText: nil
                            )
                            assembleItemView(
                                title: L10n.ProfileView.Email.title,
                                text: viewModel.userData.email,
                                editableText: nil
                            )
                        }
                        
                        Group {
                            Group {
                                HStack(spacing: Tokens.Size.Spacing.regular) {
                                    Image(Asset.Icons.wIcon.name)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
                                    VStack(alignment: .leading,
                                           spacing: Tokens.Size.Spacing.tiny) {
                                        Text(L10n.ProfileView.Convert.walkycamer)
                                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                                        Text(L10n.ProfileView.Earnings.title)
                                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .regular))
                                    }
                                    Spacer()
                                }
                                .onTapGesture {
                                    router.routeToRegisterCamer()
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
                                           action: {
                                    Task {
                                        await viewModel.updateInfo()
                                    }
                                })
                                .loading(viewModel.asyncProfileInfo.isLoading)
                                WCUIButton(title: L10n.ProfileView.Button.cancel,
                                           style: .standard,
                                           descriptor: BlackButtonStyleDescriptor(),
                                           action: { viewModel.isEditingModeEnabled.toggle() })
                            }
                            .isHidden(!viewModel.isEditingModeEnabled)
                        }
                    }
                    .padding(.horizontal, Tokens.Size.Spacing.regular)
                }
            }
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

    private func assembleItemView(title: String, text: String, editableText: Binding<String>?) -> some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.large) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                Text(text.isEmpty ? L10n.ProfileView.Field.notInformed : text)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Spacer()
            }
            .isHidden(viewModel.isEditingModeEnabled)
            if let editableText = editableText {
                TextInputView(text: editableText, topDescriptionText: title, placeholder: "", textColor: .negro)
                    .isHidden(!viewModel.isEditingModeEnabled)
            }
            Divider()
        }
               .padding([.top], Tokens.Size.Spacing.large)
    }

    private func handleLogoutAction() {
        viewModel.logout()
        router.routeToLogin()
    }
    
    private var premiumBanner: some View {
        ZStack {
            Rectangle()
                .fill(Color.negro)
            HStack(alignment: .top,
                   spacing: Tokens.Size.Spacing.small) {
                Image(systemName: "crown.fill")
                    .foregroundColor(Color.premium)
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.small) {
                    Text(L10n.ProfileView.Premium.upgradeTitle)
                        .underline()
                        .font(.projectFont(size: Tokens.Size.Font.medium, weight: .black))
                        .foregroundColor(Color.premium)
                    Text(L10n.ProfileView.Premium.upgradeDescription)
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                        .foregroundColor(Color.blanco)
                }
            }
                   .padding()
        }
        .onTapGesture {
            router.routeToPlans()
        }
    }
}
