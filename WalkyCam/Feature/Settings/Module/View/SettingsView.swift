import SwiftUI

struct SettingsView<ViewModel: SettingsViewModelProtocol, Router: SettingsRouterProtocol>: View {
    
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
        VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                Text("Change Language")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                List {
                    ForEach(Language.allCases, id: \.self) { item in
                        Button {
                            LanguageManager.shared.changeLanguage(language: item)
                            presentSnackbar()
                        } label: {
                            Text("\(item.title) \(item.emoji)")
                        }
                    }
                }
                Spacer()
            }
            .padding(Tokens.Size.Spacing.regular)
            .snackbar(router)
            .navigation(router)
            .id(LanguageManager.shared.language.rawValue)
    }
    
    private func presentSnackbar() {
        router.presentSnackbar(
            SnackBarRoute(
                isPresented: router.isPresentingSnackbar,
                title: "Changed language to \(LanguageManager.shared.language.title)",
                style: InformationViewSuccessStyle(),
                onDismiss: {
                    router.dismiss()
                }
            )
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            viewModel: SettingsViewModel(),
            router: SettingsRouter(isPresented: .constant(false))
        )
    }
}
