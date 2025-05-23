import SwiftUI

struct SpecialistNotifiedView<ViewModel: SpecialistNotifiedViewModelProtocol, Router: SpecialistNotifiedRouterProtocol>: View {

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
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            headerView
            Text(L10n.SpecialistNotifiedView.CuandoElTecnicoConfirme.title.toMarkdown())
                .font(.projectFont(size: Tokens.Size.Font.regular))
            
            Spacer()
            HStack {
                Spacer()
                Asset.Icons.ar.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 190)
                Spacer()
            }
            Spacer()
                .frame(height: 64)
            WCUIButton(title: L10n.SpecialistNotifiedView.Aceptar.title,
                       style: .standard,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {
                router.routeToARHands()
            })
            WCUIButton(title: L10n.SpecialistNotifiedView.CancelarAsistencia.title,
                       style: .standard,
                       descriptor: BlackButtonStyleDescriptor(),
                       action: {
                router.dismiss()
            })
        }
        .padding(.horizontal, Tokens.Size.Spacing.large)
        .navigation(router)
    }

    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(3, 3)
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.SpecialistNotifiedView.ElEspecialistaHaSidoNotificado.title)
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
                    .frame(width: CGFloat(index - 1) * 95, height: 3)
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

struct SpecialistNotifiedView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistNotifiedView(
            viewModel: SpecialistNotifiedViewModel(),
            router: SpecialistNotifiedRouter(isPresented: .constant(false))
        )
    }
}
