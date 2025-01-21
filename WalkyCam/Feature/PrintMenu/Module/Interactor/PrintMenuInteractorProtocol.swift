protocol PrintMenuInteractorProtocol {
    func fetchGalleryItems() async throws -> [GalleryItemModel]
}
