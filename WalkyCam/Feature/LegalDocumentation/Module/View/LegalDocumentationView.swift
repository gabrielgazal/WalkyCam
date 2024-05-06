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
            Text("Documentación legal")
                .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
            Text("Firma y acepta los contratos para poder comenzar a ser WalkCamer")
                .font(.projectFont(size: Tokens.Size.Font.small))
            Spacer()
            uploadItem(title: "Declaración jurada", uploaded: uploadedDeclaration)
                .onTapGesture {
                    uploadedDeclaration.toggle()
                }
            uploadItem(title: "Contrato", uploaded: uploadedContract)
                .onTapGesture {
                    uploadedContract.toggle()
                }
            Spacer()
            WCUIButton(
                title: "Comenzar",
                style: .standard,
                descriptor: OrangeButtonStyleDescriptor(),
                action: {}
            )
            .disabled(!uploadedContract || !uploadedDeclaration)
            WCUIButton(title: "Cancelar Registro",
                       style: .standard,
                       descriptor: BlackButtonStyleDescriptor(),
                       action: {})
        }
               .padding()
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
}

struct LegalDocumentationView_Previews: PreviewProvider {
    static var previews: some View {
        LegalDocumentationView(
            viewModel: LegalDocumentationViewModel(),
            router: LegalDocumentationRouter(isPresented: .constant(false))
        )
    }
}
