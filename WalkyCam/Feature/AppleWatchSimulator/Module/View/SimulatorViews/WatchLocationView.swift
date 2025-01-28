//
//  WatchLocationView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 23/01/25.
//

import SwiftUI

struct WatchLocationView: View {
    @State private var navigateToNextView = false

    @ObservedObject var viewModel: WatchLocationViewModel

    public init(viewModel: WatchLocationViewModel = .init(location: "123 Elm Street, 12345 USA")) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack {
                // Fundo da tela
                Color.negro
                    .ignoresSafeArea()

                VStack(alignment: .center, spacing: 16) {
                    // Cabeçalho de localização
                    HStack(spacing: Tokens.Size.Spacing.small) {
                        Text("Location")
                            .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                            .foregroundColor(.white)
                        Text("Current location")
                            .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                            .foregroundColor(Color.naranja)
                    }

                    // Texto com a localização atual
                    Text(viewModel.location)
                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.naranja.opacity(0.17))
                        )
                        .frame(maxWidth: .infinity)

                    // Botão para próxima tela
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.naranja)
                        .frame(width: 27, height: 27)
                        .overlay {
                            Image(systemName: "chevron.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.blanco)
                        }
                        .onTapGesture {
                            navigateToNextView = true
                        }

                    // Navegação condicional
                    NavigationLink(
                        destination: WatchPageView(),
                        isActive: $navigateToNextView
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
                .padding()
            }
            .frame(width: 300, height: 350)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

// ViewModel para gerenciar o estado da localização
class WatchLocationViewModel: ObservableObject {
    @Published var location: String

    public init(location: String) {
        self.location = location
    }
}
