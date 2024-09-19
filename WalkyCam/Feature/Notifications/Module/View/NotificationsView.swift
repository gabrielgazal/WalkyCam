import SwiftUI

struct NotificationsView<ViewModel: NotificationsViewModelProtocol, Router: NotificationsRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    var notificationsGroupedByDate: [Date: [NotificationModel]] {
        Dictionary(grouping: viewModel.notifications) { item in
            let convertedDate = Calendar.current.startOfDay(for: item.date)
            return convertedDate
        }
    }

    var headers: [Date] {
        notificationsGroupedByDate.map { $0.key }.sorted(by: { $0 > $1 })
    }

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack(alignment: .leading) {
            headerView
            ScrollView {
                ForEach(headers, id: \.self) { header in
                    Section {
                        ForEach(notificationsGroupedByDate[header]!, id: \.self) { item in
                            NotificationItemView(title: item.title,
                                                 description: item.description,
                                                 image: item.image,
                                                 date: item.date,
                                                 backgroundColor: item.backgroundColor)
                        }
                    } header: {
                        HStack {
                            Text(formatDateInRelationToToday(header))
                                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                                .listRowInsets(EdgeInsets())
                            Spacer()
                        }
                        .padding(.horizontal, Tokens.Size.Spacing.regular)
                    }
                }
            }
        }
    }

    private var headerView: some View {
        HStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            Text(L10n.NotificationsView.Header.title)
                .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
            Spacer()
            Image(Asset.Icons.filter.name)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: Tokens.Size.Spacing.xlarge, height: Tokens.Size.Spacing.xlarge)
            Image(systemName: "magnifyingglass")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
        }
               .padding(Tokens.Size.Spacing.large)
    }

    private func formatDateInRelationToToday(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: L10n.Formater.locale)
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "d 'de' MMMM 'de' yyyy"

        if Calendar.current.isDateInToday(date) {
            return L10n.NotificationsView.Date.today
        } else {
            return dateFormatter.string(from: date).capitalized
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(
            viewModel: NotificationsViewModel(),
            router: NotificationsRouter(isPresented: .constant(false))
        )
    }
}
