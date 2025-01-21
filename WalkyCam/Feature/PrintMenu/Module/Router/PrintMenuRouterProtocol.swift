import SwiftUI

protocol PrintMenuRouterProtocol: Router {
    func routeToScan3d()
    func routeToGallery(items: [GalleryItemModel])
}

