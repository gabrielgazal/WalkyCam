// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum LoginView {
    internal enum Button {
      /// He olvidado la contraseña
      internal static let forgotPassword = L10n.tr("Localizable", "LoginView.button.forgotPassword", fallback: "He olvidado la contraseña")
      /// Login
      internal static let login = L10n.tr("Localizable", "LoginView.button.login", fallback: "Login")
      /// Registrame
      internal static let signup = L10n.tr("Localizable", "LoginView.button.signup", fallback: "Registrame")
    }
    internal enum Divider {
      /// Or Sign up with
      internal static let text = L10n.tr("Localizable", "LoginView.divider.text", fallback: "Or Sign up with")
    }
    internal enum Input {
      internal enum Password {
        /// Contraseña
        internal static let placeholder = L10n.tr("Localizable", "LoginView.input.password.placeholder", fallback: "Contraseña")
        /// Contraseña
        internal static let text = L10n.tr("Localizable", "LoginView.input.password.text", fallback: "Contraseña")
      }
      internal enum User {
        /// Usuario
        internal static let placeholder = L10n.tr("Localizable", "LoginView.input.user.placeholder", fallback: "Usuario")
        /// Usuario
        internal static let text = L10n.tr("Localizable", "LoginView.input.user.text", fallback: "Usuario")
      }
    }
    internal enum Title {
      /// Login
      internal static let text = L10n.tr("Localizable", "LoginView.title.text", fallback: "Login")
    }
  }
  internal enum OnboardingView {
    internal enum Button {
      /// Continuar
      internal static let next = L10n.tr("Localizable", "OnboardingView.Button.next", fallback: "Continuar")
      /// Omitir
      internal static let skip = L10n.tr("Localizable", "OnboardingView.Button.skip", fallback: "Omitir")
      /// Comenzar
      internal static let start = L10n.tr("Localizable", "OnboardingView.Button.start", fallback: "Comenzar")
    }
    internal enum Page1 {
      /// Tu STREETcam 24/7 
      /// Streaming en vivo donde quieras, cuando quieras. Ubica a tu WalkCamer y empieza a grabar. 
      /// WalkyCam tiene mas de 20 servicios. Descúbrelos!
      internal static let subtitle = L10n.tr("Localizable", "OnboardingView.Page1.subtitle", fallback: "Tu STREETcam 24/7 \nStreaming en vivo donde quieras, cuando quieras. Ubica a tu WalkCamer y empieza a grabar. \nWalkyCam tiene mas de 20 servicios. Descúbrelos!")
      /// Qué es?
      internal static let title = L10n.tr("Localizable", "OnboardingView.Page1.title", fallback: "Qué es?")
    }
    internal enum Page2 {
      /// Manos AR, PIXELADO de Caras, Escaneo 3D, DRONES Aéreos y R.O.V., IA especializada, IOT Service, 
      /// **y mucho más!**
      internal static let subtitle = L10n.tr("Localizable", "OnboardingView.Page2.subtitle", fallback: "Manos AR, PIXELADO de Caras, Escaneo 3D, DRONES Aéreos y R.O.V., IA especializada, IOT Service, \n**y mucho más!**")
      /// Universo WalkyCam
      internal static let title = L10n.tr("Localizable", "OnboardingView.Page2.title", fallback: "Universo WalkyCam")
    }
    internal enum Page3 {
      /// Manos AR, PIXELADO de Caras, Escaneo 3D, DRONES Aéreos y R.O.V., IA especializada, IOT Service, 
      /// **y mucho más!**
      internal static let subtitle = L10n.tr("Localizable", "OnboardingView.Page3.subtitle", fallback: "Manos AR, PIXELADO de Caras, Escaneo 3D, DRONES Aéreos y R.O.V., IA especializada, IOT Service, \n**y mucho más!**")
      /// Universo WalkyCam
      internal static let title = L10n.tr("Localizable", "OnboardingView.Page3.title", fallback: "Universo WalkyCam")
    }
  }
  internal enum Copyright {
    /// @WalkyCam 2021 - All reserved copyright
    internal static let text = L10n.tr("Localizable", "copyright.text", fallback: "@WalkyCam 2021 - All reserved copyright")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
