import SwiftUI

struct FeatureInformationView<ViewModel: FeatureInformationViewModelProtocol, Router: FeatureInformationRouterProtocol>: View {

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
                Text("Sube tus Licencias y Permisos relacionados a tus dispositivos y capacidades. ")
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Group {
                    rovInformationView()
                    LinkButton(title: "Agregar otro ROV Submarino",
                               icon: Asset.Icons.add.name,
                               color: .naranja,
                               action: {})
                }
                Group {
                    smartphoneInformationView()
                    LinkButton(title: "Agregar otro Smartphone",
                               icon: Asset.Icons.add.name,
                               color: .naranja,
                               action: {})
                }
                licenseInformationView()
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
    }
    
    private func rovInformationView() -> some View {
        return VStack(alignment: .center,
                      spacing: Tokens.Size.Spacing.regular) {
            Asset.Icons.rov.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
            Text("ROV Submarino")
                .font(.projectFont(size: Tokens.Size.Font.regular, 
                                   weight: .bold))
            TextInputView(text: .constant(""),
                          topDescriptionText: "Nombre comercial",
                          placeholder: "Nombre comercial",
                          backgroundColor: .blancoGris)
            ListInputView(dataList: ["Teste", "Teste2"],
                          selection: .constant(""),
                          topDescriptionText: "Modelo",
                          placeholder: "Selecciona el modelo",
                          backgroundColor: .blancoGris)
            HStack {
                Text("Si tu modelo no aparece, no es un dispositivo admitido por WalkyCam")
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Spacer()
            }
            TextInputView(text: .constant(""),
                          topDescriptionText: "N de serie",
                          placeholder: "N de serie",
                          backgroundColor: .blancoGris)
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.small) {
                Text("Licencia y/o Permisos")
                    .font(.projectFont(size: Tokens.Size.Font.regular,
                                       weight: .bold))
                WCUIButton(title: "Subir licensas",
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {})
            }
        }
                      .padding(Tokens.Size.Spacing.regular)
                      .background {
                          RoundedRectangle(cornerRadius: 24)
                              .fill(Color.blanco)
                              .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)

                      }
    }
    
    private func smartphoneInformationView() -> some View {
        return VStack(alignment: .center,
                      spacing: Tokens.Size.Spacing.regular) {
            Asset.Icons.smartphone.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
            Text("ROV Submarino")
                .font(.projectFont(size: Tokens.Size.Font.regular,
                                   weight: .bold))
            TextInputView(text: .constant(""),
                          topDescriptionText: "Nombre comercial",
                          placeholder: "Nombre comercial",
                          backgroundColor: .blancoGris)
            ListInputView(dataList: ["Teste", "Teste2"],
                          selection: .constant(""),
                          topDescriptionText: "Modelo",
                          placeholder: "Selecciona el modelo",
                          backgroundColor: .blancoGris)
            TextInputView(text: .constant(""),
                          topDescriptionText: "N de serie",
                          placeholder: "N de serie",
                          backgroundColor: .blancoGris)
        }
                      .padding(Tokens.Size.Spacing.regular)
                      .background {
                          RoundedRectangle(cornerRadius: 24)
                              .fill(Color.blanco)
                              .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)

                      }
    }
    
    private func licenseInformationView() -> some View {
        return VStack(alignment: .leading,
                      spacing: Tokens.Size.Spacing.regular) {
            Text("Con qué vehículo propio cuentas?")
                .font(.projectFont(size: Tokens.Size.Font.regular,
                                   weight: .bold))
            WCUIButton(title: "Subir licencia de conducir",
                       style: .outline,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {})
        }
                      .padding(Tokens.Size.Spacing.regular)
                      .background {
                          RoundedRectangle(cornerRadius: 24)
                              .fill(Color.blanco)
                              .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)

                      }
    }
    
    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(3, 4)
            }
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text("Completa la información")
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
}

struct FeatureInformationView_Previews: PreviewProvider {
    static var previews: some View {
    FeatureInformationView(
            viewModel: FeatureInformationViewModel(),
            router: FeatureInformationRouter(isPresented: .constant(false))
        )
    }
}