import SwiftUI

struct DigitalTwinsMenuView<ViewModel: DigitalTwinsMenuViewModelProtocol, Router: DigitalTwinsMenuRouterProtocol>: View {

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
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            Image(Asset.Icons.digitalTwins.name)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text(L10n.DigitalTwinsMenuView.title)
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 30)
            HStack(spacing: Tokens.Size.Spacing.regular) {
                verticalCard(title: L10n.DigitalTwinsMenuView.search,
                             description: L10n.DigitalTwinsMenuView.searchDescription,
                             buttonTitle: L10n.DigitalTwinsMenuView.searchButton,
                             icon: Asset.Icons.locationWhite.name,
                             action: {
                    router.routeToSearchCammer()
                })
                verticalCard(title: L10n.DigitalTwinsMenuView.reserve,
                             description: L10n.DigitalTwinsMenuView.reserveDescription,
                             buttonTitle: L10n.DigitalTwinsMenuView.reserveButton,
                             icon: Asset.Icons.calendar.name,
                             action: {
                    router.routeToBookCammer()
                })
            }
            horizontalCard(action: {})
        }
        .padding(Tokens.Size.Spacing.regular)
        .background(Asset.Fondos.digitalTwinsfondo.swiftUIImage
            .ignoresSafeArea())
        .navigation(router)
        .sheet(router)
        .environment(\.colorScheme, .dark)
        .onAppear {
            UserDefaults.standard.set(FunctionType.digitalTwins.rawValue, forKey: "currentService")
        }
    }

    private func verticalCard(title: String,
                              description: String,
                              buttonTitle: String,
                              icon: String,
                              action: (() -> Void)?) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
            Text(description)
                .font(.projectFont(size: Tokens.Size.Font.regular))
                .multilineTextAlignment(.center)
            WCUIButton(title: buttonTitle,
                       style: .standard,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {
                action?()
            })
        }
        .padding(Tokens.Size.Spacing.regular)
        .background(
            Color.negro
                .opacity(0.8)
                .cornerRadius(48)
        )
    }

    private func horizontalCard(action: (() -> Void)?) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Image(Asset.Icons.joinMeet.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text("UNIRSE")
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
            }
            Text(L10n.DigitalTwinsMenuView.joinDescription)
                .font(.projectFont(size: Tokens.Size.Font.regular))
            HStack(spacing: Tokens.Size.Spacing.regular) {
                TextInputView(text: .constant(""),
                              placeholder: L10n.DigitalTwinsMenuView.codePlaceholder)
                WCUIButton(title: L10n.DigitalTwinsMenuView.joinButton,
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    action?()
                })
            }
        }
        .padding(Tokens.Size.Spacing.regular)
        .background(
            Color.negro
                .opacity(0.8)
                .cornerRadius(48)
        )
    }
}

struct DigitalTwinsMenuView_Previews: PreviewProvider {
    static var previews: some View {
        DigitalTwinsMenuView(
            viewModel: DigitalTwinsMenuViewModel(),
            router: DigitalTwinsMenuRouter(isPresented: .constant(false))
        )
    }
}
