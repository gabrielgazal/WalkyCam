import SwiftUI

struct WatchMenuView: View {
    
    // MARK: - Initialization
    @ObservedObject var viewModel: WatchMenuViewModel
    
    public init(viewModel: WatchMenuViewModel = .init()) {
        self.viewModel = viewModel
    }
    
    @State private var navigateToNextView = false
    @State private var isAnimating = false
    @State private var scale: CGFloat = 1.0 // Estado para controlar o scale effect
    
    // MARK: - View Body
    var body: some View {
        NavigationView {
            ZStack {
                Color.negro
                    .ignoresSafeArea()
                
                VStack(
                    alignment: .center,
                    spacing: Tokens.Size.Spacing.tiny) {
                        
                        HStack {
                            Text("Hi \(viewModel.getUserName())")
                                .font(.projectFont(size: Tokens.Size.Font.regular))
                            Spacer()
                            Image(systemName: "person")
                                .frame(
                                    width: Tokens.Size.Spacing.regular,
                                    height: Tokens.Size.Spacing.regular
                                )
                        }
                        .isHidden(isAnimating)
                        
                        Asset.logo.swiftUIImage
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.naranja)
                            .isHidden(isAnimating)
                        
                        VStack(alignment: .center, spacing: 0) {
                            Image("StreetCam")
                                .resizable()
                                .scaledToFit()
                                .environment(\.colorScheme, .dark)
                                .layoutPriority(1)
                                .frame(height: 70)
                                .scaleEffect(scale) // Aplica o scale effect à imagem
                            
                            if isAnimating {
                                GeometryReader { geometry in
                                    Path { path in
                                        path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                                        path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 2))
                                    }
                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [2, 2])) // Define o padrão de traço
                                    .foregroundColor(Color.grisOscuro)
                                }
                                .frame(height: 1)
                            }
                        }
                        
                        HStack {
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.naranja)
                                .frame(width: 27, height: 27)
                                .overlay {
                                    Image(systemName: "chevron.right")
                                        .renderingMode(.template)
                                        .foregroundColor(.negro)
                                }
                                .isHidden(isAnimating)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 1)) {
                                        isAnimating = true
                                    }
                                    withAnimation(.easeInOut(duration:  1.5)) {
                                        scale = 0
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        navigateToNextView = true
                                    }
                                }
                            
                            NavigationLink(destination: WatchSearchView(), isActive: $navigateToNextView) {
                                EmptyView()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.vertical, Tokens.Size.Spacing.tiny)
                    .padding(.horizontal, Tokens.Size.Spacing.small)
            }
        }
    }
}

struct NextView: View {
    var body: some View {
        Text("Nova Tela")
            .font(.largeTitle)
            .navigationTitle("Nova Tela")
    }
}

struct WatchMenuView_Previews: PreviewProvider {
    static var previews: some View {
        WatchMenuView(viewModel: .init())
    }
}
