//
//  WatchPageView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 23/01/25.
//

import SwiftUI

struct WatchPageView: View {
    let images = [
        Asset.Banners.AppleWatchSimulator.watch1.name,
        Asset.Banners.AppleWatchSimulator.watch2.name,
        Asset.Banners.AppleWatchSimulator.watch3.name,
        Asset.Banners.AppleWatchSimulator.watch4.name,
        Asset.Banners.AppleWatchSimulator.watch5.name,
        Asset.Banners.AppleWatchSimulator.watch6.name
    ]
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            // Fundo preto ocupando toda a tela
            Color.black
                .ignoresSafeArea()

            VStack {
                // Contêiner simulando o corpo do Apple Watch
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.gray.opacity(0.3)) // Simula o corpo do relógio
                        .frame(width: 250, height: 315) // Tamanho proporcional ao Apple Watch

                    // Conteúdo da WatchPageView
                    TabView {
                        ForEach(images, id: \.self) { imageName in
                            GeometryReader { geometry in
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .clipped()
                            }
                            .frame(width: 234, height: 299) // Ajuste para o tamanho do mostrador
                            .cornerRadius(32) // Bordas arredondadas para o "mostrador"
                            .clipped()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
            }
            VStack {
                HStack {
                    Image(systemName: "chevron.left")
                        .onTapGesture {
                            dismiss()
                        }
                    Spacer()
                }
                Spacer()
            }
            
        }
        .navigationBarTitleDisplayMode(.inline) // Mantém o título no modo inline, se usado
        .navigationBarHidden(true) // Oculta a barra de navegação
    }
}
