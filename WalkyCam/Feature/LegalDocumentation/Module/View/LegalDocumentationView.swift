import SwiftUI

struct LegalDocumentationView<ViewModel: LegalDocumentationViewModelProtocol, Router: LegalDocumentationRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var uploadedDeclaration = false
    @State var uploadedContract = false
    // MARK: - Initialization
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            Text(L10n.LegalDocumentationView.title)
                .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
            Text(L10n.LegalDocumentationView.subtitle)
                .font(.projectFont(size: Tokens.Size.Font.small))
            Spacer()
            uploadItem(title: L10n.LegalDocumentationView.declaration, uploaded: uploadedDeclaration)
                .onTapGesture {
                    uploadedDeclaration.toggle()
                }
            uploadItem(title: L10n.LegalDocumentationView.contract, uploaded: uploadedContract)
                .onTapGesture {
                    uploadedContract.toggle()
                }
            Spacer()
            WCUIButton(
                title: L10n.LegalDocumentationView.start,
                style: .standard,
                descriptor: OrangeButtonStyleDescriptor(),
                action: {
                    Task {
                        await viewModel.updateInfo()
                    }
                }
            )
            .disabled(!uploadedContract || !uploadedDeclaration)
            WCUIButton(
                title: L10n.LegalDocumentationView.cancel,
                style: .standard,
                descriptor: BlackButtonStyleDescriptor(),
                action: {
                    router.dismiss()
                })
        }
               .padding()
               .fullScreen(isPresented: $viewModel.showCompletionScreen) {
                   completionScreen
                       .eraseToAnyView()
               }
    }
    
    private func uploadItem(title: String, uploaded: Bool) -> some View {
        return HStack(alignment: .center,
                      spacing: Tokens.Size.Spacing.small) {
            Spacer()
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                .foregroundColor(.negro)
            Asset.Icons.checkmark.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .isHidden(!uploaded)
            Spacer()
        }
                      .padding(Tokens.Size.Spacing.large)
                      .background {
                          Capsule()
                              .fill(Color.blanco)
                              .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
                      }
    }
    
    private var completionScreen: any View {
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.big) {
                Spacer()
                    .frame(height: 15)
                Asset.logo.swiftUIImage
                    .renderingMode(.template)
                    .foregroundColor(Color.naranja)
                    .frame(height: Tokens.Size.Spacing.huge)
                Text("Felicidades")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .black))
                    .foregroundColor(Color.blanco)
                Text("Ya eres WalkCamer")
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
                    .foregroundColor(Color.blanco)
                Spacer()
                WCUIButton(
                    title: "Ir a WalkyCam",
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor()
                ) {
                    router.routeToCammerConfirmation()
                }
            }
        
        .padding(.horizontal, Tokens.Size.Spacing.regular)
        .background(Asset.Fondos.loginFondo.swiftUIImage
            .ignoresSafeArea())
        .navigation(router)
    }
}
