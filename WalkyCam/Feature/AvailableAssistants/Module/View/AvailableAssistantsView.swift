import SwiftUI

struct AvailableAssistantsView<ViewModel:AvailableAssistantsViewModelProtocol, Router: AvailableAssistantsRouterProtocol>: View {

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
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                headerView
                cammerListView()
            }
        }
        .navigation(router)
    }
    
    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(2, 3)
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text("Especialistas\ndisponibles")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
                   .padding(.horizontal, Tokens.Size.Spacing.large)
        }
    }

    private func headerCounterView(_ index: Int, _ totalSteps: Int) -> some View {
        ZStack {
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.black)
            HStack {
                Rectangle()
                    .frame(width: CGFloat(index - 1) * 95, height: 3)
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

    private func cammerListView() -> some View {
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
}

struct AvailableAssistantsView_Previews: PreviewProvider {
    static var previews: some View {
    AvailableAssistantsView(
            viewModel: AvailableAssistantsViewModel(),
            router: AvailableAssistantsRouter(isPresented: .constant(false))
        )
    }
}
