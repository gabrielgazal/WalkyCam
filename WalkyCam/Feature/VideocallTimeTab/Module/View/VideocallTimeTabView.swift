import SwiftUI

struct VideocallTimeTabView<ViewModel: VideocallTimeTabViewModelProtocol, Router: VideocallTimeTabRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var startTimeSelected = Date.now
    @State var startPickerShowing = false
    @State var selection: String = ""

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.large) {
            Text(L10n.VideocallTimeTabView.time)
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .medium))
                .padding(.horizontal, Tokens.Size.Spacing.large)
            TimePicker(viewModel: .init(selectedTime: $startTimeSelected),
                       timePickerStyle: .giant)
            .frame(height: 50)
            .onChange(of: startTimeSelected) { _, newValue in
                viewModel.updateSelectedDate(newValue)
            }
            Divider()
            Text(L10n.VideocallTimeTabView.duration)
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .medium))
                .padding(.horizontal, Tokens.Size.Spacing.large)
            ListInputView(
                dataList: [
                    L10n.VideocallTimeTabView.Duration._40Minutes,
                    L10n.VideocallTimeTabView.Duration._60Minutes,
                    L10n.VideocallTimeTabView.Duration._90Minutes,
                    L10n.VideocallTimeTabView.Duration._120Minutes
                ],
                selection: $selection,
                rightIcon: Image(systemName: "chevron.down"),
                placeholder: L10n.VideocallTimeTabView.durationSelection,
                backgroundColor: .blanco)
            .padding(.horizontal, Tokens.Size.Spacing.large)
            .onChange(of: selection) { _, newValue in
                var interval: TimeInterval = .init()
                switch newValue {
                case L10n.VideocallTimeTabView.Duration._40Minutes:
                    interval = 2400
                case L10n.VideocallTimeTabView.Duration._60Minutes:
                    interval = 3600
                case L10n.VideocallTimeTabView.Duration._90Minutes:
                    interval = 5400
                case L10n.VideocallTimeTabView.Duration._120Minutes:
                    interval = 7200
                default: break
                }
                let newDate = Date(timeInterval: interval, since: startTimeSelected)
                viewModel.updateEndTime(newDate)
            }
            Asset.Ads.premium4.swiftUIImage
        }
               .padding(Tokens.Size.Spacing.regular)
    }
}

struct VideocallTimeTabView_Previews: PreviewProvider {
    static var previews: some View {
        VideocallTimeTabView(
            viewModel: VideocallTimeTabViewModel(),
            router: VideocallTimeTabRouter(isPresented: .constant(false))
        )
    }
}
