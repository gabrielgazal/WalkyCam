// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum ConfirmMailView {
    /// Ir al correo
    internal static let button = L10n.tr("Localizable", "ConfirmMailView.button", fallback: "Ir al correo")
    /// Tu cuenta se registró con éxito.
    /// Te hemos enviado un correo para confirmar tu cuenta
    internal static let title = L10n.tr("Localizable", "ConfirmMailView.title", fallback: "Tu cuenta se registró con éxito.\nTe hemos enviado un correo para confirmar tu cuenta")
  }
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
  internal enum MenuViewModel {
    internal enum Item {
      /// Walky
      internal static let bot = L10n.tr("Localizable", "MenuViewModel.item.bot", fallback: "Walky")
      /// Galería
      internal static let galery = L10n.tr("Localizable", "MenuViewModel.item.galery", fallback: "Galería")
      /// Ayuda
      internal static let help = L10n.tr("Localizable", "MenuViewModel.item.help", fallback: "Ayuda")
      /// Configuración
      internal static let settings = L10n.tr("Localizable", "MenuViewModel.item.settings", fallback: "Configuración")
      /// Cash Wallet
      internal static let wallet = L10n.tr("Localizable", "MenuViewModel.item.wallet", fallback: "Cash Wallet")
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
      /// 
      /// Streaming en vivo donde quieras, cuando quieras. Ubica a tu WalkCamer y empieza a grabar. 
      /// 
      /// WalkyCam tiene mas de 20 servicios. Descúbrelos!
      internal static let subtitle = L10n.tr("Localizable", "OnboardingView.Page1.subtitle", fallback: "Tu STREETcam 24/7 \n\nStreaming en vivo donde quieras, cuando quieras. Ubica a tu WalkCamer y empieza a grabar. \n\nWalkyCam tiene mas de 20 servicios. Descúbrelos!")
      /// Qué es?
      internal static let title = L10n.tr("Localizable", "OnboardingView.Page1.title", fallback: "Qué es?")
    }
    internal enum Page2 {
      /// Manos AR, PIXELADO de Caras, Escaneo 3D, DRONES Aéreos y R.O.V., IA especializada, IOT Service, 
      /// 
      /// **y mucho más!**
      internal static let subtitle = L10n.tr("Localizable", "OnboardingView.Page2.subtitle", fallback: "Manos AR, PIXELADO de Caras, Escaneo 3D, DRONES Aéreos y R.O.V., IA especializada, IOT Service, \n\n**y mucho más!**")
      /// Universo WalkyCam
      internal static let title = L10n.tr("Localizable", "OnboardingView.Page2.title", fallback: "Universo WalkyCam")
    }
    internal enum Page3 {
      /// Sumergete en otros lugares sin salir de casa.
      /// 
      /// Explora nuevos entornos y viaja virtualmente.
      internal static let subtitle = L10n.tr("Localizable", "OnboardingView.Page3.subtitle", fallback: "Sumergete en otros lugares sin salir de casa.\n\nExplora nuevos entornos y viaja virtualmente.")
      /// Experiencia Inmersiva
      internal static let title = L10n.tr("Localizable", "OnboardingView.Page3.title", fallback: "Experiencia Inmersiva")
    }
  }
  internal enum ProfileView {
    internal enum Button {
      /// Cancelar
      internal static let cancel = L10n.tr("Localizable", "ProfileView.button.cancel", fallback: "Cancelar")
      /// Guardar cambios
      internal static let save = L10n.tr("Localizable", "ProfileView.button.save", fallback: "Guardar cambios")
    }
    internal enum Convert {
      /// Convertime en WalkCamer
      internal static let walkycamer = L10n.tr("Localizable", "ProfileView.convert.walkycamer", fallback: "Convertime en WalkCamer")
    }
    internal enum Field {
      /// Fecha de nacimiento
      internal static let birthDate = L10n.tr("Localizable", "ProfileView.field.birthDate", fallback: "Fecha de nacimiento")
      /// Apellido
      internal static let lastname = L10n.tr("Localizable", "ProfileView.field.lastname", fallback: "Apellido")
      /// Nombre
      internal static let name = L10n.tr("Localizable", "ProfileView.field.name", fallback: "Nombre")
    }
    internal enum Navigation {
      internal enum Default {
        /// Perfil
        internal static let title = L10n.tr("Localizable", "ProfileView.navigation.default.title", fallback: "Perfil")
      }
      internal enum Edit {
        /// Editar Perfil
        internal static let title = L10n.tr("Localizable", "ProfileView.navigation.edit.title", fallback: "Editar Perfil")
      }
    }
    internal enum Section {
      /// Cerrar Sesión
      internal static let logout = L10n.tr("Localizable", "ProfileView.section.logout", fallback: "Cerrar Sesión")
    }
    internal enum Toggle {
      /// Soy WalkCamer
      internal static let walkycamer = L10n.tr("Localizable", "ProfileView.toggle.walkycamer", fallback: "Soy WalkCamer")
    }
  }
  internal enum RegistrationPlans {
    /// Para comenzar elige un plan, luego puedes cambiarlo.
    internal static let description = L10n.tr("Localizable", "RegistrationPlans.description", fallback: "Para comenzar elige un plan, luego puedes cambiarlo.")
    /// Elige tu plan
    internal static let title = L10n.tr("Localizable", "RegistrationPlans.title", fallback: "Elige tu plan")
    /// %@ € / mo
    internal static func value(_ p1: Any) -> String {
      return L10n.tr("Localizable", "RegistrationPlans.value", String(describing: p1), fallback: "%@ € / mo")
    }
    internal enum Button {
      /// Comparar Planes
      internal static let title = L10n.tr("Localizable", "RegistrationPlans.button.title", fallback: "Comparar Planes")
    }
    internal enum Plan {
      internal enum Button {
        /// Ver Plan
        internal static let title = L10n.tr("Localizable", "RegistrationPlans.plan.button.title", fallback: "Ver Plan")
      }
    }
  }
  internal enum StartupView {
    /// Comenzar
    internal static let button = L10n.tr("Localizable", "StartupView.button", fallback: "Comenzar")
    /// Tu cuenta ha sido validada.
    internal static let subtitle = L10n.tr("Localizable", "StartupView.subtitle", fallback: "Tu cuenta ha sido validada.")
    /// Bienvenida %@!
    internal static func title(_ p1: Any) -> String {
      return L10n.tr("Localizable", "StartupView.title", String(describing: p1), fallback: "Bienvenida %@!")
    }
  }
  internal enum TabBarBuilder {
    internal enum Tab {
      /// Funciones
      internal static let functions = L10n.tr("Localizable", "TabBarBuilder.tab.functions", fallback: "Funciones")
      /// Home
      internal static let home = L10n.tr("Localizable", "TabBarBuilder.tab.home", fallback: "Home")
      /// Menú
      internal static let menu = L10n.tr("Localizable", "TabBarBuilder.tab.menu", fallback: "Menú")
    }
  }
  internal enum WalkyBotView {
    /// ¿Qué hacemos hoy?
    internal static let text = L10n.tr("Localizable", "WalkyBotView.text", fallback: "¿Qué hacemos hoy?")
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
