//
//  AsyncImageView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 16/10/23.
//

import SwiftUI

public struct AsyncImageView<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private var placeholderStatus: ((ImageLoader.Status) -> Placeholder)?
    private let image: (UIImage) -> Image

    @available(*, deprecated, message: "Use initializer with placeholderStatus instead.")
    public init(
        imageLoadable: ImageLoadable,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(loadable: imageLoadable))
    }

    public init(
        imageLoadable: ImageLoadable,
        placeholderStatus: @escaping (ImageLoader.Status) -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        self.placeholder = placeholderStatus(.idle)
        self.placeholderStatus = placeholderStatus
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(loadable: imageLoadable))
    }

    public var body: some View {
        content
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }

    private var content: some View {
        Group {
            if let imageContent = loader.image {
                image(imageContent)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            } else {
                if placeholderStatus != nil {
                    placeholderStatus?(loader.status)
                } else {
                    placeholder
                }
            }
        }
    }
}
