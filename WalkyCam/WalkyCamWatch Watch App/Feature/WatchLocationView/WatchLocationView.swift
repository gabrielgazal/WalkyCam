//
//  WatchLocationView.swift
//  WalkyCamWatch Watch App
//
//  Created by Gabriel Gazal on 15/09/24.
//

import SwiftUI
import WatchKit

struct WatchLocationView: View {
    
    @State private var navigateToNextView = false
    
    @ObservedObject var viewModel: WatchLocationViewModel
    
    public init(viewModel: WatchLocationViewModel = .init(location: "")) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack {
            Color.negro
                .ignoresSafeArea()
            VStack(alignment: .center) {
                HStack(spacing: Tokens.Size.Spacing.small) {
                    Text("Location")
                        .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                    Text("Current location")
                        .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                        .foregroundColor(Color.naranja)
                }
                Text(viewModel.location)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                Color.naranja.opacity(0.17)
                            )
                    )
                    .frame(width: .infinity)
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.naranja)
                    .frame(width: 27, height: 27)
                    .overlay {
                        Image(systemName: "chevron.right")
                            .renderingMode(.template)
                            .foregroundColor(.blanco)
                    }
                    .onTapGesture {
                        navigateToNextView = true
                    }
                NavigationLink(destination: WatchPageView(), isActive: $navigateToNextView) {
                    EmptyView()
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
        }
    }
}
