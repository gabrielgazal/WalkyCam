import SwiftUI

struct Photo3DScannerView<ViewModel: Photo3DScannerViewModelProtocol, Router: Photo3DScannerRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    private let columns = [
        GridItem(.flexible(), spacing: Tokens.Size.Spacing.large),
        GridItem(.flexible(), spacing: Tokens.Size.Spacing.large),
        GridItem(.flexible(), spacing: Tokens.Size.Spacing.large)
    ]
    
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
                    if viewModel.capturedImages.isEmpty {
                        Text("Nenhuma foto capturada")
                            .font(.headline)
                            .foregroundColor(.gray)
                    } else {
                        LazyVGrid(columns: columns,
                                  spacing: Tokens.Size.Spacing.large) {
                            ForEach(viewModel.capturedImages, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(8)
                                    .clipped()
                            }
                        }
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
                        title: "Tirar foto",
                        style: .standard,
                        descriptor: OrangeButtonStyleDescriptor()) {
                            viewModel.showImagePicker = true
                        }
                    WCUIButton(
                        title: "Enviar fotos",
                        style: .standard,
                        descriptor: BlackButtonStyleDescriptor()) {
                            Task {
                                await viewModel.generateModelFromPhotos(
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
        .fullScreenCover(isPresented: $viewModel.showImagePicker) {
            ImagePicker(sourceType: .camera) { image in
                if let image = image {
                    viewModel.addImage(image)
                }
            }
        }
        .onChange(of: viewModel.scanState) { oldValue, newValue in
            switch newValue {
            case .failed:
                presentErrorSnackbar()
            case .loaded:
                presentSuccessSnackbar()
            default: break
            }
        }
    }
    
    private func presentErrorSnackbar() {
        router.presentSnackbar(
            SnackBarRoute(
                isPresented: router.isPresentingSnackbar,
                title: "error generating 3d model",
                style: InformationViewErrorStyle()
            )
        )
    }
    
    private func presentSuccessSnackbar() {
        router.presentSnackbar(
            SnackBarRoute(
                isPresented: router.isPresentingSnackbar,
                title: "Modelo 3D generado exitosamente! Su escaneo estará disponible en la galería una vez que se complete el procesamiento.",
                style: InformationViewSuccessStyle()
            ) {
                router.routeToHome()
            }
        )
    }
}
