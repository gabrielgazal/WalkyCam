import SwiftUI

struct ShareSheetView<ViewModel:ShareSheetViewModelProtocol, Router: ShareSheetRouterProtocol>: View {

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
               spacing: Tokens.Size.Spacing.large) {
            HStack {
                Text(viewModel.title)
                    .font(.projectFont(size: Tokens.Size.Font.large, weight: .bold))
                Spacer()
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12)
                    .onTapGesture {
                        router.dismiss()
                    }
            }
            Asset.Icons.shareGrid.swiftUIImage
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                TextInputView(text: $viewModel.link,
                              topDescriptionText: "Page link",
                              placeholder: "",
                              backgroundColor: .blancoGris)
                Asset.Icons.copy.swiftUIImage
            }
        }
               .padding(Tokens.Size.Spacing.large)
    }
}

struct ShareSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetView(
            viewModel: ShareSheetViewModel(title: "Teste de título",
                                           link: "www.com.br"),
            router: ShareSheetRouter(isPresented: .constant(false))
        )
    }
}
