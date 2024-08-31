protocol GalleryInteractorProtocol {
    func fetchGalleryItems() async throws -> [GalleryItemModel]
}
