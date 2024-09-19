import SwiftUI

struct WalkyCammerListView<ViewModel: WalkyCammerListViewModelProtocol, Router: WalkyCammerListRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var searchText = ""

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
            headerView
            TextInputView(
                text: $searchText,
                accessory: Image(systemName: "magnifyingglass"),
                placeholder: L10n.WalkyCammerListView.BuscarWalkCamer.placeholder,
                leftIcon: Asset.Icons.location.swiftUIImage,
                rightIcon: Asset.Icons.filter.swiftUIImage,
                backgroundColor: .blanco,
                actions: .init()
            )
            .shadow(
                color: Color.negro.opacity(0.1),
                radius: 10,
                x: 0,
                y: 2
            )
            .padding(.horizontal, Tokens.Size.Spacing.regular)
            AsyncDataView(viewModel.walkyCammers) { cammers in
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading,
                           spacing: Tokens.Size.Spacing.regular) {
                        ForEach(cammers, id: \.self) { cammer in
                            CammerItemView(name: cammer.name,
                                           photo: cammer.profileImage,
                                           description: cammer.description,
                                           stars: cammer.stars,
                                           technologies: cammer.technologies)
                            .onTapGesture {
                                router.routeToCamerDetail(cammer)
                            }
                        }
                    }
                    .padding(.horizontal, Tokens.Size.Spacing.regular)
                }
            } errorAction: {}
        }
        .padding([.top], Tokens.Size.Spacing.huge)
        .ignoresSafeArea()
        .navigation(router)
    }

    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(2, 4)
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.WalkyCammerListView.WalkCamersDisponibles.title)
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
        }
        .padding(.horizontal, Tokens.Size.Spacing.large)
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

struct WalkyCammerListView_Previews: PreviewProvider {
    static var previews: some View {
        WalkyCammerListView(
            viewModel: WalkyCammerListViewModel(),
            router: WalkyCammerListRouter(isPresented: .constant(false))
        )
    }
}
