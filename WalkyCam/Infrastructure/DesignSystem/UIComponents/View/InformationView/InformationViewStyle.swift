import Foundation
import SwiftUI

public protocol InformationViewStyle {
    var icon: Image { get set }
    var backgroundColor: Color { get set }
    var borderColor: Color { get set }
    var textColor: Color { get set }
}

struct InformationViewInfoStyle: InformationViewStyle {
    var icon: Image = Image(systemName: "info.circle")
    var backgroundColor: Color = Color.acentoFondoDark
    var borderColor: Color = Color.acentoFondoDark
    var textColor: Color = Color.blanco
}

struct InformationViewWarningStyle: InformationViewStyle {
    var icon: Image = Image(systemName: "exclamationmark.triangle")
    var backgroundColor: Color = Color.naranja
    var borderColor: Color = Color.naranja
    var textColor: Color = Color.blanco
}

struct InformationViewErrorStyle: InformationViewStyle {
    var icon: Image = Image(systemName: "xmark.circle")
    var backgroundColor: Color = Color.rojo
    var borderColor: Color = Color.rojo
    var textColor: Color = Color.blanco
}

struct InformationViewSuccessStyle: InformationViewStyle {
    var icon: Image = Image(systemName: "checkmark.circle")
    var backgroundColor: Color = Color.green2
    var borderColor: Color = Color.green2
    var textColor: Color = Color.blanco
}
