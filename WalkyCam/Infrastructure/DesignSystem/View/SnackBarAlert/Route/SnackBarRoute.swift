import SwiftUI

struct SnackBarRoute: Route {
    var isPresented: Binding<Bool>
    let assembler: SnackBarAssemblerProtocol
    let title: String
    let style: InformationViewStyle
    let onDismiss: SnackbarOnDismiss?

    init(isPresented: Binding<Bool>,
         assembler: SnackBarAssemblerProtocol = SnackBarAssembler(),
         title: String,
         style: InformationViewStyle,
         onDismiss: SnackbarOnDismiss? = nil
    ) {
        self.isPresented = isPresented
        self.assembler = assembler
        self.title = title
        self.style = style
        self.onDismiss = onDismiss
    }

    func build() -> AnyView {
        assembler.resolveView(
            route: self
        )
        .eraseToAnyView()
    }
}
