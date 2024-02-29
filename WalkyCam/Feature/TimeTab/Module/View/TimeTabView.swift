import SwiftUI

struct TimeTabView<ViewModel:TimeTabViewModelProtocol, Router: TimeTabRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var startTimeSelected = Date.distantPast
    @State var endTimeSelected = Date.now
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
                    VStack(alignment: .leading) {
                        Text("Desde")
                            .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .medium))
                        Text(startTimeSelected, style: .time)
                            .font(.projectFont(size: Tokens.Size.Font.giant, weight: .bold))
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            Divider()
            Group {
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Hasta")
                            .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .medium))
                        Text(endTimeSelected, style: .time)
                            .font(.projectFont(size: Tokens.Size.Font.giant, weight: .bold))
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
