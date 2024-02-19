import SwiftUI

struct CalendarTabView<ViewModel:CalendarTabViewModelProtocol, Router: CalendarTabRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State private var selectedDate: Date?

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.large) {
            CalendarView(dateInterval: DateInterval()) { date in
                Button(action: {
                    selectedDate = date
                }) {
                    Text("00")
                        .padding(8)
                        .foregroundColor(.clear)
                        .background(date == selectedDate ? Color.naranja : Color.clear)
                        .clipShape(Circle())
                        .clipped()
                        .accessibilityHidden(true)
                        .overlay(
                            Text(DateFormatter.day.string(from: date))
                                .foregroundColor(date == selectedDate ? Color.blanco : Color.negro)
                                .font(.projectFont(size: Tokens.Size.Font.regular))
                        )
                }
            } header: {
                Text(DateFormatter.weekDay.string(from: $0).uppercased())
                    .font(.projectFont(size: Tokens.Size.Spacing.regular, weight: .bold))
            } title: { date in
                HStack {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.naranja)
                        .frame(width: 24, height: 24)
                    Spacer()
                    Text(DateFormatter.monthAndYear.string(from: date).capitalized)
                        .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .medium))
                    Spacer()
                    Image(systemName: "arrow.right")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.naranja)
                        .frame(width: 24, height: 24)
                }
            } trailing: {
                Text(DateFormatter.day.string(from: $0))
                    .foregroundColor(.secondary)
            }

        }
               .padding(Tokens.Size.Spacing.large)
    }
}

struct CalendarTabView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarTabView(
            viewModel: CalendarTabViewModel(),
            router: CalendarTabRouter(isPresented: .constant(false))
        )
    }
}
