import SwiftUI

struct ProfitSelectionView<ViewModel: ProfitSelectionViewModelProtocol, Router: ProfitSelectionRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var selectedIndex: Int = 0

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        ScrollView {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.ProfitSelectionView.title)
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                profitCell(title: L10n.ProfitSelectionView.freelanceTitle,
                           description: L10n.ProfitSelectionView.freelanceDescription,
                           icon: Asset.Icons.workFromHome.name,
                           index: 1)
                profitCell(title: L10n.ProfitSelectionView.employeeTitle,
                           description: L10n.ProfitSelectionView.employeeDescription,
                           icon: Asset.Icons.frame1584.name,
                           index: 2)
                profitCell(title: L10n.ProfitSelectionView.b2bTitle,
                           description: L10n.ProfitSelectionView.b2bDescription,
                           icon: Asset.Icons.reload.name,
                           index: 3)
                WCUIButton(title: L10n.ProfitSelectionView.startButton,
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    var type: CamerContractType?
                    switch selectedIndex {
                    case 1:
                        type = .freelance
                    case 2:
                        type = .employee
                    case 3:
                        type = .b2b
                    default:
                        viewModel.registrationData.earningType = ""
                    }
                    WalkcamerRegistrationManager.shared.updateContractType(type ?? .freelance)
                    router.routeToIdentityUpload(data: viewModel.registrationData)
                })
                .isHidden(selectedIndex == 0)
                WCUIButton(title: L10n.ProfitSelectionView.cancelButton,
                           style: .standard,
                           descriptor: BlackButtonStyleDescriptor(),
                           action: {
                    router.dismiss()
                })
            }
            .padding(Tokens.Size.Spacing.regular)
        }
        .scrollIndicators(.hidden)
        .navigation(router)
        .withInfoIcon()
    }
    
    private func profitCell(title: String, description: String, icon: String, index: Int) -> some View {
        return VStack(alignment: .leading,
                      spacing: Tokens.Size.Spacing.small) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            HStack {
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.small) {
                    Text(title)
                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    Text(description)
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                }
                Spacer()
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .stroke(index == selectedIndex ? Color.naranja : Color.grisOscuro, lineWidth: 3.0)
        }
        .onTapGesture {
            selectedIndex = index
        }
        .frame(width: .infinity)
    }
}

struct ProfitSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfitSelectionView(
            viewModel: ProfitSelectionViewModel(registrationData: .init()),
            router: ProfitSelectionRouter(isPresented: .constant(false))
        )
    }
}
