import SwiftUI

protocol NativeVideoCallAssemblerProtocol {
    func resolveView(
        route: NativeVideoCallRoute
    ) -> NativeVideoCallView<NativeVideoCallViewModel, NativeVideoCallRouter>
}