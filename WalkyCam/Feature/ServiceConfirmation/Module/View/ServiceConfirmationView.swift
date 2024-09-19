import SwiftUI

struct ServiceConfirmationView<ViewModel: ServiceConfirmationViewModelProtocol, Router: ServiceConfirmationRouterProtocol>: View {
    
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
                   spacing: Tokens.Size.Spacing.large) {
                headerView
                VStack(spacing: 0) {
                    Divider()
                    ForEach(viewModel.detailItems, id: \.self) { item in
                        cellView(data: item)
                    }
                }
            }
                   .padding(.horizontal, Tokens.Size.Spacing.large)
        }
        .footer {
            VStack(spacing: Tokens.Size.Spacing.regular) {
                WCUIButton(title: L10n.ServiceConfirmationView.ok,
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    Task {
                        await viewModel.saveVideoCall(
                            onSuccess: {
                                router.routeToHome()
                            },
                            onFailure: {}
                        )
                    }
                })
                .loading(viewModel.saveCallAsyncData.isLoading)
                WCUIButton(title: L10n.ServiceConfirmationView.cancel,
                           style: .standard,
                           descriptor: BlackButtonStyleDescriptor(),
                           action: {
                    Task {
                        await viewModel.cancelVideoCall(
                            onSuccess: {
                                router.dismiss()
                            },
                            onFailure: {}
                        )
                    }
                })
                .loading(viewModel.cancelCallAsyncData.isLoading)
            }
            .padding(Tokens.Size.Spacing.large)
        }
    }
    
    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.ServiceConfirmationView.successMessage)
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
        }
    }
    
    private func cellView(data: ServiceDetailsItemModel) -> some View {
        return VStack(alignment: .leading,
                      spacing: Tokens.Size.Spacing.large) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Text(data.title)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                Text(data.value)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                if let image = data.image,
                   data.title == L10n.ServiceConfirmationView.link,
                   let userId = try? UserSession().user().id,
                   let url = URL(string: "https://meet.walkycam.com/videocall/\(ServiceInformationManager.shared.getServiceBasicInformation().callId)/\(userId)"){
                    ShareLink(item: url){
                        Image(image)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.naranja)
                    }
                }
                Spacer()
            }
            Divider()
        }
                      .padding([.top], Tokens.Size.Spacing.large)
    }
    
    private var assistantView: some View {
        VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.small) {
                    Text(L10n.ServiceConfirmationView.assistants)
                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    Text("3")
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                    Image(systemName: "eye")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.naranja)
                }
                Text(L10n.ServiceConfirmationView.invitationMessage)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Divider()
            }
    }
}

struct ServiceConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceConfirmationView(
            viewModel: ServiceConfirmationViewModel(
                interactor: ServiceConfirmationInteractor(
                    useCases: .init(
                        saveVideoCall: .empty,
                        cancelVideoCall: .empty
                    )
                )
            ),
            router: ServiceConfirmationRouter(state: RouterState(isPresented: .constant(false)))
        )
    }
}
