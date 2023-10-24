//
//  NotificationItemView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 24/10/23.
//

import Foundation
import SwiftUI

struct NotificationItemView: View {
    private let title: String?
    private let description: String
    private let image: String
    private let date: Date
    private let backgroundColor: Color

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()

    public init(
        title: String?,
        description: String,
        image: String,
        date: Date,
        backgroundColor: Color
    ) {
        self.title = title
        self.description = description
        self.image = image
        self.date = date
        self.backgroundColor = backgroundColor
    }

    var body: some View {
        VStack(spacing: Tokens.Size.Spacing.small) {
            Divider()
                .padding(.horizontal, Tokens.Size.Spacing.regular)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                if let url = URL(string: image) {
                    AsyncImageView(imageLoadable: url) { status in
                        Group {
                            switch status {
                            case .failured:
                                placeholder
                            case .loading:
                                ProgressView()
                            default:
                                placeholder
                            }
                        }
                    }
                } else {
                    placeholder
                }
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.small) {
                    if let title = title {
                        Text(title)
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    }
                    Text(description.toMarkdown())
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                    Text("\(formatDate()) h.")
                        .font(.projectFont(size: Tokens.Size.Font.small))
                }
                Spacer()
            }
                   .padding(16)
                   .background(
                    Rectangle()
                        .fill(backgroundColor)
                   )
        }
    }

    private var placeholder: some View {
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: 68, height: 68)
            .scaledToFill()
    }

    private func formatDate() -> String {
        return dateFormatter.string(from: date)
    }
}

struct NotificationItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NotificationItemView(title: "Esperanza Stone",
                                 description: "Te ha dejado ***4 estrellas.***",
                                 image: "",
                                 date: .init(),
                                 backgroundColor: Color.blancoGris)
            NotificationItemView(title: "Esperanza Stone",
                                 description: "Te ha dejado ***4 estrellas.***",
                                 image: "",
                                 date: .init(),
                                 backgroundColor: Color.blancoGris)
        }
    }
}
