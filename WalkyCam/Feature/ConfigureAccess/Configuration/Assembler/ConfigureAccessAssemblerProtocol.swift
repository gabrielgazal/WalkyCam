import SwiftUI

protocol ConfigureAccessAssemblerProtocol {
    func resolveView(
        route: ConfigureAccessRoute
    ) -> ConfigureAccessView<ConfigureAccessViewModel, ConfigureAccessRouter>
}