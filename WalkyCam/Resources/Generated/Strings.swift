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
