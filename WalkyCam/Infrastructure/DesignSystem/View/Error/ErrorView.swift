import SwiftUI

struct ErrorView: View {
    let error: ErrorProtocol
    let action: () -> Void

    public init(error: ErrorProtocol, action: @escaping () -> Void) {
        self.error = error
        self.action = action
    }

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            VStack(alignment: .leading, spacing: Tokens.Size.Spacing.large) {
                Image(error.icon)
                VStack(alignment: .leading, spacing: Tokens.Size.Spacing.small) {
                    Text(error.message)
                        .foregroundColor(.grisOscuro)
                    Text(error.description)
                        .foregroundColor(.grisOscuro)
                }
                WCUIButton(title: error.buttonTitle,
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: action)
            }
            .padding(Tokens.Size.Spacing.large)
            Spacer()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.clear)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: GenericError(), action: { })
    }
}
