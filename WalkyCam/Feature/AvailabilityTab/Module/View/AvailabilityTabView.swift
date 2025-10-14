import SwiftUI

struct AvailabilityTabView<ViewModel: AvailabilityTabViewModelProtocol, Router: AvailabilityTabRouterProtocol>: View {

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
        ScrollView {
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                ForEach($viewModel.availableOptions, id: \.self) { $item in
                    AvailableDayItemView(data: $item)
                }
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
        .scrollIndicators(.hidden)
        .onChange(of: viewModel.availableOptions) { newValue in
            if let allDaysActive = viewModel.availableOptions.first(where: { $0.title == L10n.AvailabilityTabView.allDays } )?.active,
            allDaysActive {
                for index in 0..<viewModel.availableOptions.count {
                    viewModel.availableOptions[index].active = true
                }
            }
            viewModel.saveData()
        }
    }
}

struct AvailabilityTabView_Previews: PreviewProvider {
    static var previews: some View {
    AvailabilityTabView(
            viewModel: AvailabilityTabViewModel(),
            router: AvailabilityTabRouter(isPresented: .constant(false))
        )
    }
}
