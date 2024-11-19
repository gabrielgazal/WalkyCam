import SwiftUI

protocol Video3DScannerViewModelProtocol: ViewModelProtocol {
    var isVideoPickerPresented: Bool { get set }
    var videoData: Data? { get set }
    var scanState: AsyncData<Data, ErrorProtocol> { get set }
    
    func generateModelFromVideo(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
}
