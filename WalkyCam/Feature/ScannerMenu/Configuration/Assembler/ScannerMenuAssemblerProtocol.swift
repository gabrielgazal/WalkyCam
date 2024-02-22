import SwiftUI

protocol ScannerMenuAssemblerProtocol {
    func resolveView(
        route: ScannerMenuRoute
    ) -> ScannerMenuView<ScannerMenuViewModel, ScannerMenuRouter>
}