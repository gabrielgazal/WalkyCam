import SwiftUI

struct ScheduleVideoCallView<ViewModel: ScheduleVideoCallViewModelProtocol, Router: ScheduleVideoCallRouterProtocol>: View {

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
        ZStack {
            VStack(alignment: .leading,
                   spacing: 8) {
                headerView
                WCTopBarContainerView(
                    topBarItems: viewModel.tabBarItems,
                    selection: $viewModel.tabSelection
                )
                .environmentObject(viewModel)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    WCUIButton(title: L10n.ScheduleVideoCallView.next,
                               style: .standard,
                               descriptor: BlackButtonStyleDescriptor(),
                               action: {
                        router.routeToAddPeople()
                    })
                    .frame(width: 170)
                    .padding(Tokens.Size.Spacing.large)
                    .isHidden(!(viewModel.tabSelection == viewModel.tabBarItems.last))
                }
            }
        }
        .padding([.top], Tokens.Size.Spacing.huge)
        .ignoresSafeArea()
        .navigation(router)
    }

    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(1, 3)
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.ScheduleVideoCallView.selectDateAndTime)
                    .font(.projectFont(size: Tokens.Size.Font.larger, weight: .bold))
                Spacer()
            }
        }
               .padding(.horizontal, Tokens.Size.Spacing.large)
    }

    private func headerCounterView(_ index: Int, _ totalSteps: Int) -> some View {
        ZStack {
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.black)
            HStack {
                Rectangle()
                    .frame(width: CGFloat(index - 1) * 100, height: 3)
                    .foregroundColor(.naranja)
                Spacer()
            }
            HStack(alignment: .center) {
                ForEach(0..<totalSteps) { step in
                    ZStack {
                        Circle()
                            .foregroundColor(step < index ? .naranja : .black)
                            .frame(height: 20)
                        if step < index {
                            Text("\(step + 1)")
                                .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                                .foregroundColor(.blanco)
                        }
                    }
                    if step < totalSteps - 1 {
                        Spacer()
                    }
                }
            }
        }
        .frame(width: 190)
    }
}

struct ScheduleVideoCallView_Previews: PreviewProvider {
    static var previews: some View {
    ScheduleVideoCallView(
            viewModel: ScheduleVideoCallViewModel(),
            router: ScheduleVideoCallRouter(isPresented: .constant(false))
        )
    }
}
