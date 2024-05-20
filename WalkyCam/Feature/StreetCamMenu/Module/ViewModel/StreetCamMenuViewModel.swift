import SwiftUI

final class StreetCamMenuViewModel: StreetCamMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: StreetCamMenuInteractorProtocol

    @Published var createStreetcamAsyncData: AsyncData<VideoCallOutput, ErrorProtocol> = .idle
    @Published var scheduleStreetcamAsyncData: AsyncData<VideoCallOutput, ErrorProtocol> = .idle
    
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
    
    @MainActor func scheduleStreetcam(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        scheduleStreetcamAsyncData = .loading
        do {
            let output = try await interactor.startScheduleStreetcam()
            scheduleStreetcamAsyncData = .loaded(output)
            onSuccess?()
        } catch {
            scheduleStreetcamAsyncData = .failed(GenericError())
            onFailure?()
        }
    }
}
