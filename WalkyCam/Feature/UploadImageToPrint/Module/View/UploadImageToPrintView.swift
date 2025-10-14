import SwiftUI

struct UploadImageToPrintView<ViewModel: UploadImageToPrintViewModelProtocol, Router: UploadImageToPrintRouterProtocol>: View {

    // MARK: - Dependencies
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    // MARK: - State
    @State private var selectedOBJFile: UploadedFile?

    // MARK: - Initialization
    init(viewModel: ViewModel, router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Spacer()
                HeaderCounterView(index: 1, totalSteps: 3)
            }
            .padding(.horizontal)
            .padding(.top, Tokens.Size.Spacing.large)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: Tokens.Size.Spacing.large) {
                    // Título principal
                    Text("Subir imagen 3D")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .padding(.top, Tokens.Size.Spacing.regular)
                    
                    // Seção requerida
                    Text("Requerido")
                        .font(.projectFont(size: Tokens.Size.Font.medium, weight: .semibold))
                    
                    if let file = selectedOBJFile {
                        RequiredFileCard(
                            fileName: file.name,
                            fileSize: file.size,
                            onDelete: { selectedOBJFile = nil }
                        )
                    } else {
                        UploadBoxView(
                            title: "Archivo .OBJ",
                            subtitle: "Max 64 MB or 1 million polygons",
                            color: .naranja,
                            icon: Asset.Icons.uploadFolder.swiftUIImage,
                            onTap: selectOBJFile
                        )
                    }
                    
                    // Seção opcional
                    Text("Opcional: Color y Textura")
                        .font(.projectFont(size: Tokens.Size.Font.medium, weight: .semibold))
                        .padding(.top, Tokens.Size.Spacing.large)
                    
                    VStack(spacing: Tokens.Size.Spacing.regular) {
                        UploadBoxView(
                            title: "Archivo .MTL",
                            subtitle: "Max 64 MB or 1 million polygons",
                            color: .acentoFondoDark,
                            icon: Asset.Icons.uploadFolderBlue.swiftUIImage,
                            onTap: { /* abrir seletor .mtl */ }
                        )
                        
                        UploadBoxView(
                            title: "Textures files: GIF, JPG, PNG",
                            subtitle: "Max 64 MB or 1 million polygons",
                            color: .acentoFondoDark,
                            icon: Asset.Icons.uploadFolderBlue.swiftUIImage,
                            onTap: { /* abrir seletor de texturas */ }
                        )
                    }
                }
                .padding(.horizontal, Tokens.Size.Spacing.large)
                .padding(.bottom, 100)
            }
            
            // Botão inferior fixo
            VStack {
                Button(action: {
                    //                        router.navigateToNextStep()
                }) {
                    Text("Siguiente")
                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        .foregroundColor(.blanco)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(40)
                }
                .padding(.horizontal, Tokens.Size.Spacing.large)
                .padding(.bottom, Tokens.Size.Spacing.large)
            }
            .background(Color.blanco)
        }
        .background(Color.blanco)
        .ignoresSafeArea(edges: .bottom)
        
    }

    // MARK: - File Picker Simulation
    private func selectOBJFile() {
        // Aqui entraria o file picker real.
        // Para testes, simulamos um arquivo selecionado:
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.selectedOBJFile = UploadedFile(name: "CorazonMedicina.obj", size: "20 MB")
        }
    }
}

// MARK: - Models
private struct UploadedFile {
    let name: String
    let size: String
}

// MARK: - Subviews

private struct RequiredFileCard: View {
    let fileName: String
    let fileSize: String
    let onDelete: () -> Void

    var body: some View {
        HStack(spacing: Tokens.Size.Spacing.regular) {
            Image(systemName: "doc.text")
                .font(.system(size: 30))
                .foregroundColor(.naranja)

            VStack(alignment: .leading, spacing: 4) {
                Text(fileName)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .semibold))
                Text("(\(fileSize))")
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .regular))
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .font(.system(size: 20, weight: .bold))
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blanco)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.naranja, lineWidth: 2)
        )
        .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

private struct UploadBoxView: View {
    let title: String
    let subtitle: String
    let color: Color
    let icon: Image
    let onTap: () -> Void

    var body: some View {
        VStack(spacing: Tokens.Size.Spacing.small) {
            icon
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                .foregroundColor(color)
            Text(subtitle)
                .font(.projectFont(size: Tokens.Size.Font.small, weight: .regular))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, minHeight: 140)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
                .foregroundColor(color)
        )
        .background(Color.blanco)
        .cornerRadius(20)
        .onTapGesture(perform: onTap)
    }
}

// MARK: - Preview

struct UploadImageToPrintView_Previews: PreviewProvider {
    static var previews: some View {
        UploadImageToPrintView(
            viewModel: UploadImageToPrintViewModel(),
            router: UploadImageToPrintRouter(isPresented: .constant(false))
        )
    }
}
