import SwiftUI

final class Scanner3dViewModel: Scanner3dViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: Scanner3dInteractorProtocol
    @Published var isVideoPickerPresented: Bool = false
    @Published var videoData: Data? = nil
    @Published var scanState: AsyncData<Data, ErrorProtocol> = .idle
    
    // MARK: - Initialization

    init(interactor: Scanner3dInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - Public API

    @MainActor func generateModelFromVideo(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        scanState = .loading
        do {
            guard let data = videoData else { return }
            _ = try await interactor.generateModelFromVideo(input: data)
            scanState = .loaded(data)
            onSuccess?()
        } catch {
            scanState = .failed(GenericError())
            onFailure?()
        }
    }
}
