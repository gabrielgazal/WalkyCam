//
//  ImageLoader.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 16/10/23.
//

import Combine
import UIKit

public protocol ImageLoadable {
    func loadImage() -> AnyPublisher<UIImage?, Never>
}

public final class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private let loadable: ImageLoadable

    @Published private(set) var status: Status = .idle

    private var cancellable: AnyCancellable?

    public init(loadable: ImageLoadable) {
        self.loadable = loadable
    }

    deinit {
        cancel()
    }

    public func load() {
        guard status != .loading else { return }

        cancellable = loadable
            .loadImage()
            .receive(on: DispatchQueue.main)
            .handleEvents(
                receiveSubscription: { [weak self] _ in self?.onStart() },
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .failure:
                        self?.onFinish(status: .failured)
                    default:
                        self?.onFinish(status: .loaded)
                    }
                },
                receiveCancel: { [weak self] in self?.onFinish(status: .canceled) })
            .sink(
                receiveCompletion: { [weak self] _ in self?.onFinish(status: .failured) },
                receiveValue: {  [weak self] in self?.image = $0 }
            )
    }

    public func cancel() {
        cancellable?.cancel()
    }

    private func onStart() {
        DispatchQueue.main.async {
            self.status = .loading
        }
    }

    private func onFinish(status: Status) {
        DispatchQueue.main.async {
            self.status = status
        }
    }
}

public extension ImageLoader {
    enum Status {
        case idle, loading, loaded, failured, canceled
    }
}
