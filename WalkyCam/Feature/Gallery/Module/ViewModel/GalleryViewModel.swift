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
                    title: L10n.GalleryViewModel.Tab.photos,
                    destination: GalleryPhotosRoute(
                        isPresented: .constant(false),
                        galleryItems: galleryItems.filter { $0.tag == .image }
                    ).build()
                ),
                .init(
                    iconName: Asset.Icons.videos.name,
                    title: L10n.GalleryViewModel.Tab.videos,
                    destination:  GalleryPhotosRoute(
                        isPresented: .constant(false),
                        galleryItems: galleryItems.filter { $0.tag == .video }
                    ).build()
                ),
                .init(
                    iconName: Asset.Icons.files.name,
                    title: L10n.GalleryViewModel.Tab.files,
                    destination:  GalleryModelsRoute(
                        isPresented: .constant(false),
                        galleryItems: galleryItems
                    ).build()
                ),
                .init(
                    iconName: Asset.Icons._3dTab.name,
                    title: "3D",
                    destination: GalleryModelsRoute(
                        isPresented: .constant(false),
                        galleryItems: galleryItems.filter { $0.tag == .model }
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
