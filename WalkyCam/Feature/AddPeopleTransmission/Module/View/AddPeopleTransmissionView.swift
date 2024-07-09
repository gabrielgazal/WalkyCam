import SwiftUI

struct AddPeopleTransmissionView<ViewModel:AddPeopleTransmissionViewModelProtocol, Router: AddPeopleTransmissionRouterProtocol>: View {

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
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.xlarge) {
                headerView
                Text("Puedes agregar hasta 200 asistentes más.")
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                WCUIButton(title: "Invitar amigos de Walkycam",
                           leftIcon: Asset.Icons.wIcon.name,
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {})
                Spacer()
                    .frame(height: 16)
                HStack(spacing: Tokens.Size.Spacing.small) {
                    Image(Asset.Icons.share.name)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.naranja)
                        .frame(width: 24, height: 24)
                    Text("O invitar amigos por...")
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                    Spacer()
                }
                HStack {
                    Spacer()
                    Image(Asset.Icons.socialsGrid.name)
                    Spacer()
                }
                Spacer()
                    .frame(height: 24)
                GeometryReader { proxy in
                    HStack {
                        LinkButton(title: "Invitar luego",
                                   color: .negro,
                                   action: {
                            router.routeToServiceDetails(
                                currentStep: viewModel.currentStep + 1,
                                totalSteps: viewModel.totalSteps,
                                onCancelAction: {  router.dismiss() }
                            )
                        })
                        .frame(width: proxy.size.width / 2)
                        WCUIButton(title: "Siguiente",
                                   style: .standard,
                                   descriptor: BlackButtonStyleDescriptor(),
                                   action: {
                            router.routeToServiceDetails(
                                currentStep: viewModel.currentStep + 1,
                                totalSteps: viewModel.totalSteps,
                                onCancelAction: {  router.dismiss() }
                            )
                        })
                        .frame(width: proxy.size.width / 2)
                    }
                }
            }
                   .padding(.horizontal, Tokens.Size.Spacing.large)
        }
        .navigation(router)
    }

    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                HeaderCounterView(index: viewModel.currentStep, totalSteps: viewModel.totalSteps)
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text("Agregar personas a la transmisión")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
        }
    }
}

struct AddPeopleTransmissionView_Previews: PreviewProvider {
    static var previews: some View {
        AddPeopleTransmissionView(
            viewModel: AddPeopleTransmissionViewModel(currentStep: 2, totalSteps: 4),
            router: AddPeopleTransmissionRouter(isPresented: .constant(false))
        )
    }
}
