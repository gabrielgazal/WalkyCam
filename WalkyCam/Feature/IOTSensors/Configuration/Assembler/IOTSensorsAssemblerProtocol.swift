import SwiftUI

protocol IOTSensorsAssemblerProtocol {
    func resolveView(
        route: IOTSensorsRoute
    ) -> IOTSensorsView<IOTSensorsViewModel, IOTSensorsRouter>
}