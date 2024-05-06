import SwiftUI

struct AvailabilityTabView<ViewModel: AvailabilityTabViewModelProtocol, Router: AvailabilityTabRouterProtocol>: View {

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
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            dayItemCell(title: "Todos los dias")
            dayItemCell(title: "Domingo")
            dayItemCell(title: "Lunes")
            dayItemCell(title: "Martes")
            dayItemCell(title: "Miercoles")
            dayItemCell(title: "Jueves")
            dayItemCell(title: "Viernes")
            dayItemCell(title: "Sabado")
        }
               .padding(Tokens.Size.Spacing.regular)
    }
    
    private func dayItemCell(title: String) -> some View {
        HStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.small) {
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Toggle(isOn: .constant(false)) {
                    EmptyView()
                }
                .toggleStyle(WCNamelessToggleStyle())
            }
            Spacer()
            timeView(time: "-")
            timeView(time: "-")
        }
    }
    private func timeView(time: String) -> some View {
        return Text(time)
            .font(.projectFont(size: Tokens.Size.Font.regular))
            .padding(.vertical, Tokens.Size.Spacing.regular)
            .padding(.horizontal, Tokens.Size.Spacing.xlarge)
            .background {
                Capsule()
                    .fill(Color.blancoGris)
            }
    }
}

struct AvailabilityTabView_Previews: PreviewProvider {
    static var previews: some View {
    AvailabilityTabView(
            viewModel: AvailabilityTabViewModel(),
            router: AvailabilityTabRouter(isPresented: .constant(false))
        )
    }
}
