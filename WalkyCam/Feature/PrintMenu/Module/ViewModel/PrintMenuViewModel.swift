import SwiftUI

final class PrintMenuViewModel: PrintMenuViewModelProtocol {

    // MARK: - Dependencies
    @Published var galleryItems: [GalleryItemModel] = []

    private let interactor: PrintMenuInteractorProtocol

    // MARK: - Initialization

    init(interactor: PrintMenuInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - Public API

    func fetchGalleryItems(onComplete: (() -> Void)?) {
        Task { 
            do {
                let items = try await interactor.fetchGalleryItems()
                galleryItems = items.filter { $0.tag == .model }
                onComplete?()
            } catch {
                galleryItems = []
                onComplete?()
            }
        }
    }
}
