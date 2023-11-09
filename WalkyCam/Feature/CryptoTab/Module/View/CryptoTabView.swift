import SwiftUI

struct CryptoTabView<ViewModel: CryptoTabViewModelProtocol, Router: CryptoTabRouterProtocol>: View {

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
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center) {
                        ForEach(viewModel.cryptoActivities, id: \.self) { item in
                            cardView(item)
                        }
                    }
                    .padding(10)
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

    private func cardView(_ data: CryptoActivityModel) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            Text(data.title)
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                .foregroundColor(Color.grisOscuro)
            VStack(spacing: 0) {
                Text("$\(String(format: "%.2f", data.currentValue)) USD")
                    .font(.projectFont(size: Tokens.Size.Font.large, weight: .black))
                HStack(spacing: Tokens.Size.Spacing.small) {
                    Text(formatSmallValue(data.variation))
                        .font(.projectFont(size: Tokens.Size.Font.medium, weight: .medium))
                        .foregroundColor(data.variation.sign == .plus ? Color.green2 : Color.rojo)
                    Image(systemName: data.variation.sign == .plus ? "arrow.up" : "arrow.down")
                        .foregroundColor(data.variation.sign == .plus ? Color.green2 : Color.rojo)
                }
            }
            Rectangle()
                .fill(Color.red)
                .frame(width: 90, height: 35)
            HStack {
                Spacer()
                LinkButton(title: "Ver más",
                           color: Color.naranja,
                           action: {})
            }
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blanco)
               )
               .shadow(
                color: .black.opacity(0.11),
                radius: 8,
                x: 0,
                y: 0
               )
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

                }
                HStack(spacing: Tokens.Size.Spacing.small) {
                    Text(data.description)
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                    Text(formatValue(data.value))
                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        .foregroundColor(data.value.sign == .plus ? Color.green2 : Color.negro)
                }
            }
        }
    }

    private func formatSmallValue(_ value: Double) -> String {
        var stringToReturn = ""
        stringToReturn.append(value.sign == .minus ? "-" : "+")
        stringToReturn.append("\(String(format: "%.2f", abs(value)))")
        stringToReturn.append("%")
        return stringToReturn
    }

    private func formatValue(_ value: Double) -> String {
        var stringToReturn = ""
        stringToReturn.append(value.sign == .minus ? "-" : "+")
        stringToReturn.append("$")
        stringToReturn.append("\(String(format: "%.6f", abs(value)))")
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

struct CryptoTabView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoTabView(
            viewModel: CryptoTabViewModel(),
            router: CryptoTabRouter(isPresented: .constant(false))
        )
    }
}
