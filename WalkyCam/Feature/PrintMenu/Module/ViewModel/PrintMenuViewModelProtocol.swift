import SwiftUI

protocol PrintMenuViewModelProtocol: ViewModelProtocol {
    var galleryItems: [GalleryItemModel] { get set }
    
    func fetchGalleryItems(onComplete: (() -> Void)?)
}
