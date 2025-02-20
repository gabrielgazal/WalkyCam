//
//  WatchSearchView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 23/01/25.
//

import SwiftUI

struct WatchSearchView: View {
    @State private var isAnimating = false
    @State private var navigateToLocationView = false

    var body: some View {
        NavigationView {
            ZStack {
                // Fundo do Watch
                Asset.Fondos.watchBackground.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 350)
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    // Texto de introdução
                    if !isAnimating {
                        Text("Where shall we go?")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)

                        Text("Tell us the location to reach")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }

                    // Botão de ditado
                    Button(action: handleMicButtonPress) {
                        HStack(spacing: 16) {
                            Spacer()
                            Rectangle()
                                .frame(width: 20, height: 2)
                                .foregroundColor(.naranja)

                            ZStack {
                                Image(systemName: "mic")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.naranja)
                                    .clipShape(Circle())
                                    .frame(width: 70, height: 70)
                            }

                            Rectangle()
                                .frame(width: 20, height: 2)
                                .foregroundColor(.naranja)
                            Spacer()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())

                    // Animação de onda sonora
                    if isAnimating {
                        Asset.Icons.soundwave.swiftUIImage // Substitua pelo ícone de animação correto
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }

                    // Navegação condicional para a próxima tela
                    NavigationLink(
                        destination: WatchLocationView(),
                        isActive: $navigateToLocationView
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
                .padding(30)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }

    // Lógica para acionar animação do botão e navegação
    private func handleMicButtonPress() {
        withAnimation(.easeInOut(duration: 1.2)) {
            isAnimating = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            simulateDictationResult()
        }
    }

    // Simulação de entrada por ditado e navegação
    private func simulateDictationResult() {
        navigateToLocationView = true
    }
}

class WatchSearchViewModel: ObservableObject {
    @Published var dictatedText: String = "123 Elm Street, 12345 USA"
}
