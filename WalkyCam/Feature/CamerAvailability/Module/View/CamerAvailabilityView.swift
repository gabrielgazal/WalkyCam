import SwiftUI
@_spi(Experimental) import MapboxMaps

struct CamerAvailabilityView<ViewModel: CamerAvailabilityViewModelProtocol, Router: CamerAvailabilityRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @StateObject var locationManager = LocationPermissionManager()

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            headerView
                .padding(.horizontal, Tokens.Size.Spacing.regular)
            WCTopBarContainerView(
                topBarItems: viewModel.tabBarItems,
                selection: $viewModel.tabSelection
            )
            .environmentObject(viewModel)
        }
               .padding([.top], Tokens.Size.Spacing.huge)
               .ignoresSafeArea()
               .navigation(router)
               .footer {
                   HStack(alignment: .center,
                          spacing: Tokens.Size.Spacing.regular) {
                       WCUIButton(
                        title: "Cancelar",
                        style: .outline,
                        descriptor: OrangeButtonStyleDescriptor(),
                        action: {}
                       )
                       WCUIButton(
                        title: "Finalizar",
                        style: .standard,
                        descriptor: OrangeButtonStyleDescriptor(),
                        action: {}
                       )
                   }
                          .padding()
               }
    }
    
    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(4, 4)
            }
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text("Indica disponibilidad y área de trabajo")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
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
                    .frame(width: CGFloat(index - 1) * 63.3, height: 3)
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

struct CamerAvailabilityView_Previews: PreviewProvider {
    static var previews: some View {
    CamerAvailabilityView(
            viewModel: CamerAvailabilityViewModel(),
            router: CamerAvailabilityRouter(isPresented: .constant(false))
        )
    }
}
