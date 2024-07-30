import SwiftUI

final class VideoCallViewModel: VideoCallViewModelProtocol {
    
    // MARK: - Dependencies
    @Published var videoCallLink: String = ""
    @Published var createVideoCallAsyncData: AsyncData<String, ErrorProtocol> = .idle
    @Published var scheduleVideoCallAsyncData: AsyncData<String, ErrorProtocol> = .idle
    
    private let interactor: VideoCallInteractorProtocol
    
    // MARK: - Initialization
    
    init(interactor: VideoCallInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - Public API
    
    func assembleVideoCallLink() -> String {
        guard let userId = try? UserSession().user().id else {
            fatalError("Unable to locate user id")
        }
        return "https://meet.walkycam.com/videocall/\(videoCallLink)/\(userId)"
    }
    
    @MainActor func createVideoCall(onSuccess: ((String) -> Void)?, onFailure: (() -> Void)?) async {
        createVideoCallAsyncData = .loading
        do {
            let output = try await interactor.createVideoCall()
            createVideoCallAsyncData = .loaded(output)
            onSuccess?(output)
        } catch {
            onFailure?()
        }
    }
    
    @MainActor func startScheduleVideoCall(onSuccess: ((String) -> Void)?, onFailure: (() -> Void)?) async {
        scheduleVideoCallAsyncData = .loading
        do {
            let output = try await interactor.startScheduleVideoCall()
            scheduleVideoCallAsyncData = .loaded(output)
            onSuccess?(output)
        } catch {
            onFailure?()
        }
    }
}
