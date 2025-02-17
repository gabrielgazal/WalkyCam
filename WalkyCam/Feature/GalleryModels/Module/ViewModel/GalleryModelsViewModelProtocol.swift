import SwiftUI

protocol GalleryModelsViewModelProtocol: ViewModelProtocol {
    var galleryItems: [GalleryItemModel] { get set }
}
