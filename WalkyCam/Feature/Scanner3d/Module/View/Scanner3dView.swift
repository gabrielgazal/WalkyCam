import SwiftUI

struct Scanner3dView<ViewModel: Scanner3dViewModelProtocol, Router: Scanner3dRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    
    @StateObject private var cameraManager = CameraManager()

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        AsyncDataView(viewModel.scanState) { item in
            Text("Save state")
        } errorAction: {}
            .isHidden(!viewModel.scanState.isLoading)
        ZStack {
            CameraBackground(session: cameraManager.session)
                .ignoresSafeArea()
                .isHidden(viewModel.scanState.isLoading)
            VStack {
                HStack {
                    Spacer()
                    HeaderCounterView(index: 1, totalSteps: 3)
                }
                Spacer()
                
                VStack(
                    alignment: .center,
                    spacing: Tokens.Size.Spacing.regular
                ) {
                    WCUIButton(
                        title: "Iniciar escaneo",
                        style: .standard,
                        descriptor: OrangeButtonStyleDescriptor()
                    ) {
                        viewModel.isVideoPickerPresented = true
                    }
                    
                    WCUIButton(
                        title: "Cancelar",
                        style: .standard,
                        descriptor: BlackButtonStyleDescriptor()
                    ) {
                        router.dismiss()
                    }
                }
            }
            .padding()
        }
        .isHidden(viewModel.scanState.isLoading)
        .fullScreenCover(isPresented: $viewModel.isVideoPickerPresented) {
            VideoPicker(
                isPresented: $viewModel.isVideoPickerPresented,
                videoData: $viewModel.videoData
            )
        }
        .onChange(of: viewModel.isVideoPickerPresented) {
            oldValue,
            newValue in
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
    
    private func headerCounterView(_ index: Int, _ totalSteps: Int) -> some View {
        ZStack {
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.black)
            HStack {
                Rectangle()
                    .frame(width: CGFloat(index - 1) * 100, height: 3)
                    .foregroundColor(.naranja)
                Spacer()
            }
            HStack(alignment: .center) {
                ForEach(0..<totalSteps) { step in
                    ZStack {
                        Circle()
                            .foregroundColor(step < index ? .naranja : .black)
                            .frame(height: 20)
                        if step < index {
                            Text("\(step + 1)")
                                .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                                .foregroundColor(.blanco)
                        }
                    }
                    if step < totalSteps - 1 {
                        Spacer()
                    }
                }
            }
        }
        .frame(width: 190)
    }
}

struct Scanner3dView_Previews: PreviewProvider {
    static var previews: some View {
    Scanner3dView(
        viewModel: Scanner3dViewModel(
            interactor: Scanner3dInteractor(
                useCases: .init(
                    scan3dFromVideo: .empty
                )
            )
        ),
            router: Scanner3dRouter(isPresented: .constant(false))
        )
    }
}
