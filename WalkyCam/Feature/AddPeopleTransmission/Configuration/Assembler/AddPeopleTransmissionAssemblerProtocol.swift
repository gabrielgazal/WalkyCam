import SwiftUI

protocol AddPeopleTransmissionAssemblerProtocol {
    func resolveView(
        route: AddPeopleTransmissionRoute
    ) -> AddPeopleTransmissionView<AddPeopleTransmissionViewModel, AddPeopleTransmissionRouter>
}