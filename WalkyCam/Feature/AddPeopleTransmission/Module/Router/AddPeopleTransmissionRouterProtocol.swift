import SwiftUI

protocol AddPeopleTransmissionRouterProtocol: Router {
    func routeToServiceDetails(onCancelAction: (() -> Void)?)
}

