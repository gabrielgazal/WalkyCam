import SwiftUI

protocol ConfigureAccessViewModelProtocol: ViewModelProtocol {
    var externalPermissions: [PermissionModel] { get set }
    var internalPermissions: [PermissionModel] { get set }
    var integrationViewHidden: Bool { get set }
}
