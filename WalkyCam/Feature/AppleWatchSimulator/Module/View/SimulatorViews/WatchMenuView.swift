//
//  WatchMenuView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 23/01/25.
//

import SwiftUI

struct WatchMenuView: View {
    @ObservedObject var viewModel: WatchMenuViewModel

    public init(viewModel: WatchMenuViewModel = .init()) {
        self.viewModel = viewModel
    }

    @State private var isAnimating = false
    @State private var scale: CGFloat = 1.0
    @State private var path = NavigationPath() // Para gerenciar a navegação
    @State private var isButtonHidden = false
    
    var body: some View {
        ZStack {
            Color.blancoGris // Fundo da simulação
                .ignoresSafeArea()

            VStack {
                // Contêiner simulando o corpo do Apple Watch
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.gray.opacity(0.3)) // Simula o corpo do relógio
                        .frame(width: 250, height: 315) // Tamanho proporcional ao Apple Watch

                    // Conteúdo da WatchMenuView
                    NavigationStack(path: $path) {
                        ZStack {
                            Color.negro
                                .cornerRadius(32)
                                .ignoresSafeArea()

                            VStack(
                                alignment: .center,
                                spacing: Tokens.Size.Spacing.small) {

                                // Saudação e ícone de usuário
                                HStack {
                                    Text("Hi, \(viewModel.getUserName())")
                                        .font(.projectFont(size: Tokens.Size.Font.regular))
                                        .foregroundColor(Color.blanco)

                                    Spacer()
                                    Image(systemName: "person")
                                        .renderingMode(.template)
                                        .foregroundColor(Color.blanco)
                                        .frame(
                                            width: Tokens.Size.Spacing.regular,
                                            height: Tokens.Size.Spacing.regular
                                        )
                                }
                                .isHidden(isAnimating)

                                // Logo
                                Asset.logo.swiftUIImage
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color.naranja)
                                    .isHidden(isAnimating)

                                // Ícone animado e linha
                                VStack(alignment: .center, spacing: 0) {
                                    Asset.Icons.streetCam.swiftUIImage
                                        .resizable()
                                        .scaledToFit()
                                        .environment(\.colorScheme, .dark)
                                        .layoutPriority(1)
                                        .frame(height: 70)
                                        .scaleEffect(scale)

                                    if isAnimating {
                                        GeometryReader { geometry in
                                            Path { path in
                                                path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                                                path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 2))
                                            }
                                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [2, 2]))
                                            .foregroundColor(Color.grisOscuro)
                                        }
                                        .frame(height: 1)
                                    }
                                }

                                // Botão de navegação
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
                                            startAnimation()
                                        }
                                }
                            }
                            .padding(.vertical, Tokens.Size.Spacing.tiny)
                            .padding(.horizontal, Tokens.Size.Spacing.small)
                        }
                        .navigationDestination(for: String.self) { destination in
                            if destination == "WatchSearchView" {
                                WatchSearchView()
                            }
                        }
                    }
                    .frame(width: 234, height: 299) // Ajuste para caber no simulador
                    .cornerRadius(32) // Bordas arredondadas para o "mostrador"
                }
                
                WCUIButton(
                    title: "Start Watch Simulation",
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: { startAnimation() }
                )
                .padding()
                .isHidden(isButtonHidden)
            }
        }
    }
    
    private func startAnimation() {
        isButtonHidden = true
        withAnimation(.easeInOut(duration: 1)) {
            isAnimating = true
        }
        withAnimation(.easeInOut(duration: 1.5)) {
            scale = 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            path.append("WatchSearchView")
        }
    }
}

class WatchMenuViewModel: ObservableObject {
    func getUserName() -> String {
        guard let userName = try? UserSession().user().name else { return "User" }
        return userName
    }
}
