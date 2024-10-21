import SwiftUI

struct MenuView<ViewModel: MenuViewModelProtocol, Router: MenuRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var languageSelected = false
    @AppStorage("language")
    private var language = LanguageManager.shared.language

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(Array(zip(viewModel.menuItems.indices, viewModel.menuItems)), id: \.0) { index, item in
                    HStack(alignment: .center,
                           spacing: Tokens.Size.Spacing.regular) {
                        Image(item.icon)
                        Text(item.title)
                            .font(.projectFont(size: Tokens.Size.Font.regular,
                                               weight: .bold))
                            .foregroundColor(.negro)
                        Spacer()
                    }
                    .background(Color.blanco)
                    .onTapGesture {
                        if let route = item.routeToNavigate {
                            router.navigateTo(route)
                        }
                    }
                    .padding(.vertical, Tokens.Size.Spacing.xlarge)
                    Divider()
                        .isHidden(index == viewModel.menuItems.count - 1)
                }
                .padding([.leading, .trailing], Tokens.Size.Spacing.large)
                Menu {
                    Button {
                        LanguageManager.shared.language = .spanish
                    } label: {
                        Text("Español 🇪🇸")
                    }
                    Button {
                        LanguageManager.shared.language = .english_us
                    } label: {
                        Text("English 🇺🇸")
                    }
                } label: {
                    HStack(spacing: Tokens.Size.Spacing.regular) {
                        Text("Selected language: \(LanguageManager.shared.language.emoji)")
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                            .foregroundColor(Color.negro)
                        Image(systemName: "chevron.down")
                            .fontWeight(.bold)
                            .foregroundColor(Color.negro)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.blancoGris)
                    )
                }
                .padding([.leading, .trailing], Tokens.Size.Spacing.large)
                Spacer()
                MenuPlanBannerView(pages: viewModel.assembleMenuBannnerData())
            }
        }
        .scrollIndicators(.hidden)
        .padding([.bottom], Tokens.Size.Spacing.large)
        .padding([.top], Tokens.Size.Spacing.xlarge)
        .navigation(router)
        .id(LanguageManager.shared.language.rawValue)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
    MenuView(
            viewModel: MenuViewModel(router: MenuRouter(isPresented: .constant(false))),
            router: MenuRouter(isPresented: .constant(false))
        )
    }
}
