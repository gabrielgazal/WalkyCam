import SwiftUI

protocol Video3DScannerAssemblerProtocol {
    func resolveView(
        route: Video3DScannerRoute
    ) -> Video3DScannerView<Video3DScannerViewModel, Video3DScannerRouter>
}