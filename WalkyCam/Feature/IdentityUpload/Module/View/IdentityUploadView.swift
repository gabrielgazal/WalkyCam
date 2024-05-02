import SwiftUI

struct IdentityUploadView<ViewModel: IdentityUploadViewModelProtocol, Router: IdentityUploadRouterProtocol>: View {

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
        ScrollView {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                headerView
                Text("Asegúrate que el ID esté vigente y que todos los campos sean legibles y nítidos.")
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                uploadItem(title: "Frente", uploaded: viewModel.frontUploaded)
                    .onTapGesture {
                        viewModel.frontUploaded = true
                    }
                uploadItem(title: "Dorso", uploaded: viewModel.backUploaded)
                    .onTapGesture {
                        viewModel.backUploaded = true
                    }
                Spacer()
                VStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    WCUIButton(title: "Subir fotos",
                               style: .standard,
                               descriptor: OrangeButtonStyleDescriptor(),
                               action: {})
                    LinkButton(title: "Cancelar Registro",
                               color: .naranja,
                               action: {})
                }
                .isHidden(viewModel.frontUploaded && viewModel.backUploaded)
                
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    WCUIButton(title: "Cancelar",
                               style: .outline,
                               descriptor: OrangeButtonStyleDescriptor(),
                               action: {})
                    WCUIButton(title: "Siguiente",
                               style: .standard,
                               descriptor: BlackButtonStyleDescriptor(),
                               action: {})
                }
                .isHidden(!viewModel.frontUploaded && !viewModel.backUploaded)
            }
                   .padding(.horizontal, Tokens.Size.Spacing.large)
        }
    }
    
    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(1, 4)
            }
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text("Carga tu documento de identidad")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
        }
    }
    
    private func headerCounterView(_ index: Int, _ totalSteps: Int) -> some View {
        ZStack {
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.black)
            HStack {
                Rectangle()
                    .frame(width: CGFloat(index - 1) * 63.3, height: 3)
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
    
    private func uploadItem(title: String, uploaded: Bool) -> some View {
        return VStack(alignment: .leading,
                      spacing: Tokens.Size.Spacing.tiny) {
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                .foregroundColor(uploaded ? .green : .negro)
            HStack {
                Spacer()
                ZStack(alignment: .center) {
                    Asset.Icons.identity.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    if uploaded {
                        VStack {
                            HStack {
                                Spacer()
                                Asset.Icons.checkmark.swiftUIImage
                            }
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct IdentityUploadView_Previews: PreviewProvider {
    static var previews: some View {
    IdentityUploadView(
            viewModel: IdentityUploadViewModel(),
            router: IdentityUploadRouter(isPresented: .constant(false))
        )
    }
}
