import SwiftUI

struct AssistantMenuView<ViewModel: AssistantMenuViewModelProtocol, Router: AssistantMenuRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    @State var selection: ListInputItemModel = .init()

    // MARK: - View Body

    var body: some View {
        ZStack {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Group {
                    headerView
                    Spacer()
                        .frame(height: 50)
                }
                .padding(Tokens.Size.Spacing.large)
                HStack {
                    Spacer()
                    Asset.Illustrations.asistenteMenu.swiftUIImage
                }
                Spacer()
            }
            VStack {
                Spacer()
                    .frame(height: 150)
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    Text(L10n.AssistantMenuView.Especialista.title)
                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    ListInputView(
                        dataList: [
                            .init(value: "Carpintero"),
                            .init(value: "Electricista"),
                            .init(value: "Informático/a"),
                            .init(value: "Mecánico/a"),
                            .init(value: "Veterinario")
                        ],
                        selection: $selection,
                        rightIcon: Image(systemName: "chevron.down"),
                        placeholder: L10n.AssistantMenuView.SeleccionaEspecialista.placeholder,
                        backgroundColor: .blanco)
                }
                .padding(Tokens.Size.Spacing.large)
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    WCUIButton(title: L10n.AssistantMenuView.Siguiente.title,
                               style: .standard,
                               descriptor: BlackButtonStyleDescriptor(),
                               action: {
                        router.routeToAvailableAssistants()
                    })
                    .frame(width: 170)
                    .padding(Tokens.Size.Spacing.large)
                    .isHidden(selection == .init())
                }
            }
        }
        .navigation(router)
    }

    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(1, 3)
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.AssistantMenuView.EnQueNecesitasSerAsistido.title)
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

struct AssistantMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AssistantMenuView(
            viewModel: AssistantMenuViewModel(),
            router: AssistantMenuRouter(isPresented: .constant(false))
        )
    }
}
