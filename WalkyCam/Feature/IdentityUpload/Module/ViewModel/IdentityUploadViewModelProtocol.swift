import SwiftUI

protocol IdentityUploadViewModelProtocol: ViewModelProtocol {
    var frontUploaded: Bool { get set }
    var backUploaded: Bool { get set }
}
