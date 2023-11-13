import SwiftUI

protocol CryptoTabRouterProtocol: Router {
    func routeToCryptoDetails(_ data: CryptoActivityModel)
}
