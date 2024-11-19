import SwiftUI

final class Video3DScannerViewModel: Video3DScannerViewModelProtocol {

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

    func generateModelFromVideo(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
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
