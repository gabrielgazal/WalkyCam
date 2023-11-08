import SwiftUI

struct CashTabView<ViewModel: CashTabViewModelProtocol, Router: CashTabRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()

    private let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }()

    private let monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter
    }()

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                VStack {
                    Text("Balance")
                        .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
                    Text("200 $")
                        .font(.projectFont(size: Tokens.Size.Font.xgiant, weight: .bold))
                    Text("USD")
                        .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
                }
                LinkButton(title: "Ingresar dinero",
                           color: .naranja,
                           action: {})
                WCUIButton(title: "Retirar dinero",
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {})
                .frame(maxWidth: 165)
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.small) {
                    Text("O convetirlo en")
                        .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
                        .padding(.horizontal, 10)
                    HStack(spacing: Tokens.Size.Spacing.regular) {
                        convertionCell(title: "PI", icon: Asset.Icons.pi.name)
                        convertionCell(title: "RC2", icon: Asset.Icons.rc2.name)
                        convertionCell(title: "Funciones", icon: Asset.Icons.funciones.name)
                        convertionCell(title: "Market", icon: Asset.Icons.market.name)
                    }
                    .padding(.horizontal, 10)
                }
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.small) {
                    HStack {
                        Text("Actividad")
                            .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                    assembleActivitiesView()
                }
                       .padding(16)
            }
        }
        .padding(Tokens.Size.Spacing.regular)
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

    private func assembleActivitiesView() -> some View {
        ForEach(viewModel.activities, id: \.self) { activity in
            activityCard(activity)
            Divider()
        }
    }

    private func activityCard(_ data: WalletActivityModel) -> some View {
        HStack(spacing: Tokens.Size.Spacing.regular) {
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.tiny) {
                Text(formatDay(data.date))
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Text(formatMonth(data.date))
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                   }
                   .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blanco)
                        .frame(width: 78, height: 78)
                   )
                   .frame(width: 78, height: 78)
                   .shadow(
                       color: .black.opacity(0.11),
                       radius: 8,
                       x: 0,
                       y: 0
                   )
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.small) {
                HStack {
                    Text(data.title)
                        .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
                    Spacer()
                    Text(formatValue(data.value, data.isValuePositive))
                        .font(.projectFont(size: Tokens.Size.Font.large, weight: .bold))
                        .foregroundColor(data.isValuePositive ? Color.green : Color.negro)
                }
                HStack(spacing: Tokens.Size.Spacing.small) {
                    Text(formatTime(data.date))
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                    Text(data.description)
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                }
            }
        }
    }

    private func formatValue(_ value: Double, _ isPositive: Bool) -> String {
        var stringToReturn = ""
        stringToReturn.append(isPositive ? "+" : "-")
        stringToReturn.append("$")
        stringToReturn.append("\(String(format: "%.2f", value))")
        return stringToReturn
    }

    private func formatTime(_ date: Date) -> String {
        return timeFormatter.string(from: date)
    }

    private func formatDay(_ date: Date) -> String {
        return dayFormatter.string(from: date)
    }

    private func formatMonth(_ date: Date) -> String {
        return monthFormatter.string(from: date)
    }
}

struct CashTabView_Previews: PreviewProvider {
    static var previews: some View {
    CashTabView(
            viewModel: CashTabViewModel(),
            router: CashTabRouter(isPresented: .constant(false))
        )
    }
}
