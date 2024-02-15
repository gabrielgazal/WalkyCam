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
                            router.routeToServiceDetails(onCancelAction: {
                                router.dismiss()
                            })
                        })
                        .frame(width: proxy.size.width / 2)
                        WCUIButton(title: "Siguiente",
                                   style: .standard,
                                   descriptor: BlackButtonStyleDescriptor(),
                                   action: {
                            router.routeToServiceDetails(onCancelAction: {
                                router.dismiss()
                            })
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
                headerCounterView(3, 4)
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

struct AddPeopleTransmissionView_Previews: PreviewProvider {
    static var previews: some View {
        AddPeopleTransmissionView(
            viewModel: AddPeopleTransmissionViewModel(),
            router: AddPeopleTransmissionRouter(isPresented: .constant(false))
        )
    }
}
