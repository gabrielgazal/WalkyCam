import SwiftUI

struct ExternalAssistantView<ViewModel:ExternalAssistantViewModelProtocol, Router: ExternalAssistantRouterProtocol>: View {

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
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.large) {
            headerView
            Text("**Ingresa el código** que te ha enviado tu asistente para poder ser asistido.")
                .font(.projectFont(size: Tokens.Size.Font.regular))
            TextInputView(
                text: $viewModel.assistantCode,
                topDescriptionText: "Código",
                placeholder: "Ingresa el código",
                backgroundColor: .blancoGris)
            .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
            Spacer()
            HStack {
                Spacer()
                Asset.Icons.ar.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 190)
                Spacer()
            }
            Spacer()
            WCUIButton(title: "Unirme",
                       style: .standard,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {
                router.routeToARHands()
            })
            .disabled(viewModel.assistantCode.isEmpty)
        }
               .padding(Tokens.Size.Spacing.large)
               .navigation(router)
    }

    private var headerView: some View {
        HStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            Text("Recibe asistencia desde cualquier lugar")
                .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
            Spacer()
        }
    }
}

struct ExternalAssistantView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalAssistantView(
            viewModel: ExternalAssistantViewModel(),
            router: ExternalAssistantRouter(isPresented: .constant(false))
        )
    }
}
