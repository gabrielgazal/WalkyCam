import SwiftUI

final class NativeVideoCallViewModel: NativeVideoCallViewModelProtocol {
    
    // MARK: - Dependencies
    @Published var videoCallId: String
    
    private let interactor: NativeVideoCallInteractorProtocol
    
    // MARK: - Initialization
    
    init(
        videoCallId: String,
        interactor: NativeVideoCallInteractorProtocol = NativeVideoCallInteractor()
    ) {
        self.interactor = interactor
        self.videoCallId = videoCallId
    }
    
    // MARK: - Public API
}
