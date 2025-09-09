import SwiftUI

protocol Photo3DScannerViewModelProtocol: ViewModelProtocol {
    var capturedImages: [String: UIImage] { get set }
    var showImagePicker: Bool { get set }
    var scanState: AsyncData<Data, ErrorProtocol> { get set }
    
    func addImage(_ image: UIImage, for position: String)
    func clearAllImages()
    func generateModelFromPhotos(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
    func imageForPosition(_ position: String) -> UIImage?
}
