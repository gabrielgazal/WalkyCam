//
//  URL+ImageLoadable.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 16/10/23.
//

import SwiftUI
import Combine

extension URL: ImageLoadable {
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")

    private static var cache = Environment(\.imageCache).wrappedValue

    public func loadImage() -> AnyPublisher<UIImage?, Never> {

        if let image = URL.cache[self as AnyObject] {
            return Just(image)
                .eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: self)
            .map { UIImage(data: $0.data) }
            .handleEvents(receiveOutput: { cache($0) })
            .subscribe(on: Self.imageProcessingQueue)
            .receive(on: DispatchQueue.main)
            .catch { _ in Just(nil) }
            .eraseToAnyPublisher()
    }

    private func cache(_ image: UIImage?) {
        image.map { URL.cache[self as AnyObject] = $0 }
    }
}
