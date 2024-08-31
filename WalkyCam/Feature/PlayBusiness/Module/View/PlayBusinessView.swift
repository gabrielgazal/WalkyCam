import SwiftUI

struct PlayBusinessView<ViewModel: PlayBusinessViewModelProtocol, Router: PlayBusinessRouterProtocol>: View {
    
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
        ScrollView {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.large) {
                Group {
                    Text("Play & Business")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    HStack {
                        Image(Asset.Icons.lock.name)
                            .renderingMode(.template)
                        Text("WalkyCam baja demanda")
                            .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                    }
                    .foregroundColor(Color.grisOscuro)
                }
                .padding(.horizontal, Tokens.Size.Spacing.large)
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    Group {
                        HStack(spacing: Tokens.Size.Spacing.regular) {
                            squaredCell(icon: Asset.Icons.scapeRoom.name, title: "Scape Room")
                            squaredCell(icon: Asset.Icons.mariachis2.name, title: "Mariachis")
                        }
                        HStack(spacing: Tokens.Size.Spacing.regular) {
                            squaredCell(icon: Asset.Icons.filmMaker.name, title: "Film Maker")
                            squaredCell(icon: Asset.Icons.derechosDeAutor.name, title: "Copyright")
                        }
                        HStack(spacing: Tokens.Size.Spacing.regular) {
                            squaredCell(icon: Asset.Icons.productos.name, title: "Muestra de Productos")
                            squaredCell(icon: Asset.Icons.patenteDeIdea.name, title: "Idea de Negocio")
                        }
                        HStack(spacing: Tokens.Size.Spacing.regular) {
                            squaredCell(icon: Asset.Icons.fitnessWatch.name, title: "Pulsera Fitness")
                            squaredCell(icon: Asset.Icons.surpriseBox.name, title: "Caja Surpresa")
                        }
                    }
                    HStack(spacing: Tokens.Size.Spacing.small) {
                        Text("Plan Premium")
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        Image(Asset.Icons.lock.name)
                            .renderingMode(.template)
                    }
                    .foregroundColor(.white)
                    .padding(Tokens.Size.Spacing.small)
                    .background(
                        Capsule()
                            .fill(Color.premium)
                    )
                    .padding([.top], Tokens.Size.Spacing.large)
                    Group {
                        HStack(spacing: Tokens.Size.Spacing.regular) {
                            squaredCell(icon: Asset.Icons.playBusiness.name, title: "Famosos", premium: true)
                            squaredCell(icon: Asset.Icons.personalShopper.name, title: "Personal Shopper", premium: true)
                        }
                        HStack(spacing: Tokens.Size.Spacing.regular) {
                            squaredCell(icon: Asset.Icons.patenteDeInvencion.name, title: "Patente de Invención", premium: true)
                            squaredCell(icon: Asset.Icons.gymkhana.name, title: "Gymkhana", premium: true)
                        }
                    }
                }
                       .padding(Tokens.Size.Spacing.large)
                Spacer()
            }
        }
        .scrollIndicators(.hidden)
        .navigation(router)
        .bottomSheet(router)
    }
    
    private func squaredCell(icon: String, title: String, premium: Bool = false) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blanco)
                .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
                .aspectRatio(1.0, contentMode: .fit)
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
            }
            VStack {
                HStack {
                    Image(systemName: "crown.fill")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.premium)
                        .frame(width: 24)
                    Spacer()
                }
                Spacer()
            }
            .isHidden(!premium)
            .padding()
        }
        .onTapGesture {
            router.navigateTo(
                UnavailableFeatureRoute(isPresented: router.isNavigating, icon: icon, title: title)
            )
        }
    }
}

struct PlayBusinessView_Previews: PreviewProvider {
    static var previews: some View {
        PlayBusinessView(
            viewModel: PlayBusinessViewModel(),
            router: PlayBusinessRouter(isPresented: .constant(false))
        )
    }
}
