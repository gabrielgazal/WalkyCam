import SwiftUI

struct FunctionMenuView<ViewModel: FunctionMenuViewModelProtocol, Router: FunctionMenuRouterProtocol>: View {

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
            Image(viewModel.model.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            Text(viewModel.model.title)
                .font(.projectFont(size: Tokens.Size.Font.larger, weight: .bold))
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 15)
            HStack(spacing: Tokens.Size.Spacing.regular) {
                verticalCard(title: L10n.FunctionMenuView.Buscar.title,
                             description: L10n.FunctionMenuView.Buscar.description,
                             buttonTitle: L10n.FunctionMenuView.Buscar.title,
                             icon: Asset.Icons.locationWhite.name,
                             action: handleCreateAction)
                .loading(viewModel.createAsyncData.isLoading)
                verticalCard(title: L10n.FunctionMenuView.Reservar.title,
                             description: L10n.FunctionMenuView.Reservar.description,
                             buttonTitle: L10n.FunctionMenuView.Reservar.title,
                             icon: Asset.Icons.calendar.name,
                             action: handleScheduleAction)
                .loading(viewModel.scheduleAsyncData.isLoading)
            }
            .layoutPriority(1)

            horizontalCard(action: {})
        }
        .padding(Tokens.Size.Spacing.regular)
        .background(Image(viewModel.model.background)
            .ignoresSafeArea())
        .navigation(router)
        .sheet(router)
        .environment(\.colorScheme, .dark)
        .onAppear {
            UserDefaults.standard.set(viewModel.model.type.rawValue, forKey: "currentService")
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
                Text(L10n.FunctionMenuView.Unirse.title)
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
            }
            Text(L10n.FunctionMenuView.IngresaElCodigo.title)
                .font(.projectFont(size: Tokens.Size.Font.regular))
            HStack(spacing: Tokens.Size.Spacing.regular) {
                TextInputView(text: .constant(""),
                              placeholder: "Ingresar código")
                WCUIButton(title: L10n.FunctionMenuView.Unirme.title,
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
    
    private func handleCreateAction() {
        Task {
            await viewModel.createAction(
                onSuccess: {
                    router.routeToSearchCammer()
                },
                onFailure: {}
            )
        }
    }
    
    private func handleScheduleAction() {
        Task {
            await viewModel.scheduleAction(
                onSuccess: { callId in
                    ServiceInformationManager.shared.updateCallId(callId)
                    router.routeToScheduleCammer()
                },
                onFailure: {}
            )
        }
    }
}

struct FunctionMenuView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionMenuView(
            viewModel: FunctionMenuViewModel(
                interactor: FunctionMenuInteractor(
                    useCases: .init(startCreate: .empty, startSchedule: .empty)
                ),
                model: .init(type: .drone,
                             title: "Teste",
                             icon: Asset.Icons.drone.name,
                             background: Asset.Fondos.videocallFondo.name)
            ),
            router: FunctionMenuRouter(isPresented: .constant(false))
        )
    }
}
