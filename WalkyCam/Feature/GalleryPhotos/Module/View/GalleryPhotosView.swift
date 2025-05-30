import SwiftUI

struct GalleryPhotosView<ViewModel: GalleryPhotosViewModelProtocol, Router: GalleryPhotosRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    var notificationsGroupedByDate: [Date: [GalleryItemModel]] {
        Dictionary<Date, [GalleryItemModel]>(grouping: viewModel.photosData, by: { item in
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
            if viewModel.photosData.isEmpty {
                Spacer()
                Text(L10n.GalleryItems.Image.Empty.title)
                Spacer()
            } else {
                ScrollView {
                    ForEach(headers, id: \.self) { header in
                        Section {
                            LazyVGrid(columns: otherFunctionsColumns,
                                      spacing: Tokens.Size.Spacing.regular) {
                                ForEach(notificationsGroupedByDate[header]!, id: \.self) { item in
                                    GalleryItemView(image: item.viewPath)
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

struct GalleryPhotosView_Previews: PreviewProvider {
    static var previews: some View {
    GalleryPhotosView(
        viewModel: GalleryPhotosViewModel(photosData: []),
            router: GalleryPhotosRouter(isPresented: .constant(false))
        )
    }
}
