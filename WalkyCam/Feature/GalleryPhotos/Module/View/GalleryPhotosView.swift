import SwiftUI

struct GalleryPhotosView<ViewModel: GalleryPhotosViewModelProtocol, Router: GalleryPhotosRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    var notificationsGroupedByDate: [Date: [GalleryPhotosModel]] {
        Dictionary(grouping: viewModel.photosData) { item in
            let convertedDate = Calendar.current.startOfDay(for: item.date)
            return convertedDate
        }
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
            ScrollView {
                ForEach(headers, id: \.self) { header in
                    Section {
                        LazyVGrid(columns: otherFunctionsColumns,
                                  spacing: Tokens.Size.Spacing.small) {
                            ForEach(notificationsGroupedByDate[header]!, id: \.self) { item in
                                GalleryItemView(image: item.image)
                            }
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

    private func formatDateInRelationToToday(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
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
            viewModel: GalleryPhotosViewModel(),
            router: GalleryPhotosRouter(isPresented: .constant(false))
        )
    }
}
