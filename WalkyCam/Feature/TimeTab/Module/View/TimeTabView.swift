import SwiftUI

struct TimeTabView<ViewModel:TimeTabViewModelProtocol, Router: TimeTabRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var startTimeSelected = Date.now
    @State var endTimeSelected = Date.init(timeIntervalSinceNow: 2400)
    @State var startPickerShowing = false
    @State var endPickerShowing = false

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
            Group {
                HStack {
                    Spacer()
                    VStack(alignment: .center) {
                        Text("Desde")
                            .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .medium))
                        TimePicker(viewModel: .init(selectedTime: $startTimeSelected),
                                   timePickerStyle: .expanded)
                        .onChange(of: startTimeSelected) { _, newValue in
                            viewModel.updateSelectedDate(newValue)
                            endTimeSelected = Date.init(timeInterval: 2400, since: newValue)
                        }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            Divider()
            Group {
                HStack {
                    Spacer()
                    VStack(alignment: .center) {
                        Text("Hasta")
                            .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .medium))
                        TimePicker(viewModel: .init(selectedTime: $endTimeSelected),
                                   timePickerStyle: .expanded)
                        .onChange(of: endTimeSelected) { _, newValue in
                            viewModel.updateEndTime(newValue)
                        }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            Spacer()
        }
               .padding(Tokens.Size.Spacing.large)
    }
}

struct TimeTabView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTabView(
            viewModel: TimeTabViewModel(),
            router: TimeTabRouter(isPresented: .constant(false))
        )
    }
}
