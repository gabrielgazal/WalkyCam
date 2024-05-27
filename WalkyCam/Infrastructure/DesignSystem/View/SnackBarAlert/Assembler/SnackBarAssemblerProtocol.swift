import SwiftUI

protocol SnackBarAssemblerProtocol {
    func resolveView(route: SnackBarRoute)
    -> SnackBarView<SnackBarRouter>
}
