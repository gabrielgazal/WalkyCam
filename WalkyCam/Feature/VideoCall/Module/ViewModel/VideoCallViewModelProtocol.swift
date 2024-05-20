import SwiftUI

protocol VideoCallViewModelProtocol: ViewModelProtocol {
    var videoCallLink: String { get set }
    
    func assembleVideoCallLink() -> String
}
