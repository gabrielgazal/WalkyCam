import SwiftUI

protocol ConfirmMailAssemblerProtocol {
    func resolveView(
        route: ConfirmMailRoute
    ) -> ConfirmMailView<ConfirmMailViewModel, ConfirmMailRouter>
}