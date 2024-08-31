import SwiftUI

struct VideoCallView<ViewModel: VideoCallViewModelProtocol, Router: VideoCallRouterProtocol>: View {
    
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
                .frame(width: 150)
            Text("Videollamada")
                .font(.projectFont(size: Tokens.Size.Font.larger, weight: .bold))
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 15)
            HStack(spacing: Tokens.Size.Spacing.regular) {
                verticalCard(title: "NUEVA",
                             description: "Crea una nueva para compartir.",
                             buttonTitle: "Crear",
                             icon: Asset.Icons.link.name,
                             action: {
                    Task {
                        await viewModel.createVideoCall(
                            onSuccess: { callId in
                                if let userId = try? UserSession().user().id {
                                    router.routeToMeetRoom(
                                        "https://meet.walkycam.com/videocall/\(callId)/\(userId)"
                                    )
                                }
                            },
                            onFailure: {}
                        )
                    }
                })
                .loading(viewModel.createVideoCallAsyncData.isLoading)
                verticalCard(title: "PROGRAMAR",
                             description: "Programar con anterioridad.",
                             buttonTitle: "Programar",
                             icon: Asset.Icons.calendar.name,
                             action: {
                    Task {
                        await viewModel.startScheduleVideoCall(
                            onSuccess: { callId in
                                ServiceInformationManager.shared.updateCallId(callId)
                                router.routeToBookCammer()
                            },
                            onFailure: {}
                        )
                    }
                })
                .loading(viewModel.scheduleVideoCallAsyncData.isLoading)
            }
            .layoutPriority(1)

            horizontalCard(action: {
                router.routeToMeetRoom(viewModel.assembleVideoCallLink())
            })
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(Asset.Fondos.videocallFondo .swiftUIImage
                   .ignoresSafeArea())
               .navigation(router)
               .sheet(router)
               .environment(\.colorScheme, .dark)
               .onAppear {
                   UserDefaults.standard.set(FunctionType.videocall.rawValue, forKey: "currentService")
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
}

struct VideoCallView_Previews: PreviewProvider {
    static var previews: some View {
    VideoCallView(
        viewModel: VideoCallViewModel(
            interactor: VideoCallInteractor(
                useCases: .init(createVideoCall: .empty, 
                                startSchedule: .empty)
            )
        ),
            router: VideoCallRouter(isPresented: .constant(false))
        )
    }
}
