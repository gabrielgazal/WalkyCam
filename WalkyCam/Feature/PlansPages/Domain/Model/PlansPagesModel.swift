import SwiftUI

struct PlansPagesModel: Hashable {
    let title: String
    let monthlyPrice: String
    let yearlyPrice: String
    let backgroundImage: String
    let accentColor: Color
    let features: [FunctionData]
}
