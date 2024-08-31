import SwiftUI

protocol GalleryPhotosViewModelProtocol: ViewModelProtocol {
    var photosData: [GalleryItemModel] { get set }
}
