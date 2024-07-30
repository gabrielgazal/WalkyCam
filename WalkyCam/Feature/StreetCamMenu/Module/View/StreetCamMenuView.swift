import SwiftUI

struct StreetCamMenuView<ViewModel: StreetCamMenuViewModelProtocol, Router: StreetCamMenuRouterProtocol>: View {

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
               spacing: Tokens.Size.Spacing.small) {
            Image(Asset.Icons.streetCam.name)
                .resizable()
                .scaledToFit()
                .frame(height: 124)
            Text("Conecta con cualquier lugar!")
                .font(.projectFont(size: Tokens.Size.Font.larger, weight: .bold))
                .multilineTextAlignment(.center)
            HStack(spacing: Tokens.Size.Spacing.regular) {
                verticalCard(title: "BUSCAR",
                             description: "Localiza tu WalkCamer más cercano.",
                             buttonTitle: "Buscar",
                             icon: Asset.Icons.locationWhite.name,
                             action: handleCreateStreetcam)
                .loading(viewModel.createStreetcamAsyncData.isLoading)
                verticalCard(title: "RESERVAR",
                             description: "Programa tu WalkCamer con anterioridad.",
                             buttonTitle: "Reservar",
                             icon: Asset.Icons.calendar.name,
                             action: handleScheduleStreetcam)
                .loading(viewModel.scheduleStreetcamAsyncData.isLoading)
            }
            horizontalCard(action: {})
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(Asset.Fondos.videocallFondo .swiftUIImage
                   .ignoresSafeArea())
               .navigation(router)
               .sheet(router)
               .environment(\.colorScheme, .dark)
               .onAppear {
                   UserDefaults.standard.set(FunctionType.streetcam.rawValue, forKey: "currentService")
               }
    }

    private func verticalCard(title: String,
                              description: String,
                              buttonTitle: String,
                              icon: String,
                              action: (() -> Void)?) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
            Text(description)
                .font(.projectFont(size: Tokens.Size.Font.regular))
                .multilineTextAlignment(.center)
            WCUIButton(title: buttonTitle,
                       style: .standard,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {
                action?()
            })
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(
                Color.negro
                    .opacity(0.8)
                    .cornerRadius(48)
               )
    }

    private func horizontalCard(action: (() -> Void)?) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Image(Asset.Icons.joinMeet.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text("UNIRSE")
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
            }
            Text("Ingresa el código que has recebido.")
                .font(.projectFont(size: Tokens.Size.Font.regular))
            HStack(spacing: Tokens.Size.Spacing.regular) {
                TextInputView(text: .constant(""),
                              placeholder: "Ingresar código")
                WCUIButton(title: "Unirme",
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    action?()
                })
            }
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(
                Color.negro
                    .opacity(0.8)
                    .cornerRadius(48)
               )
    }
    
    
    private func handleCreateStreetcam() {
        Task {
            await viewModel.createStreetcam(
                onSuccess: {
                    router.routeToSearchCammer()
                },
                onFailure: {
                    print("Failed")
                }
            )
        }
    }
    
    private func handleScheduleStreetcam() {
        Task {
            await viewModel.scheduleStreetcam(
                onSuccess: { callId in
                    ServiceInformationManager.shared.updateCallId(callId)
                    router.routeToBookCammer()
                },
                onFailure: {}
            )
        }
    }
}

struct StreetCamMenuView_Previews: PreviewProvider {
    static var previews: some View {
    StreetCamMenuView(
        viewModel: StreetCamMenuViewModel(
            interactor: StreetCamMenuInteractor(
                useCases: .init(
                    startCreateStreetcam: .empty,
                    startScheduleStreetcam: .empty
                )
            )
        ),
            router: StreetCamMenuRouter(isPresented: .constant(false))
        )
    }
}
