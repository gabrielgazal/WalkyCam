import Foundation

protocol Scanner3dInteractorProtocol {
    func generateModelFromVideo(input: Data) async throws
    func generateModelFromPhotos(input: [Data]) async throws
}
