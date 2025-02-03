import SwiftUI

final class StreetCamMenuViewModel: StreetCamMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: StreetCamMenuInteractorProtocol

    @Published var createStreetcamAsyncData: AsyncData<VideoCallOutput, ErrorProtocol> = .idle
    @Published var scheduleStreetcamAsyncData: AsyncData<VideoCallOutput, ErrorProtocol> = .idle
    @Published var videoCallLink: String = ""
    
    // MARK: - Initialization

    init(interactor: StreetCamMenuInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - Public API

    @MainActor func createStreetcam(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        createStreetcamAsyncData = .loading
        do {
            let output = try await interactor.startCreationStreetcam()
            createStreetcamAsyncData = .loaded(output)
            onSuccess?()
        } catch {
            createStreetcamAsyncData = .failed(GenericError())
            onFailure?()
        }
    }
    
    @MainActor func scheduleStreetcam(onSuccess: ((String) -> Void)?, onFailure: (() -> Void)?) async {
        scheduleStreetcamAsyncData = .loading
        do {
            let output = try await interactor.startScheduleStreetcam()
            scheduleStreetcamAsyncData = .loaded(output)
            onSuccess?(output.id)
        } catch {
            scheduleStreetcamAsyncData = .failed(GenericError())
            onFailure?()
        }
    }
    
    func assembleVideoCallLink() -> Result<String, Error> {
        do {
            let userId = try UserSession().user().id

            if videoCallLink.starts(with: "https://meet.walkycam.com/") {
                return .success(videoCallLink)
            } else if videoCallLink.starts(with: "meet.walkycam.com/") {
                return .success("https://\(videoCallLink)")
            }
            
            let videoCallURL = "https://meet.walkycam.com/videocall/\(videoCallLink)/\(userId)"
            return .success(videoCallURL)
        } catch {
            return .failure(error)
        }
    }
}
