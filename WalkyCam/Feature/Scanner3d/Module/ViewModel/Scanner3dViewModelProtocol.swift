import SwiftUI

protocol Scanner3dViewModelProtocol: ViewModelProtocol {
    var isVideoPickerPresented: Bool { get set }
    var videoData: Data? { get set }
    var scanState: AsyncData<Data, ErrorProtocol> { get set }
    
    func generateModelFromVideo(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
}
