import SwiftUI

struct FeatureSelectionView<ViewModel: FeatureSelectionViewModelProtocol, Router: FeatureSelectionRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    private let columns = [
        GridItem(.flexible(), spacing: Tokens.Size.Spacing.large),
        GridItem(.flexible(), spacing: Tokens.Size.Spacing.large)
    ]
    
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
                devicesView
                abilitiesView
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
        .footer {
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                WCUIButton(title: "Cancelar",
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    router.dismiss()
                })
                WCUIButton(title: "Siguiente",
                           style: .standard,
                           descriptor: BlackButtonStyleDescriptor(),
                           action: {})
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
    }
    
    private var devicesView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            Text("Dispositivos")
                .font(.projectFont(size: Tokens.Size.Font.large))
            LazyVGrid(columns: columns,
                      spacing: Tokens.Size.Spacing.large) {
                ForEach(viewModel.devicesModel, id: \.self) { item in
                        deviceItemCell(item)
                }
            }
        }
    }
    
    private func deviceItemCell(_ model: SelectorModel) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.blanco)
                .cornerRadius(38, corners: .allCorners)
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                Image(model.key)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                Text(model.value)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    .multilineTextAlignment(.center)
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
        .frame(minWidth: 135)
        .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
    }
    
    
    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(2, 4)
            }
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text("Selecciona tus dispositivos y capacidades")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
        }
    }
    
    private var abilitiesView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            Text("Capacidades")
                .font(.projectFont(size: Tokens.Size.Font.large))
            WrappingHStack(horizontalSpacing: Tokens.Size.Spacing.regular, verticalSpacing: Tokens.Size.Spacing.regular) {
                ForEach(viewModel.abilitiesModel, id: \.self) { item in
                    abilityItemCell(item)
                }
            }
        }
    }
    
    private func abilityItemCell(_ model: SelectorModel) -> some View {
        Text(model.value)
            .font(.projectFont(size: Tokens.Size.Font.regular))
            .padding(Tokens.Size.Spacing.small)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(model.isSelected ? Color.naranja.opacity(0.3) : .white)
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.naranja, lineWidth: 2)
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

struct FeatureSelectionView_Previews: PreviewProvider {
    static var previews: some View {
    FeatureSelectionView(
            viewModel: FeatureSelectionViewModel(),
            router: FeatureSelectionRouter(isPresented: .constant(false))
        )
    }
}

private struct WrappingHStack: Layout {
    private var horizontalSpacing: CGFloat
    private var verticalSpacing: CGFloat
    public init(horizontalSpacing: CGFloat, verticalSpacing: CGFloat? = nil) {
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing ?? horizontalSpacing
    }

    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache _: inout ()) -> CGSize {
        guard !subviews.isEmpty else { return .zero }

        let height = subviews.map { $0.sizeThatFits(proposal).height }.max() ?? 0

        var rowWidths = [CGFloat]()
        var currentRowWidth: CGFloat = 0
        subviews.forEach { subview in
            if currentRowWidth + horizontalSpacing + subview.sizeThatFits(proposal).width >= proposal.width ?? 0 {
                rowWidths.append(currentRowWidth)
                currentRowWidth = subview.sizeThatFits(proposal).width
            } else {
                currentRowWidth += horizontalSpacing + subview.sizeThatFits(proposal).width
            }
        }
        rowWidths.append(currentRowWidth)

        let rowCount = CGFloat(rowWidths.count)
        return CGSize(width: max(rowWidths.max() ?? 0, proposal.width ?? 0), height: rowCount * height + (rowCount - 1) * verticalSpacing)
    }

    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let height = subviews.map { $0.dimensions(in: proposal).height }.max() ?? 0
        guard !subviews.isEmpty else { return }
        var x = bounds.minX
        var y = height / 2 + bounds.minY
        subviews.forEach { subview in
            x += subview.dimensions(in: proposal).width / 2
            if x + subview.dimensions(in: proposal).width / 2 > bounds.maxX {
                x = bounds.minX + subview.dimensions(in: proposal).width / 2
                y += height + verticalSpacing
            }
            subview.place(
                at: CGPoint(x: x, y: y),
                anchor: .center,
                proposal: ProposedViewSize(
                    width: subview.dimensions(in: proposal).width,
                    height: subview.dimensions(in: proposal).height
                )
            )
            x += subview.dimensions(in: proposal).width / 2 + horizontalSpacing
        }
    }
}
