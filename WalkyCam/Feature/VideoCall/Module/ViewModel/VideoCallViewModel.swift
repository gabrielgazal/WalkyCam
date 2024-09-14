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
    
    func assembleVideoCallLink() -> Result<String, Error> {
        do {
            let userId = try UserSession().user().id

            if videoCallLink.starts(with: "https://meet.walkycam.com/") {
                return .success(videoCallLink)
            } else if videoCallLink.starts(with: "meet.walkycam.com/") {
                return .success("httpS://\(videoCallLink)")
            }
            
            let videoCallURL = "https://meet.walkycam.com/videocall/\(videoCallLink)/\(userId)"
            return .success(videoCallURL)
        } catch {
            return .failure(error)
        }
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
