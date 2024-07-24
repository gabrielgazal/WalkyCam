//
//  MenuPlanBannerView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 23/07/24.
//

import SwiftUI

struct MenuPlanBannerModel: Hashable {
    let title: String
    let text: String
    let color: Color
}

struct MenuPlanBannerView: View {
    
    // MARK: - Dependencies
    
    @State var currentPage = 0
    private var pages: [MenuPlanBannerModel]
    
    // MARK: - Initialization
    
    init(
        pages: [MenuPlanBannerModel]
    ) {
        self.pages = pages
    }
    
    // MARK: - View Body
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<pages.count) { index in
                    itemView(pages[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .padding([.bottom], 20)
        }
        .background(
            Rectangle()
                .fill(Color.negro)
        )
        .frame(height: 150)
        .onAppear {
            setupAppearence()
        }
    }
    
    private func itemView(_ data: MenuPlanBannerModel) -> some View {
        HStack(alignment: .top,
               spacing: Tokens.Size.Spacing.small) {
            Image(systemName: "crown.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(data.color)
                .frame(width: 24, height: 24)
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.small) {
                Text("Upgrade Plan \(data.title)")
                    .underline()
                    .font(.projectFont(size: Tokens.Size.Font.large, weight: .black))
                    .foregroundColor(data.color)
                Text(data.text)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                    .foregroundColor(Color.blanco)
            }
            Spacer()
        }
               .padding(Tokens.Size.Spacing.regular)
    }
    
    private func setupAppearence() {
        let currentColor = pages[currentPage].color
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.naranja)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.blancoGris)
    }
}

struct MenuPlanBannerView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPlanBannerView(
            pages: [
                .init(
                    title: "TESTE1",
                    text: "Consigue mas beneficios.",
                    color: .naranja
                ),
                .init(
                    title: "TESTE2",
                    text: "Consigue mas beneficios. Vuela un Drone a distancia!",
                    color: .premium
                ),
                .init(
                    title: "TESTE3",
                    text: "Consigue mas beneficios. Vuela un Drone a distancia!",
                    color: .acentoFondoDark
                )
            ]
        )
    }
}
