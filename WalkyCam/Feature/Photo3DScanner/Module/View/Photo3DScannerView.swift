import SwiftUI

struct Photo3DScannerView<ViewModel: Photo3DScannerViewModelProtocol, Router: Photo3DScannerRouterProtocol>: View {

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
        VStack {
            if viewModel.capturedImages.isEmpty {
                Text("Nenhuma foto capturada")
                    .font(.headline)
                    .foregroundColor(.gray)
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.capturedImages, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
            }
            
            Button(action: {
                viewModel.showImagePicker = true
            }) {
                Text("Tirar Foto")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Button("Enviar fotos") {
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
        }
        .fullScreenCover(isPresented: $viewModel.showImagePicker) {
            ImagePicker(sourceType: .camera) { image in
                if let image = image {
                    viewModel.addImage(image)
                }
            }
        }
    }
}
