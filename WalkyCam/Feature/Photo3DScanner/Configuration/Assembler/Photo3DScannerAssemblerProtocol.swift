import SwiftUI

protocol Photo3DScannerAssemblerProtocol {
    func resolveView(
        route: Photo3DScannerRoute
    ) -> Photo3DScannerView<Photo3DScannerViewModel, Photo3DScannerRouter>
}