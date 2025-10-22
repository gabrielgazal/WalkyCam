import SwiftUI

struct PrintConfirmationView<ViewModel: PrintConfirmationViewModelProtocol, Router: PrintConfirmationRouterProtocol>: View {

    // MARK: - Dependencies
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    @State var selectedColor: Color = .black

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
                HeaderCounterView(index: 2, totalSteps: 3)
            }
            .padding(.horizontal)
            .padding(.top, Tokens.Size.Spacing.large)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: Tokens.Size.Spacing.large) {
                    Text("Completa los datos para imprimir")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .padding(.top, Tokens.Size.Spacing.regular)
                
                    Divider()
                    ColorPicker(selection: $selectedColor) {
                        HStack {
                            Asset.Icons.colors.swiftUIImage
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: Tokens.Size.Font.xlarge, height: Tokens.Size.Font.xlarge)
                                .foregroundStyle(selectedColor)
                            Text("Color")
                                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .medium))
                            Text(selectedColor.toHex())
                                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .medium))
                        }
                        .padding()
                    }
                    Divider()
                    // Medidas
                    VStack(alignment: .leading, spacing: Tokens.Size.Spacing.small) {
                        Label("Medidas", systemImage: "cube.box")
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .medium))
                        
                        HStack(spacing: Tokens.Size.Spacing.small) {
                            ForEach(["15 L", "15 W", "15 H"], id: \.self) { measure in
                                Text(measure)
                                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        Capsule()
                                            .fill(Color.blanco)
                                            .applyShadow()
                                    )
                                    .cornerRadius(20)
                                    
                            }
                        }
                    }
                    .padding(.horizontal, Tokens.Size.Spacing.small)
                    Divider()
                    // Dropdowns de opções
                    VStack(spacing: Tokens.Size.Spacing.small) {
                        DropDownRow(icon: "sparkles", title: "Acabado", value: "Brillante")
                        Divider()
                        DropDownRow(icon: "cube.fill", title: "Material", value: "ABS")
                        Divider()
                        DropDownRow(icon: "printer.fill", title: "Impresora", value: "N° de ejes")
                        Divider()
                        DropDownRow(icon: "wrench.adjustable.fill", title: "Cabezales", value: "N° cabezales")
                    }
                    .padding(.top, Tokens.Size.Spacing.regular)
                    
                    Divider()
                    VStack(alignment: .leading, spacing: Tokens.Size.Spacing.small) {
                        Text("Dónde y cuándo quieres tu pedido?")
                            .font(.projectFont(size: Tokens.Size.Font.medium, weight: .semibold))
                            .padding(.bottom, Tokens.Size.Spacing.small)
                        
                        Label("Domicilio de entrega", systemImage: "house")
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .medium))
                        
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.red)
                            Text("Av. Colón 1425")
                                .font(.projectFont(size: Tokens.Size.Font.small, weight: .regular))
                            Spacer()
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.1), radius: 2)
                        
                        Label("Fecha entrega", systemImage: "calendar")
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .medium))
                        
                        HStack {
                            Image(systemName: "calendar.badge.clock")
                                .foregroundColor(.black)
                            Text("24/09/22")
                                .font(.projectFont(size: Tokens.Size.Font.small, weight: .regular))
                            Spacer()
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.1), radius: 2)
                    }
                    .padding(.horizontal, Tokens.Size.Spacing.small)
                    .padding(.bottom, Tokens.Size.Spacing.large)
                }
                .padding(.horizontal, Tokens.Size.Spacing.large)
                .padding(.bottom, 80)
            }
        }
        .footer {
            VStack {
                WCUIButton(
                    title: "Enviar a imprimir",
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: { }
                )
                WCUIButton(
                    title: "Cancelar",
                    style: .standard,
                    descriptor: BlackButtonStyleDescriptor(),
                    action: { }
                )
            }
            .padding()
        }
    }
}

// MARK: - Subviews

private struct DropDownRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: Tokens.Size.Spacing.small) {
            Image(systemName: icon)
                .frame(width: 20)
                .foregroundColor(.black)

            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .medium))
                .frame(width: 100, alignment: .leading)

            Spacer()

            HStack(spacing: 4) {
                Text(value)
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .regular))
                Image(systemName: "chevron.down")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.1), radius: 2)
        }
        .padding(.horizontal, Tokens.Size.Spacing.small)
    }
}

// MARK: - Preview

struct PrintConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PrintConfirmationView(
            viewModel: PrintConfirmationViewModel(),
            router: PrintConfirmationRouter(isPresented: .constant(false))
        )
    }
}

// MARK: - Helpers
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
extension Color {
    func toHex(alpha: Bool = false) -> String {
        let uiColor = UIColor(self)
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alphaValue: CGFloat = 0
        
        guard uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alphaValue) else {
            return "Unavailable"
        }

        if alpha {
            return String(format: "#%02lX%02lX%02lX%02lX",
                          lroundf(Float(red * 255)),
                          lroundf(Float(green * 255)),
                          lroundf(Float(blue * 255)),
                          lroundf(Float(alphaValue * 255)))
        } else {
            return String(format: "#%02lX%02lX%02lX",
                          lroundf(Float(red * 255)),
                          lroundf(Float(green * 255)),
                          lroundf(Float(blue * 255)))
        }
    }
}
