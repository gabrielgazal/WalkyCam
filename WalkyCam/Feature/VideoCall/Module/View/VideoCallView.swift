import SwiftUI

struct VideoCallView<ViewModel:VideoCallViewModelProtocol, Router: VideoCallRouterProtocol>: View {

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
            Image(Asset.Icons.videoCall.name)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Videollamada")
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
            Spacer()
                .frame(height: 30)
            HStack(spacing: Tokens.Size.Spacing.regular) {
                verticalCard(title: "NUEVA",
                             description: "Crea una nueva para compartir",
                             buttonTitle: "Crear",
                             icon: Asset.Icons.link.name,
                             action: {})
                verticalCard(title: "PROGRAMAR",
                             description: "Programa con anterioridad",
                             buttonTitle: "Programar",
                             icon: Asset.Icons.calendar.name,
                             action: {})
            }
            horizontalCard(action: {
                router.routeToMeetRoom()
            })
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(Asset.Fondos.videocallFondo .swiftUIImage
                   .ignoresSafeArea())
               .navigation(router)
               .sheet(router)
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
                Image(Asset.Icons.calendar.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text("UNIRSE")
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
            }
            Text("Ingresa el código que has recebido.")
                .font(.projectFont(size: Tokens.Size.Font.regular))
            HStack(spacing: Tokens.Size.Spacing.regular) {
                TextInputView(text: .constant("https://meet.jit.si/\(viewModel.videoCallLink)"),
                              placeholder: "Teste")
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
}

struct VideoCallView_Previews: PreviewProvider {
    static var previews: some View {
    VideoCallView(
            viewModel: VideoCallViewModel(),
            router: VideoCallRouter(isPresented: .constant(false))
        )
    }
}
