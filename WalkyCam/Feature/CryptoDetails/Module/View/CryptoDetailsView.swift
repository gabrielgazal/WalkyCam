import SwiftUI

struct CryptoDetailsView<ViewModel: CryptoDetailsViewModelProtocol, Router: CryptoDetailsRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            VStack(spacing: Tokens.Size.Spacing.small) {
                Text("Balance")
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
                Text("\(String(format: "%.f", viewModel.cryptoData.balance)) \(getCurrentCryptoTypeName())")
                    .font(.projectFont(size: Tokens.Size.Font.xgiant, weight: .bold))
                Text("≈ \(String(format: "%.1f", viewModel.cryptoData.balance * viewModel.cryptoData.currentValue)) USD")
                    .font(.projectFont(size: Tokens.Size.Font.regular))
            }

            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.small) {
                Text("O convetirlo en")
                    .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
                    .padding(.horizontal, 10)
                HStack(spacing: Tokens.Size.Spacing.regular) {
                    convertionCell(title: "USD", icon: Asset.Icons.usd.name)
                    convertionCell(title: getOtherCryptoTypeName(), icon: Asset.Icons.rc2.name)
                    convertionCell(title: "Funciones", icon: Asset.Icons.funciones.name)
                    convertionCell(title: "Market", icon: Asset.Icons.market.name)
                }
                .padding(.horizontal, 10)
            }
            Text(String(format: "$%.2f USD", viewModel.cryptoData.currentValue))
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
            Text(formatSmallValue(viewModel.cryptoData.variation))
                .font(.projectFont(size: Tokens.Size.Font.medium, weight: .medium))
                .foregroundColor(viewModel.cryptoData.variation.sign == .plus ? Color.green2 : Color.rojo)
            Image(viewModel.cryptoData.graph)
                .resizable()
                .frame(width: 355, height: 145)

            calendarView()
            Spacer()
        }
               .navigationTitle(viewModel.cryptoData.title)
               .navigationBarTitleDisplayMode(.inline)
    }

    private func convertionCell(title: String, icon: String) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.small) {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .bold))
        }
               .padding(.vertical, 12)
               .background(
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color.blanco)
                    .frame(width: 78, height: 85)
               )
               .shadow(
                color: .black.opacity(0.11),
                radius: 8,
                x: 0,
                y: 0
               )
               .frame(width: 78, height: 85)
    }

    private func calendarView() -> some View {
        let date = Date()
        let dateFormatter = DateFormatter()
        let monts = dateFormatter.shortMonthSymbols!
        let monthFromDate = Calendar.current.component(.month, from: date)
        let monthString = Calendar.current.shortMonthSymbols[monthFromDate-1]

        return VStack(alignment: .center,
                      spacing: Tokens.Size.Spacing.large) {
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                ForEach(monts, id: \.self) { month in
                    Text(month.uppercased().replacingOccurrences(of: ".", with: ""))
                        .font(.projectFont(size: Tokens.Size.Font.xsmall))
                        .foregroundColor(month == monthString ? Color.naranja : Color.negro)
                }
            }
            HStack(alignment: .center) {
                Text("YEAR")
                    .font(.projectFont(size: Tokens.Size.Font.small))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.naranja)
                Text("MONTH")
                    .font(.projectFont(size: Tokens.Size.Font.small))
                    .frame(maxWidth: .infinity)
                Text("WEEK")
                    .font(.projectFont(size: Tokens.Size.Font.small))
                    .frame(maxWidth: .infinity)
                Text("DAY")
                    .font(.projectFont(size: Tokens.Size.Font.small))
                    .frame(maxWidth: .infinity)
                Text("HOUR")
                    .font(.projectFont(size: Tokens.Size.Font.small))
                    .frame(maxWidth: .infinity)
            }
        }
    }

    private func getCurrentCryptoTypeName() -> String {
        switch viewModel.cryptoData.type {
        case .rc2:
            return "RC2"
        case .pi:
            return "PI"
        default:
            return ""
        }
    }

    private func getOtherCryptoTypeName() -> String {
        switch viewModel.cryptoData.type {
        case .pi:
            return "RC2"
        case .rc2:
            return "PI"
        default:
            return ""
        }
    }

    private func formatSmallValue(_ value: Double) -> String {
        var stringToReturn = ""
        stringToReturn.append(value.sign == .minus ? "-" : "+")
        stringToReturn.append("\(String(format: "%.2f", abs(value)))")
        stringToReturn.append("%")
        return stringToReturn
    }
}

struct CryptoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CryptoDetailsView(
                viewModel: CryptoDetailsViewModel(cryptoData: .mock()),
                router: CryptoDetailsRouter(isPresented: .constant(false))
            )
        }
    }
}

extension CryptoActivityModel {
    static func mock() -> CryptoActivityModel {
        return .init(title: "PI network",
                     currentValue: 27.45,
                     variation: -0.16,
                     graph: Asset.Miscelaneous.piGraph.name,
                     balance: 168,
                     type: .pi)
    }
}
