import SwiftUI

final class GalleryViewModel: GalleryViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: GalleryInteractorProtocol
    @Published var tabSelection: WCTopBarItem = .init(iconName: "", title: "")
    @Published var asyncTabBarItems: AsyncData<[WCTopBarItem], ErrorProtocol> = .idle
    
    // MARK: - Initialization
    
    init(interactor: GalleryInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - Private Methods
    
    @MainActor func initializeTabs() async {
        asyncTabBarItems = .loading
        do {
            let galleryItems = try await interactor.fetchGalleryItems()
            let tabs: [WCTopBarItem] = [
                .init(
                    iconName: Asset.Icons.images.name,
                    title: "Fotos",
                    destination: GalleryPhotosRoute(
                        isPresented: .constant(false),
                        galleryItems: galleryItems.filter { $0.tag == .image }
                    ).build()
                ),
                .init(
                    iconName: Asset.Icons.videos.name,
                    title: "Videos",
                    destination:  GalleryPhotosRoute(
                        isPresented: .constant(false),
                        galleryItems: galleryItems.filter { $0.tag == .video }
                    ).build()
                ),
                .init(
                    iconName: Asset.Icons.files.name,
                    title: "Archivos",
                    destination:  GalleryPhotosRoute(
                        isPresented: .constant(false),
                        galleryItems: galleryItems
                    ).build()
                )
            ]
            tabSelection = tabs[0]
            asyncTabBarItems = .loaded(tabs)
        } catch {
            asyncTabBarItems = .failed(GenericError())
        }
    }
}
