import SwiftUI

final class GalleryViewModel: GalleryViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: GalleryInteractorProtocol
    @Published var tabSelection: WCTopBarItem = .init(iconName: "", title: "")
    @Published var tabBarItems: [WCTopBarItem] = []
    
    // MARK: - Initialization

    init(interactor: GalleryInteractorProtocol = GalleryInteractor()) {
        self.interactor = interactor
        initializeTabs()
    }

    // MARK: - Private Methods

    private func initializeTabs() {
        let tabs: [WCTopBarItem] = [
            .init(iconName: Asset.Icons.images.name,
                  title: "Fotos",
                  destination: GalleryPhotosRoute(isPresented: .constant(false)).build()),
            .init(iconName: Asset.Icons.videos.name,
                  title: "Videos",
                  destination: nil),
            .init(iconName: Asset.Icons.files.name,
                  title: "Archivos",
                  destination: nil)
        ]
        tabBarItems = tabs
        tabSelection = tabs[0]
    }
}
