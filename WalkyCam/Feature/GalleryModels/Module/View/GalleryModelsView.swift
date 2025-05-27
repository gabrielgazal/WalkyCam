import SwiftUI

struct GalleryModelsView<ViewModel: GalleryModelsViewModelProtocol, Router: GalleryModelsRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    var notificationsGroupedByDate: [Date: [GalleryItemModel]] {
        Dictionary<Date, [GalleryItemModel]>(grouping: viewModel.galleryItems, by: { item in
            Calendar.current.startOfDay(for: item.creationDate)
        })
    }

    var headers: [Date] {
        notificationsGroupedByDate.map { $0.key }.sorted(by: { $0 > $1 })
    }

    private let otherFunctionsColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.galleryItems.isEmpty {
                Spacer()
                Text(L10n.GalleryItems.Model.Empty.title)
                Spacer()
            } else {
                ScrollView {
                    ForEach(headers, id: \.self) { header in
                        Section {
                            LazyVGrid(columns: otherFunctionsColumns,
                                      spacing: Tokens.Size.Spacing.regular) {
                                ForEach(notificationsGroupedByDate[header]!, id: \.self) { item in
                                    GalleryModelVisualizer(path: item.viewPath)
                                        .onTapGesture {
                                            router.routeToEditModel(modelId: item.id)
                                        }
                                }
                            }
                                      .padding(.horizontal, Tokens.Size.Spacing.regular)
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
        .navigation(router)
    }

    private func formatDateInRelationToToday(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: L10n.Formater.locale)
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "d 'de' MMMM 'de' yyyy"

        if Calendar.current.isDateInToday(date) {
            return "Hoy"
        } else {
            return dateFormatter.string(from: date).capitalized
        }
    }
}
