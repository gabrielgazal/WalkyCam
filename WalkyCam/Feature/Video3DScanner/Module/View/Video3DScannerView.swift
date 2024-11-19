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
        .fullScreenCover(isPresented: $viewModel.isVideoPickerPresented) {
            VideoPicker(
                isPresented: $viewModel.isVideoPickerPresented,
                videoData: $viewModel.videoData
            )
        }
        .onChange(of: viewModel.isVideoPickerPresented) { _, newValue in
            if !newValue {
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
        }
    }
}
