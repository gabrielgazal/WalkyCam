import SwiftUI

struct Photo3DScannerView<ViewModel: Photo3DScannerViewModelProtocol, Router: Photo3DScannerRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    private let columns = [
        GridItem(.flexible(), spacing: Tokens.Size.Spacing.large),
        GridItem(.flexible(), spacing: Tokens.Size.Spacing.large)
    ]
    
    // MARK: - State para controlar qual posição está sendo capturada
    @State private var currentPosition: String = "front"
    private let positions = ["front", "back", "left", "right"]
    private let positionLabels = [
        "front": "Delantera",
        "back": "Trasera",
        "left": "Izquierda",
        "right": "Derecha"
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
                    
                    // Status das fotos capturadas
                    VStack(alignment: .leading, spacing: Tokens.Size.Spacing.small) {
                        Text("Progreso: \(viewModel.capturedImages.count)/4 fotos")
                            .font(.headline)
                        
                        if viewModel.capturedImages.count < 4 {
                            Text("Próxima foto: \(positionLabels[currentPosition] ?? currentPosition)")
                                .font(.subheadline)
                                .foregroundColor(.orange)
                        }
                    }
                    
                    if viewModel.capturedImages.isEmpty {
                        VStack {
                            Image(systemName: "camera")
                                .font(.system(size: 50))
                                .foregroundColor(.gray)
                            Text("Ninguna foto seleccionada")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, minHeight: 200)
                    } else {
                        // Grid mostrando as fotos por posição
                        LazyVGrid(columns: columns,
                                  spacing: Tokens.Size.Spacing.large) {
                            ForEach(positions, id: \.self) { position in
                                VStack {
                                    if let image = viewModel.imageForPosition(position) {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(8)
                                            .clipped()
                                    } else {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 100, height: 100)
                                            .overlay(
                                                VStack {
                                                    Image(systemName: "camera")
                                                        .foregroundColor(.gray)
                                                    Text("Pendiente")
                                                        .font(.caption)
                                                        .foregroundColor(.gray)
                                                }
                                            )
                                    }
                                    Text(positionLabels[position] ?? position)
                                        .font(.caption)
                                        .foregroundColor(.primary)
                                }
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
                    
                    // Botão para tirar foto - só aparece se ainda não tem 4 fotos
                    if viewModel.capturedImages.count < 4 {
                        WCUIButton(
                            title: "Tomar foto \(positionLabels[currentPosition] ?? currentPosition)",
                            style: .standard,
                            descriptor: OrangeButtonStyleDescriptor()) {
                                viewModel.showImagePicker = true
                            }
                    }
                    
                    // Botão para enviar - só aparece se tem 4 fotos
                    if viewModel.capturedImages.count == 4 {
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
                    
                    if viewModel.capturedImages.count > 0 {
                        WCUIButton(
                            title: "Empezar de nuevo",
                            style: .standard,
                            descriptor: BlackButtonStyleDescriptor()) {
                                viewModel.clearAllImages()
                                currentPosition = "front"
                            }
                    }
                }
                .padding()
        }
        .fullScreenCover(isPresented: $viewModel.showImagePicker) {
            ImagePicker(sourceType: .camera) { images in
                if let image = images.first {
                    viewModel.addImage(image, for: currentPosition)
                    updateCurrentPosition()
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
    
    // MARK: - Helper Methods
    
    private func updateCurrentPosition() {
        guard let currentIndex = positions.firstIndex(of: currentPosition) else { return }
        let nextIndex = currentIndex + 1
        if nextIndex < positions.count {
            currentPosition = positions[nextIndex]
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
