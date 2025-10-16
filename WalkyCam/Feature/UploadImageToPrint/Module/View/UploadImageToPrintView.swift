import SwiftUI

struct UploadImageToPrintView<ViewModel: UploadImageToPrintViewModelProtocol, Router: UploadImageToPrintRouterProtocol>: View {
    
    // MARK: - Dependencies
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    // MARK: - State
    @State private var selectedOBJFile: UploadedFile?
    @State private var selectedTextureFile: UploadedFile?
    @State private var selectedMTLFile: UploadedFile?
    
    // MARK: - Initialization
    init(viewModel: ViewModel, router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                HeaderCounterView(index: 1, totalSteps: 3)
            }
            .padding(.horizontal)
            .padding(.top, Tokens.Size.Spacing.large)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: Tokens.Size.Spacing.large) {
                    Text("Subir imagen 3D")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .padding(.top, Tokens.Size.Spacing.regular)
                    
                    objFileView
                    
                    VStack(spacing: Tokens.Size.Spacing.regular) {
                        Text("Opcional: Color y Textura")
                            .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
                            .padding(.top, Tokens.Size.Spacing.large)
                        mtlFileView
                        textureFileView
                    }
                }
                .padding(.horizontal, Tokens.Size.Spacing.large)
                .padding(.bottom, 100)
            }
            HStack {
                Spacer()
                WCUIButton(
                    title: "Siguiente",
                    style: .standard,
                    descriptor: BlackButtonStyleDescriptor(),
                    action: {
                        router.routeToPrintConfirmation()
                    }
                )
                .padding(.horizontal, Tokens.Size.Spacing.large)
                .padding(.bottom, Tokens.Size.Spacing.large)
                .disabled(selectedOBJFile == nil)
            }
            .background(Color.blanco)
        }
        .background(Color.blanco)
        .ignoresSafeArea(edges: .bottom)
        .navigation(router)
    }
    
    private var objFileView: some View {
        VStack(alignment: .leading) {
            Text("Requerido")
                .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
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
        }
    }
    
    private var mtlFileView: some View {
        VStack(alignment: .leading) {
            if let file = selectedMTLFile {
                RequiredFileCard(
                    fileName: file.name,
                    fileSize: file.size,
                    onDelete: { selectedMTLFile = nil }
                )
            } else {
                UploadBoxView(
                    title: "Archivo .MTL",
                    subtitle: "Max 64 MB or 1 million polygons",
                    color: .acentoFondoDark,
                    icon: Asset.Icons.uploadFolderBlue.swiftUIImage,
                    onTap: selectMTLFile
                )
            }
        }
    }
    
    private var textureFileView: some View {
        VStack(alignment: .leading) {
            if let file = selectedTextureFile {
                RequiredFileCard(
                    fileName: file.name,
                    fileSize: file.size,
                    onDelete: { selectedTextureFile = nil }
                )
            } else {
                UploadBoxView(
                    title: "Textures files: GIF, JPG, PNG",
                    subtitle: "Max 64 MB or 1 million polygons",
                    color: .acentoFondoDark,
                    icon: Asset.Icons.uploadFolderBlue.swiftUIImage,
                    onTap: selectTextureFile
                )
            }
        }
    }
    
    // MARK: - File Picker Simulation
    private func selectOBJFile() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.selectedOBJFile = UploadedFile(name: "CorazonMedicina.obj", size: "20 MB")
        }
    }
    
    private func selectMTLFile() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.selectedMTLFile = UploadedFile(name: "Corazon.mtl", size: "20 MB")
        }
    }
    
    private func selectTextureFile() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.selectedTextureFile = UploadedFile(name: "CorazonRojo.png", size: "14 MB")
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
                .foregroundColor(.negro)
            
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
                .stroke(Color.gris, lineWidth: 2)
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
                .resizable()
                .scaledToFit()
                .frame(width: Tokens.Size.Spacing.big, height: Tokens.Size.Spacing.big)
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
