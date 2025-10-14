import SwiftUI

protocol UploadImageToPrintAssemblerProtocol {
    func resolveView(
        route: UploadImageToPrintRoute
    ) -> UploadImageToPrintView<UploadImageToPrintViewModel, UploadImageToPrintRouter>
}