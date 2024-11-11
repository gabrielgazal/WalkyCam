import SwiftUI

final class FunctionMenuViewModel: FunctionMenuViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: FunctionMenuInteractorProtocol
    @Published var model: FunctionMenuModel
    @Published var createAsyncData: AsyncData<VideoCallOutput, ErrorProtocol> = .idle
    @Published var scheduleAsyncData: AsyncData<VideoCallOutput, ErrorProtocol> = .idle
    
    // MARK: - Initialization

    init(interactor: FunctionMenuInteractorProtocol,
         model: FunctionMenuModel) {
        self.interactor = interactor
        self.model = model
    }

    // MARK: - Public API

    @MainActor func createAction(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        createAsyncData = .loading
        do {
            let output = try await interactor.startCreation()
            createAsyncData = .loaded(output)
            onSuccess?()
        } catch {
            createAsyncData = .failed(GenericError())
            onFailure?()
        }
    }
    
    @MainActor func scheduleAction(onSuccess: ((String) -> Void)?, onFailure: (() -> Void)?) async {
        scheduleAsyncData = .loading
        do {
            let output = try await interactor.startSchedule()
            scheduleAsyncData = .loaded(output)
            onSuccess?(output.id)
        } catch {
            scheduleAsyncData = .failed(GenericError())
            onFailure?()
        }
    }
}
