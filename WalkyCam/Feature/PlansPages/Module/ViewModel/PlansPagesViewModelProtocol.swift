import SwiftUI
import StripePaymentSheet

protocol PlansPagesViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    var plans: [PlansPagesModel] { get set }
    var paymentSheet: PaymentSheet? { get set }
    var paymentResult: PaymentSheetResult? { get set }
    var isPaymentSheetLoading: Bool { get set }

    func preparePaymentSheet() async
    func onPaymentCompletion(result: PaymentSheetResult)
}
