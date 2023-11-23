import SwiftUI

struct PlansPagesModel: Hashable {
    let title: String
    let monthlyPrice: Double
    let backgroundImage: String
    let accentColor: Color
    let features: [FunctionData]
}
