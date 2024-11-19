import SwiftUI

struct Scanner3dView<ViewModel: Scanner3dViewModelProtocol, Router: Scanner3dRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    @StateObject private var videoManager = VideoManager()

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        ZStack {
            CameraBackground(session: videoManager.session)
                .ignoresSafeArea()
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
                        title: "VIDEO SCAN",
                        style: .standard,
                        descriptor: OrangeButtonStyleDescriptor()
                    ) {
                        router.navigateTo(
                            Video3DScannerRoute(isPresented: router.isNavigating)
                        )
                    }
                    
                    WCUIButton(
                        title: "PHOTO SCAN",
                        style: .standard,
                        descriptor: OrangeButtonStyleDescriptor()
                    ) {
                        router.navigateTo(
                            Photo3DScannerRoute(isPresented: router.isNavigating)
                        )
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
        .navigation(router)
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
