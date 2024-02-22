import SwiftUI

protocol ShareSheetAssemblerProtocol {
    func resolveView(
        route: ShareSheetRoute
    ) -> ShareSheetView<ShareSheetViewModel, ShareSheetRouter>
}