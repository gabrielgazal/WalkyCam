//
//  ServiceActionsView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 01/10/25.
//

import SwiftUI

struct ServiceActionsView: View {
    
    struct Actions {
        let downloadAction: (() -> Void)?
        let printAction: (() -> Void)?
        let shareAction: (() -> Void)?
    }
    
    let actions: Actions
    
    public init(
        actions: Actions
    ) {
        self.actions = actions
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Asset.Icons.download.swiftUIImage
                .configureIcon()
                .onTapGesture {
                    actions.downloadAction?()
                }
            Asset.Icons.printer.swiftUIImage
                .configureIcon()
                .onTapGesture {
                    actions.printAction?()
                }
            Asset.Icons.share1.swiftUIImage
                .configureIcon()
                .onTapGesture {
                    actions.shareAction?()
                }
        }
    }
}

fileprivate extension Image {
    func configureIcon() -> some View {
        return self
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
            .foregroundColor(Color.naranja)
    }
}
