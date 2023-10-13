//
//  PageControl.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 13/10/23.
//

import SwiftUI

struct PageControl: View {
    let numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack {
            ForEach(0..<numberOfPages, id: \.self) { page in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(page == currentPage ? .naranja : .blancoGris)
            }
        }
    }
}
