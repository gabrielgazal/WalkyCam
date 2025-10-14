import SwiftUI

struct FeatureInformationView<ViewModel: FeatureInformationViewModelProtocol, Router: FeatureInformationRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var rovName: String = ""
    @State var rovSerialNumber: String = ""
    @State var rovModel: ListInputItemModel = .init()
    @State var smartphoneBrand: ListInputItemModel = .init()
    @State var smartphoneModel: String = ""
    @State var smartphoneSerialNumber: String = ""

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
                Text(L10n.FeatureInformationView.Description.uploadLicenses)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                VStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    rovInformationView()
                    LinkButton(title: L10n.FeatureInformationView.Rov.addAnother,
                               icon: Asset.Icons.add.name,
                               color: .naranja,
                               action: {
                        
                    })
                }
                VStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    smartphoneInformationView()
                    LinkButton(title: L10n.FeatureInformationView.Smartphone.addAnother,
                               icon: Asset.Icons.add.name,
                               color: .naranja,
                               action: {})
                }
                licenseInformationView()
                deepnessInformationView()
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
        .footer {
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                WCUIButton(
                    title: L10n.FeatureInformationView.cancel,
                    style: .outline,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: {
                        router.dismiss()
                    }
                )
                WCUIButton(
                    title: L10n.FeatureInformationView.next,
                    style: .standard,
                    descriptor: BlackButtonStyleDescriptor(),
                    action: {
                        
                        router.routeToAvailability()
                    }
                )
            }
                   .padding()
        }
        .scrollIndicators(.hidden)
        .navigation(router)
    }
    
    private func rovInformationView() -> some View {
        return VStack(alignment: .center,
                      spacing: Tokens.Size.Spacing.regular) {
            Asset.Icons.rov.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
            Text(L10n.FeatureInformationView.Rov.title)
                .font(.projectFont(size: Tokens.Size.Font.regular,
                                   weight: .bold))
            TextInputView(text: $rovName,
                          topDescriptionText: L10n.FeatureInformationView.Rov.name,
                          placeholder: L10n.FeatureInformationView.Rov.name,
                          backgroundColor: .blancoGris)
            ListInputView(
                dataList: [
                    .init(value: "Teste"),
                    .init(value: "Teste2")
                ],
                selection: $rovModel,
                topDescriptionText: L10n.FeatureInformationView.Rov.model,
                placeholder: L10n.FeatureInformationView.Rov.model,
                backgroundColor: .blancoGris
            )
            HStack {
                Text(L10n.FeatureInformationView.Rov.modelNotSupported)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Spacer()
            }
            TextInputView(text: $rovSerialNumber,
                          topDescriptionText: L10n.FeatureInformationView.Rov.serialNumber,
                          placeholder: L10n.FeatureInformationView.Rov.serialNumber,
                          backgroundColor: .blancoGris)
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.small) {
                Text(L10n.FeatureInformationView.Rov.licenseAndPermissions)
                    .font(.projectFont(size: Tokens.Size.Font.regular,
                                       weight: .bold))
                WCUIButton(title: L10n.FeatureInformationView.Rov.uploadLicenses,
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
            Text(L10n.FeatureInformationView.Smartphone.title)
                .font(.projectFont(size: Tokens.Size.Font.regular,
                                   weight: .bold))
            TextInputView(
                text: Binding(
                    get: { smartphoneBrand.value },
                    set: { item in
                        smartphoneBrand = .init(value: item)
                    }
                ),
                topDescriptionText: L10n.FeatureInformationView.Smartphone.name,
                placeholder: L10n.FeatureInformationView.Smartphone.name,
                backgroundColor: .blancoGris
            )
            ListInputView(
                dataList: [
                    .init(value: "Teste"),
                    .init(value: "Teste2")
                ],
                selection: $smartphoneBrand,
                topDescriptionText: L10n.FeatureInformationView.Smartphone.model,
                placeholder: L10n.FeatureInformationView.Smartphone.model,
                backgroundColor: .blancoGris
            )
            TextInputView(text: $smartphoneSerialNumber,
                          topDescriptionText: L10n.FeatureInformationView.Smartphone.serialNumber,
                          placeholder: L10n.FeatureInformationView.Smartphone.serialNumber,
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
            Text(L10n.FeatureInformationView.Vehicle.question)
                .font(.projectFont(size: Tokens.Size.Font.regular,
                                   weight: .bold))
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                ForEach(0..<viewModel.vehicleModel.count, id: \.self) { index in
                    deviceItemCell(viewModel.vehicleModel[index])
                        .onTapGesture {
                            viewModel.vehicleModel[index].isSelected.toggle()
                        }
                }
            }
            WCUIButton(title: L10n.FeatureInformationView.Vehicle.uploadDrivingLicense,
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
    
    private func deepnessInformationView() -> some View {
        return VStack(alignment: .leading,
                      spacing: Tokens.Size.Spacing.regular) {
            Text(L10n.FeatureInformationView.Deepness.depthCapacity)
                .font(.projectFont(size: Tokens.Size.Font.regular,
                                   weight: .bold))
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                ForEach(0..<viewModel.deepnessModel.count, id: \.self) { index in
                    deviceItemCell(viewModel.deepnessModel[index])
                        .onTapGesture {
                            viewModel.deepnessModel[index].isSelected.toggle()
                        }
                }
            }
            WCUIButton(title: L10n.FeatureInformationView.Deepness.uploadDivingPermit,
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
                Text(L10n.FeatureInformationView.Header.completeInformation)
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
    
    private func deviceItemCell(_ model: SelectorModel) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.blanco)
                .cornerRadius(38, corners: .allCorners)
            if model.isSelected {
                RoundedRectangle(cornerRadius: 38)
                    .stroke(Color.acentoFondoDark, lineWidth: 2)
            }
            Text(model.value)
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                .multilineTextAlignment(.center)
                   .padding(Tokens.Size.Spacing.regular)
            if model.isSelected {
                VStack {
                    HStack {
                        Spacer()
                        Asset.Icons.blueCheckmark.swiftUIImage
                    }
                    Spacer()
                }
                .padding(Tokens.Size.Spacing.small)
            }
        }
        .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
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
