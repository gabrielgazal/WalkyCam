//
//  WatchPageView.swift
//  WalkyCamWatch Watch App
//
//  Created by Gabriel Gazal on 15/09/24.
//

import SwiftUI

struct WatchPageView: View {
    let images = ["1", "2", "3", "4", "5", "6"] // Substitua pelos nomes das suas imagens
    
    var body: some View {
        TabView {
            // Itera sobre o array de imagens e exibe cada uma em fullscreen
            ForEach(images, id: \.self) { imageName in
                GeometryReader { geometry in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill) // Ajusta a imagem para preencher a tela
                        .frame(width: geometry.size.width, height: geometry.size.height) // Define o tamanho da imagem
                        .clipped() // Garante que a imagem não saia dos limites
                }
                .edgesIgnoringSafeArea(.all) // Garante que a imagem ocupa toda a área da tela
            }
        }
        .tabViewStyle(PageTabViewStyle()) // Adiciona a navegação entre páginas
    }
}

struct WatchPageView_Previews: PreviewProvider {
    static var previews: some View {
        WatchPageView()
    }
}
