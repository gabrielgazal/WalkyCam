import SwiftUI

final class SnackBarAssembler: SnackBarAssemblerProtocol {
    func resolveView(route: SnackBarRoute)
    -> SnackBarView<SnackBarRouter> {

        return SnackBarView(
            router: SnackBarRouter(isPresented: route.isPresented),
            title: route.title,
            style: route.style,
            onDismiss: route.onDismiss
        )
    }
}
