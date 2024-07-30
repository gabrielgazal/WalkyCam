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
            Text("Hora")
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .medium))
                .padding(.horizontal, Tokens.Size.Spacing.large)
            TimePicker(viewModel: .init(selectedTime: $startTimeSelected),
                       timePickerStyle: .giant)
            .frame(height: 50)
            .onChange(of: startTimeSelected) { _, newValue in
                viewModel.updateSelectedDate(newValue)
            }
            Divider()
            Text("Duración")
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .medium))
                .padding(.horizontal, Tokens.Size.Spacing.large)
            ListInputView(
                dataList: [
                    "40 minutos",
                    "60 minutos",
                    "90 minutos",
                    "120 minutos"
                ],
                selection: $selection,
                rightIcon: Image(systemName: "chevron.down"),
                placeholder: "Selecciona una duración",
                backgroundColor: .blanco)
            .padding(.horizontal, Tokens.Size.Spacing.large)
            .onChange(of: selection) { _, newValue in
                var interval: TimeInterval = .init()
                switch newValue {
                case "40 minutos":
                    interval = 2400
                case "60 minutos":
                    interval = 3600
                case "90 minutos":
                    interval = 5400
                case "120 minutos":
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
