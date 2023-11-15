import SwiftUI

protocol GalleryPhotosViewModelProtocol: ViewModelProtocol {
    var photosData: [GalleryPhotosModel] { get set }
}
