import SwiftUI

protocol Photo3DScannerViewModelProtocol: ViewModelProtocol {
    var capturedImages: [UIImage] { get set }
    var showImagePicker: Bool { get set }
    var scanState: AsyncData<Data, ErrorProtocol> { get set }
    
    func addImage(_ image: UIImage)
    func clearImages()
    func generateModelFromPhotos(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
}
