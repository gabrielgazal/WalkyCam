//
//  HeaderCounterView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 09/07/24.
//

import Foundation
import SwiftUI

struct HeaderCounterView: View {
    
    var index: Int
    var totalSteps: Int
        
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.black)
            HStack {
                Rectangle()
                    .frame(width: CGFloat(((200/(totalSteps - 1)) * (index - 1))), height: 3)
                    .foregroundColor(.naranja)
                Spacer()
            }
            HStack(alignment: .center) {
                ForEach(0..<totalSteps) { step in
                    ZStack {
                        Circle()
                            .foregroundColor(step < index ? .naranja : .black)
                            .frame(height: 20)
                        if step < index {
                            Text("\(step + 1)")
                                .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                                .foregroundColor(.blanco)
                        }
                    }
                    if step < totalSteps - 1 {
                        Spacer()
                    }
                }
            }
        }
        .frame(width: 190)
    }
}

struct HeaderCounterView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCounterView(index: 4, totalSteps: 4)
    }
}
