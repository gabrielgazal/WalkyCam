import Foundation
import SwiftUI

struct ReminderCardView: View {
    private let date: String
    private let camerName: String

    public init(
        date: String,
        camerName: String
    ) {
        self.date = date
        self.camerName = camerName
    }

    var body: some View {

        VStack(alignment: .center,
               spacing: 8) {
            Asset.Illustrations.cammy.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.ReminderCardView.dayAndTime)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                Text(date)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
            }
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.ReminderCardView.walkCamer)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                Text(camerName)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
            }
            WCUIButton(title: L10n.ReminderCardView.goToStreetCam,
                       style: .outline,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {})
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(
                Rectangle()
                    .fill(Color.blanco)
                    .cornerRadius(Tokens.Size.Border.Radius.medium, corners: .allCorners)
               )
               .shadow(
                color: Color.negro.opacity(0.1),
                radius: 10,
                x: 0,
                y: 2
               )
    }
}

struct ReminderCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ReminderCardView(date: "Teste", camerName: "Name")
        }
    }
}
