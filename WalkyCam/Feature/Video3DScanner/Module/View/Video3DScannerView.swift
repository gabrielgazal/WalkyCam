import SwiftUI

struct Video3DScannerView<ViewModel: Video3DScannerViewModelProtocol, Router: Video3DScannerRouterProtocol>: View {

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
            VStack(
                alignment: .leading,
                spacing: Tokens.Size.Spacing.regular) {
                    Text("Modelado 3D")
                        .font(.projectFont(size: Tokens.Size.Font.huge, weight: .bold))
                    if let video = viewModel.videoData {
                        VideoPlayerView(videoData: video)
                            .cornerRadius(12, corners: .allCorners)
                    } else {
                        Text("Nenhum vídeo capturado")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
        }
        .snackbar(router)
        .footer {
            VStack(
                alignment: .center,
                spacing: Tokens.Size.Spacing.regular) {
                    WCUIButton(
                        title: "Gravar novo vídeo",
                        style: .standard,
                        descriptor: OrangeButtonStyleDescriptor()) {
                            viewModel.isVideoPickerPresented = true
                        }
                    WCUIButton(
                        title: "Enviar vídeo",
                        style: .standard,
                        descriptor: BlackButtonStyleDescriptor()) {
                            Task {
                                await viewModel.generateModelFromVideo(
                                    onSuccess: {
                                        print("AA SUCCESS")
                                    },
                                    onFailure: {
                                        print("AA FAILURE")
                                    }
                                )
                            }
                        }
                        .loading(viewModel.scanState.isLoading)
                }
                .padding()
        }
        .fullScreenCover(isPresented: $viewModel.isVideoPickerPresented) {
            VideoPicker(
                isPresented: $viewModel.isVideoPickerPresented,
                videoData: $viewModel.videoData
            )
        }
        .onChange(of: viewModel.scanState) { oldValue, newValue in
            switch newValue {
            case .failed:
                presentSnackbar()
            default: break
            }
        }
    }
    
    private func presentSnackbar() {
        router.presentSnackbar(
            SnackBarRoute(
                isPresented: router.isPresentingSnackbar,
                title: "error generating 3d model",
                style: InformationViewErrorStyle()
            )
        )
    }
/*
    var body: some View {
        VStack {
            if viewModel.videoData != nil {
                Text("Vídeo gravado com sucesso!")
            } else {
                Text("Nenhum vídeo gravado.")
            }
            
            Button("Gravar Vídeo") {
                viewModel.isVideoPickerPresented = true
            }
        }
    }*/
}
