// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum AIMenuView {
    /// AI & Data Analysis
    internal static var title: String { return L10n.tr("Localizable", "AIMenuView.Title", fallback: "AI & Data Analysis") }
    internal enum Configuracao {
      /// Configuración
      internal static var title: String { return L10n.tr("Localizable", "AIMenuView.Configuracao.title", fallback: "Configuración") }
    }
    internal enum WalkySoloParaTi {
      /// Walky, solo para ti
      internal static var title: String { return L10n.tr("Localizable", "AIMenuView.WalkySoloParaTi.title", fallback: "Walky, solo para ti") }
    }
  }
  internal enum AIOnboardingView {
    internal enum ConfigurarAccesos {
      /// Configurar accesos
      internal static var title: String { return L10n.tr("Localizable", "AIOnboardingView.ConfigurarAccesos.title", fallback: "Configurar accesos") }
    }
    internal enum DescripcionPermitirAccesos {
      /// Por única vez, antes de iniciar es necesario integrar y permitir accesos para poder ofrecer mejores recomendaciones, ahorrar trabajo y ofrecer soluciones/ alternativas a los problemas.
      internal static var title: String { return L10n.tr("Localizable", "AIOnboardingView.DescripcionPermitirAccesos.title", fallback: "Por única vez, antes de iniciar es necesario integrar y permitir accesos para poder ofrecer mejores recomendaciones, ahorrar trabajo y ofrecer soluciones/ alternativas a los problemas.") }
    }
    internal enum DescripcionWalky {
      /// Motor de AI entrenado sobre tus datos y tu comportamiento de uso dentro de WalkyCam.
      internal static var title: String { return L10n.tr("Localizable", "AIOnboardingView.DescripcionWalky.title", fallback: "Motor de AI entrenado sobre tus datos y tu comportamiento de uso dentro de WalkyCam.") }
    }
    internal enum PermitirAccesos {
      /// Permitir accesos
      internal static var title: String { return L10n.tr("Localizable", "AIOnboardingView.PermitirAccesos.title", fallback: "Permitir accesos") }
    }
    internal enum WalkySoloParaTi {
      /// Walky, solo para ti
      internal static var title: String { return L10n.tr("Localizable", "AIOnboardingView.WalkySoloParaTi.title", fallback: "Walky, solo para ti") }
    }
  }
  internal enum ARHandsMenuView {
    internal enum AsistenciaRemota {
      /// Asistencia Remota
      internal static var title: String { return L10n.tr("Localizable", "ARHandsMenuView.AsistenciaRemota.title", fallback: "Asistencia Remota") }
    }
    internal enum AsistenteExterno {
      /// Asistente Externo
      internal static var title: String { return L10n.tr("Localizable", "ARHandsMenuView.AsistenteExterno.title", fallback: "Asistente Externo") }
    }
    internal enum AsistenteWalkyCam {
      /// Asistente WalkyCam
      internal static var title: String { return L10n.tr("Localizable", "ARHandsMenuView.AsistenteWalkyCam.title", fallback: "Asistente WalkyCam") }
    }
    internal enum GemeloDigital {
      /// Gemelo Digital
      internal static var title: String { return L10n.tr("Localizable", "ARHandsMenuView.GemeloDigital.title", fallback: "Gemelo Digital") }
    }
  }
  internal enum ARHandsOnboardingView {
    internal enum Comenzar {
      /// Comenzar
      internal static var title: String { return L10n.tr("Localizable", "ARHandsOnboardingView.Comenzar.title", fallback: "Comenzar") }
    }
    internal enum RecibeAyudaADistancia {
      /// Recibe ayuda a distancia
      internal static var title: String { return L10n.tr("Localizable", "ARHandsOnboardingView.RecibeAyudaADistancia.title", fallback: "Recibe ayuda a distancia") }
    }
    internal enum SeleccionaArea {
      /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
      /// 
      /// O también puedes ingresar el código que te envíe tu asistente de confianza.
      internal static var title: String { return L10n.tr("Localizable", "ARHandsOnboardingView.SeleccionaArea.title", fallback: "Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.\n\nO también puedes ingresar el código que te envíe tu asistente de confianza.") }
    }
  }
  internal enum AddPeopleTransmissionView {
    /// Puedes agregar hasta 200 asistentes más.
    internal static var description: String { return L10n.tr("Localizable", "AddPeopleTransmissionView.description", fallback: "Puedes agregar hasta 200 asistentes más.") }
    /// O invitar amigos por...
    internal static var inviteOptions: String { return L10n.tr("Localizable", "AddPeopleTransmissionView.inviteOptions", fallback: "O invitar amigos por...") }
    internal enum Header {
      /// Agregar personas a la transmisión
      internal static var title: String { return L10n.tr("Localizable", "AddPeopleTransmissionView.header.title", fallback: "Agregar personas a la transmisión") }
    }
    internal enum InviteButton {
      /// Invitar amigos de Walkycam
      internal static var title: String { return L10n.tr("Localizable", "AddPeopleTransmissionView.inviteButton.title", fallback: "Invitar amigos de Walkycam") }
    }
    internal enum LaterButton {
      /// Invitar luego
      internal static var title: String { return L10n.tr("Localizable", "AddPeopleTransmissionView.laterButton.title", fallback: "Invitar luego") }
    }
    internal enum NextButton {
      /// Siguiente
      internal static var title: String { return L10n.tr("Localizable", "AddPeopleTransmissionView.nextButton.title", fallback: "Siguiente") }
    }
  }
  internal enum AssistantMenuView {
    internal enum EnQueNecesitasSerAsistido {
      /// En qué necesitas ser asistido/a?
      internal static var title: String { return L10n.tr("Localizable", "AssistantMenuView.EnQueNecesitasSerAsistido.title", fallback: "En qué necesitas ser asistido/a?") }
    }
    internal enum Especialista {
      /// Especialista
      internal static var title: String { return L10n.tr("Localizable", "AssistantMenuView.Especialista.title", fallback: "Especialista") }
    }
    internal enum SeleccionaEspecialista {
      /// Selecciona especialista
      internal static var placeholder: String { return L10n.tr("Localizable", "AssistantMenuView.SeleccionaEspecialista.placeholder", fallback: "Selecciona especialista") }
    }
    internal enum Siguiente {
      /// Siguiente
      internal static var title: String { return L10n.tr("Localizable", "AssistantMenuView.Siguiente.title", fallback: "Siguiente") }
    }
  }
  internal enum AvailabilityTabView {
    /// Todos los dias
    internal static var allDays: String { return L10n.tr("Localizable", "AvailabilityTabView.allDays", fallback: "Todos los dias") }
  }
  internal enum AvailabilityTabViewModel {
    internal enum Days {
      /// Todos los dias
      internal static var everyday: String { return L10n.tr("Localizable", "AvailabilityTabViewModel.days.everyday", fallback: "Todos los dias") }
      /// Viernes
      internal static var friday: String { return L10n.tr("Localizable", "AvailabilityTabViewModel.days.friday", fallback: "Viernes") }
      /// Lunes
      internal static var monday: String { return L10n.tr("Localizable", "AvailabilityTabViewModel.days.monday", fallback: "Lunes") }
      /// Sabado
      internal static var saturday: String { return L10n.tr("Localizable", "AvailabilityTabViewModel.days.saturday", fallback: "Sabado") }
      /// Domingo
      internal static var sunday: String { return L10n.tr("Localizable", "AvailabilityTabViewModel.days.sunday", fallback: "Domingo") }
      /// Jueves
      internal static var thursday: String { return L10n.tr("Localizable", "AvailabilityTabViewModel.days.thursday", fallback: "Jueves") }
      /// Martes
      internal static var tuesday: String { return L10n.tr("Localizable", "AvailabilityTabViewModel.days.tuesday", fallback: "Martes") }
      /// Miercoles
      internal static var wednesday: String { return L10n.tr("Localizable", "AvailabilityTabViewModel.days.wednesday", fallback: "Miercoles") }
    }
  }
  internal enum AvailableAssistantsView {
    internal enum EspecialistasDisponibles {
      /// Especialistas
      /// disponibles
      internal static var title: String { return L10n.tr("Localizable", "AvailableAssistantsView.EspecialistasDisponibles.title", fallback: "Especialistas\ndisponibles") }
    }
  }
  internal enum BookWalkycamerView {
    internal enum CompletaTuReserva {
      /// Completa tu reserva
      internal static var title: String { return L10n.tr("Localizable", "BookWalkycamerView.CompletaTuReserva.title", fallback: "Completa tu reserva") }
    }
    internal enum SeleccionaFechaHoraArea {
      /// Selecciona fecha, hora y área de grabación
      internal static var title: String { return L10n.tr("Localizable", "BookWalkycamerView.SeleccionaFechaHoraArea.title", fallback: "Selecciona fecha, hora y área de grabación") }
    }
    internal enum Siguiente {
      /// Siguiente
      internal static var title: String { return L10n.tr("Localizable", "BookWalkycamerView.Siguiente.title", fallback: "Siguiente") }
    }
  }
  internal enum BookWalkycamerViewModel {
    internal enum Area {
      /// Área
      internal static var title: String { return L10n.tr("Localizable", "BookWalkycamerViewModel.Area.title", fallback: "Área") }
    }
    internal enum Fecha {
      /// Fecha
      internal static var title: String { return L10n.tr("Localizable", "BookWalkycamerViewModel.Fecha.title", fallback: "Fecha") }
    }
    internal enum Hora {
      /// Hora
      internal static var title: String { return L10n.tr("Localizable", "BookWalkycamerViewModel.Hora.title", fallback: "Hora") }
    }
  }
  internal enum CalendarTabView {
    internal enum SeleccionaUnaFecha {
      /// Selecciona una fecha
      internal static var title: String { return L10n.tr("Localizable", "CalendarTabView.SeleccionaUnaFecha.title", fallback: "Selecciona una fecha") }
    }
  }
  internal enum CamerAvailabilityView {
    /// Cancelar
    internal static var cancel: String { return L10n.tr("Localizable", "CamerAvailabilityView.cancel", fallback: "Cancelar") }
    /// Finalizar
    internal static var finish: String { return L10n.tr("Localizable", "CamerAvailabilityView.finish", fallback: "Finalizar") }
    internal enum Header {
      /// Indica disponibilidad y área de trabajo
      internal static var title: String { return L10n.tr("Localizable", "CamerAvailabilityView.header.title", fallback: "Indica disponibilidad y área de trabajo") }
    }
  }
  internal enum CamerAvailabilityViewModel {
    internal enum Tabs {
      /// Disponibilidad
      internal static var availability: String { return L10n.tr("Localizable", "CamerAvailabilityViewModel.tabs.availability", fallback: "Disponibilidad") }
      /// Área preferida
      internal static var preferredArea: String { return L10n.tr("Localizable", "CamerAvailabilityViewModel.tabs.preferredArea", fallback: "Área preferida") }
    }
  }
  internal enum CammerDetailsView {
    /// CAPACIDADES
    internal static var abilities: String { return L10n.tr("Localizable", "CammerDetailsView.abilities", fallback: "CAPACIDADES") }
    /// Apto %@
    internal static func ability(_ p1: Any) -> String {
      return L10n.tr("Localizable", "CammerDetailsView.ability", String(describing: p1), fallback: "Apto %@")
    }
    /// Sobre %@
    internal static func about(_ p1: Any) -> String {
      return L10n.tr("Localizable", "CammerDetailsView.about", String(describing: p1), fallback: "Sobre %@")
    }
    /// Disponibilidad
    internal static var availability: String { return L10n.tr("Localizable", "CammerDetailsView.availability", fallback: "Disponibilidad") }
    /// Chatea conmigo
    internal static var chatButton: String { return L10n.tr("Localizable", "CammerDetailsView.chatButton", fallback: "Chatea conmigo") }
    /// $
    internal static var currency: String { return L10n.tr("Localizable", "CammerDetailsView.currency", fallback: "$") }
    /// DISPOSITIVOS
    internal static var devices: String { return L10n.tr("Localizable", "CammerDetailsView.devices", fallback: "DISPOSITIVOS") }
    /// Costo por hora
    internal static var hourlyCost: String { return L10n.tr("Localizable", "CammerDetailsView.hourlyCost", fallback: "Costo por hora") }
    /// hs
    internal static var hours: String { return L10n.tr("Localizable", "CammerDetailsView.hours", fallback: "hs") }
    /// Tiempo de grabación
    internal static var recordingTime: String { return L10n.tr("Localizable", "CammerDetailsView.recordingTime", fallback: "Tiempo de grabación") }
    /// Seleccionar
    internal static var selectButton: String { return L10n.tr("Localizable", "CammerDetailsView.selectButton", fallback: "Seleccionar") }
    /// TESTE 123
    internal static var testLocation: String { return L10n.tr("Localizable", "CammerDetailsView.testLocation", fallback: "TESTE 123") }
  }
  internal enum CammerDetailsViewModel {
    internal enum TopBarItem {
      /// Información
      internal static var information: String { return L10n.tr("Localizable", "CammerDetailsViewModel.topBarItem.information", fallback: "Información") }
      /// Reseñas (10)
      internal static var reviews: String { return L10n.tr("Localizable", "CammerDetailsViewModel.topBarItem.reviews", fallback: "Reseñas (10)") }
    }
  }
  internal enum CashTabView {
    /// Actividad
    internal static var activity: String { return L10n.tr("Localizable", "CashTabView.activity", fallback: "Actividad") }
    /// Balance
    internal static var balance: String { return L10n.tr("Localizable", "CashTabView.balance", fallback: "Balance") }
    /// O convetirlo en
    internal static var convertTo: String { return L10n.tr("Localizable", "CashTabView.convertTo", fallback: "O convetirlo en") }
    /// Ingresar dinero
    internal static var enterMoney: String { return L10n.tr("Localizable", "CashTabView.enterMoney", fallback: "Ingresar dinero") }
    /// Funciones
    internal static var functions: String { return L10n.tr("Localizable", "CashTabView.functions", fallback: "Funciones") }
    /// Market
    internal static var market: String { return L10n.tr("Localizable", "CashTabView.market", fallback: "Market") }
    /// PI
    internal static var pi: String { return L10n.tr("Localizable", "CashTabView.pi", fallback: "PI") }
    /// RC2
    internal static var rc2: String { return L10n.tr("Localizable", "CashTabView.rc2", fallback: "RC2") }
    /// Retirar dinero
    internal static var withdrawMoney: String { return L10n.tr("Localizable", "CashTabView.withdrawMoney", fallback: "Retirar dinero") }
  }
  internal enum CashWalletOnboardingView {
    internal enum Button {
      /// Continuar
      internal static var next: String { return L10n.tr("Localizable", "CashWalletOnboardingView.Button.next", fallback: "Continuar") }
      /// Omitir
      internal static var skip: String { return L10n.tr("Localizable", "CashWalletOnboardingView.Button.skip", fallback: "Omitir") }
      /// Ingresar
      internal static var start: String { return L10n.tr("Localizable", "CashWalletOnboardingView.Button.start", fallback: "Ingresar") }
    }
    internal enum Page1 {
      /// Tu dinero de curso legal (Dinero FIAT), accede a tus cuentas bancarias y efectúa o recibe transferencias, con la máxima seguridad.
      internal static var subtitle: String { return L10n.tr("Localizable", "CashWalletOnboardingView.Page1.subtitle", fallback: "Tu dinero de curso legal (Dinero FIAT), accede a tus cuentas bancarias y efectúa o recibe transferencias, con la máxima seguridad.") }
      /// Cash Wallet
      internal static var title: String { return L10n.tr("Localizable", "CashWalletOnboardingView.Page1.title", fallback: "Cash Wallet") }
    }
    internal enum Page2 {
      /// Monedero de Criptomonedas: Opera sobre tus criptomonedas con total seguridad.
      internal static var subtitle: String { return L10n.tr("Localizable", "CashWalletOnboardingView.Page2.subtitle", fallback: "Monedero de Criptomonedas: Opera sobre tus criptomonedas con total seguridad.") }
      /// Crypto Wallet
      internal static var title: String { return L10n.tr("Localizable", "CashWalletOnboardingView.Page2.title", fallback: "Crypto Wallet") }
    }
  }
  internal enum ChatListView {
    /// Sin mensajes
    internal static var emptyState: String { return L10n.tr("Localizable", "ChatListView.EmptyState", fallback: "Sin mensajes") }
    /// Mensajes
    internal static var title: String { return L10n.tr("Localizable", "ChatListView.Title", fallback: "Mensajes") }
  }
  internal enum ConfigureAccessView {
    internal enum Continuar {
      /// Continuar
      internal static var title: String { return L10n.tr("Localizable", "ConfigureAccessView.Continuar.title", fallback: "Continuar") }
    }
    internal enum HolaSoyWalky {
      /// Hola! Soy Walky
      internal static var title: String { return L10n.tr("Localizable", "ConfigureAccessView.HolaSoyWalky.title", fallback: "Hola! Soy Walky") }
    }
    internal enum IntegrarRedes {
      /// También puedes integrar tus redes sociales y de negocios para mejorar mis sugerencias
      internal static var title: String { return L10n.tr("Localizable", "ConfigureAccessView.IntegrarRedes.title", fallback: "También puedes integrar tus redes sociales y de negocios para mejorar mis sugerencias") }
    }
    internal enum NivelDeExperiencia {
      /// Nivel de experiencia
      internal static var title: String { return L10n.tr("Localizable", "ConfigureAccessView.NivelDeExperiencia.title", fallback: "Nivel de experiencia") }
    }
    internal enum NivelOptimo {
      /// En base a tus permisos el nivel de experiencia conmigo será ÓPTIMO
      internal static var title: String { return L10n.tr("Localizable", "ConfigureAccessView.NivelOptimo.title", fallback: "En base a tus permisos el nivel de experiencia conmigo será ÓPTIMO") }
    }
    internal enum PermisosExternos {
      /// Permisos externos
      internal static var title: String { return L10n.tr("Localizable", "ConfigureAccessView.PermisosExternos.title", fallback: "Permisos externos") }
    }
    internal enum PermisosInternos {
      /// Permisos internos
      internal static var title: String { return L10n.tr("Localizable", "ConfigureAccessView.PermisosInternos.title", fallback: "Permisos internos") }
    }
    internal enum SeraTuAsistente {
      /// Seré tu asistente para ofrecer las mejores recomendaciones.
      internal static var title: String { return L10n.tr("Localizable", "ConfigureAccessView.SeraTuAsistente.title", fallback: "Seré tu asistente para ofrecer las mejores recomendaciones.") }
    }
  }
  internal enum ConfirmMailView {
    /// Ir al correo
    internal static var button: String { return L10n.tr("Localizable", "ConfirmMailView.button", fallback: "Ir al correo") }
    /// Tu cuenta se registró con éxito.
    /// Te hemos enviado un correo para confirmar tu cuenta
    internal static var title: String { return L10n.tr("Localizable", "ConfirmMailView.title", fallback: "Tu cuenta se registró con éxito.\nTe hemos enviado un correo para confirmar tu cuenta") }
  }
  internal enum CryptoDetailsView {
    /// Balance
    internal static var balance: String { return L10n.tr("Localizable", "CryptoDetailsView.balance", fallback: "Balance") }
    /// O convertirlo en
    internal static var convertTo: String { return L10n.tr("Localizable", "CryptoDetailsView.convertTo", fallback: "O convertirlo en") }
    /// DÍA
    internal static var day: String { return L10n.tr("Localizable", "CryptoDetailsView.day", fallback: "DÍA") }
    /// Funciones
    internal static var functions: String { return L10n.tr("Localizable", "CryptoDetailsView.functions", fallback: "Funciones") }
    /// HORA
    internal static var hour: String { return L10n.tr("Localizable", "CryptoDetailsView.hour", fallback: "HORA") }
    /// Market
    internal static var market: String { return L10n.tr("Localizable", "CryptoDetailsView.market", fallback: "Market") }
    /// MES
    internal static var month: String { return L10n.tr("Localizable", "CryptoDetailsView.month", fallback: "MES") }
    /// USD
    internal static var usd: String { return L10n.tr("Localizable", "CryptoDetailsView.usd", fallback: "USD") }
    /// SEMANA
    internal static var week: String { return L10n.tr("Localizable", "CryptoDetailsView.week", fallback: "SEMANA") }
    /// AÑO
    internal static var year: String { return L10n.tr("Localizable", "CryptoDetailsView.year", fallback: "AÑO") }
  }
  internal enum CryptoTabView {
    /// Actividad
    internal static var activity: String { return L10n.tr("Localizable", "CryptoTabView.activity", fallback: "Actividad") }
    /// Ver más
    internal static var seeMore: String { return L10n.tr("Localizable", "CryptoTabView.seeMore", fallback: "Ver más") }
  }
  internal enum CryptoTabViewModel {
    /// Ganancia Crypto PI
    internal static var cryptoGainPi: String { return L10n.tr("Localizable", "CryptoTabViewModel.cryptoGainPi", fallback: "Ganancia Crypto PI") }
    /// Drone
    internal static var drone: String { return L10n.tr("Localizable", "CryptoTabViewModel.drone", fallback: "Drone") }
    /// IOT
    internal static var iot: String { return L10n.tr("Localizable", "CryptoTabViewModel.iot", fallback: "IOT") }
    /// PI network
    internal static var piNetwork: String { return L10n.tr("Localizable", "CryptoTabViewModel.piNetwork", fallback: "PI network") }
    /// RECAMER Coin
    internal static var recamerCoin: String { return L10n.tr("Localizable", "CryptoTabViewModel.recamerCoin", fallback: "RECAMER Coin") }
    /// Street Cam
    internal static var streetCam: String { return L10n.tr("Localizable", "CryptoTabViewModel.streetCam", fallback: "Street Cam") }
  }
  internal enum DPrintOnboardingView {
    internal enum DescripcionHazElPedido {
      /// Elige la forma de envío más adecuada para ti.
      /// 
      /// Disfruta de nuestro envio VIP, envíos frecuentes y mucho más.
      internal static var title: String { return L10n.tr("Localizable", "DPrintOnboardingView.DescripcionHazElPedido.title", fallback: "Elige la forma de envío más adecuada para ti.\n\nDisfruta de nuestro envio VIP, envíos frecuentes y mucho más.") }
    }
    internal enum DescripcionPreparaArchivo {
      /// Una vez escaneado, puedes editar el color y el tamaño.
      /// 
      /// Elegir el material y el acabado del objeto antes de enviarlo a imprimir en 3D.
      internal static var title: String { return L10n.tr("Localizable", "DPrintOnboardingView.DescripcionPreparaArchivo.title", fallback: "Una vez escaneado, puedes editar el color y el tamaño.\n\nElegir el material y el acabado del objeto antes de enviarlo a imprimir en 3D.") }
    }
    internal enum HazElPedido {
      /// Haz el pedido
      internal static var title: String { return L10n.tr("Localizable", "DPrintOnboardingView.HazElPedido.title", fallback: "Haz el pedido") }
    }
    internal enum PreparaTuArchivo3D {
      /// Prepara tu archivo 3D
      internal static var title: String { return L10n.tr("Localizable", "DPrintOnboardingView.PreparaTuArchivo3D.title", fallback: "Prepara tu archivo 3D") }
    }
    internal enum SolicitarImpresion3D {
      /// Solicitar impresión 3D
      internal static var title: String { return L10n.tr("Localizable", "DPrintOnboardingView.SolicitarImpresion3D.title", fallback: "Solicitar impresión 3D") }
    }
  }
  internal enum DigitalTwinsMenuView {
    /// Ingresar código
    internal static var codePlaceholder: String { return L10n.tr("Localizable", "DigitalTwinsMenuView.codePlaceholder", fallback: "Ingresar código") }
    /// Unirme
    internal static var joinButton: String { return L10n.tr("Localizable", "DigitalTwinsMenuView.joinButton", fallback: "Unirme") }
    /// Ingresa el código que has recebido.
    internal static var joinDescription: String { return L10n.tr("Localizable", "DigitalTwinsMenuView.joinDescription", fallback: "Ingresa el código que has recebido.") }
    /// RESERVAR
    internal static var reserve: String { return L10n.tr("Localizable", "DigitalTwinsMenuView.reserve", fallback: "RESERVAR") }
    /// Reservar
    internal static var reserveButton: String { return L10n.tr("Localizable", "DigitalTwinsMenuView.reserveButton", fallback: "Reservar") }
    /// Programa tu WalkCamer con anterioridad.
    internal static var reserveDescription: String { return L10n.tr("Localizable", "DigitalTwinsMenuView.reserveDescription", fallback: "Programa tu WalkCamer con anterioridad.") }
    /// BUSCAR
    internal static var search: String { return L10n.tr("Localizable", "DigitalTwinsMenuView.search", fallback: "BUSCAR") }
    /// Buscar
    internal static var searchButton: String { return L10n.tr("Localizable", "DigitalTwinsMenuView.searchButton", fallback: "Buscar") }
    /// Localiza tu WalkCamer más cercano.
    internal static var searchDescription: String { return L10n.tr("Localizable", "DigitalTwinsMenuView.searchDescription", fallback: "Localiza tu WalkCamer más cercano.") }
    /// Digital Twins
    internal static var title: String { return L10n.tr("Localizable", "DigitalTwinsMenuView.title", fallback: "Digital Twins") }
  }
  internal enum DigitalTwinsOnboardingView {
    /// Representación virtual de un objeto o sistema que abarca su ciclo de vida, se actualiza a partir de datos en tiempo real y utiliza simulación, machine learning y razonamiento para ayudar en la toma de decisiones.
    internal static var description1: String { return L10n.tr("Localizable", "DigitalTwinsOnboardingView.description1", fallback: "Representación virtual de un objeto o sistema que abarca su ciclo de vida, se actualiza a partir de datos en tiempo real y utiliza simulación, machine learning y razonamiento para ayudar en la toma de decisiones.") }
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static var description2: String { return L10n.tr("Localizable", "DigitalTwinsOnboardingView.description2", fallback: "Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.") }
    /// Comenzar
    internal static var start: String { return L10n.tr("Localizable", "DigitalTwinsOnboardingView.start", fallback: "Comenzar") }
    /// Digital Twins
    internal static var title: String { return L10n.tr("Localizable", "DigitalTwinsOnboardingView.title", fallback: "Digital Twins") }
  }
  internal enum DroneMenuView {
    internal enum FotosYVideos {
      /// Fotos y Videos
      internal static var title: String { return L10n.tr("Localizable", "DroneMenuView.FotosYVideos.title", fallback: "Fotos y Videos") }
    }
    internal enum GestionAgricola {
      /// Gestión Agrícola
      internal static var title: String { return L10n.tr("Localizable", "DroneMenuView.GestionAgricola.title", fallback: "Gestión Agrícola") }
    }
    internal enum LIDARMapeoLaser {
      /// LIDAR - Mapeo Laser
      internal static var title: String { return L10n.tr("Localizable", "DroneMenuView.LIDARMapeoLaser.title", fallback: "LIDAR - Mapeo Laser") }
    }
    internal enum ServiciosDrone {
      /// Servicios Drone
      internal static var title: String { return L10n.tr("Localizable", "DroneMenuView.ServiciosDrone.title", fallback: "Servicios Drone") }
    }
  }
  internal enum DroneOnboardingView {
    internal enum AceptoTerminosYCondiciones {
      /// Acepto términos y condiciones
      internal static var title: String { return L10n.tr("Localizable", "DroneOnboardingView.AceptoTerminosYCondiciones.title", fallback: "Acepto términos y condiciones") }
    }
    internal enum Cancelar {
      /// Cancelar
      internal static var title: String { return L10n.tr("Localizable", "DroneOnboardingView.Cancelar.title", fallback: "Cancelar") }
    }
    internal enum ConsideracionesBasicas {
      /// No se permite volar a mas de 110 m de altura
      internal static var description: String { return L10n.tr("Localizable", "DroneOnboardingView.ConsideracionesBasicas.description", fallback: "No se permite volar a mas de 110 m de altura") }
      /// Mantendremos la distancia legalmente regulada con áreas pobladas
      internal static var secondDescription1: String { return L10n.tr("Localizable", "DroneOnboardingView.ConsideracionesBasicas.secondDescription1", fallback: "Mantendremos la distancia legalmente regulada con áreas pobladas") }
      /// No está permitido el vuelvo en áreas restringidas.
      internal static var secondDescription2: String { return L10n.tr("Localizable", "DroneOnboardingView.ConsideracionesBasicas.secondDescription2", fallback: "No está permitido el vuelvo en áreas restringidas.") }
      /// Si se requiere plan de vuelo, se coordinará con anticipación y con la autoridad aeronautica.
      internal static var secondDescription3: String { return L10n.tr("Localizable", "DroneOnboardingView.ConsideracionesBasicas.secondDescription3", fallback: "Si se requiere plan de vuelo, se coordinará con anticipación y con la autoridad aeronautica.") }
      /// Consideraciones básicas
      internal static var title: String { return L10n.tr("Localizable", "DroneOnboardingView.ConsideracionesBasicas.title", fallback: "Consideraciones básicas") }
    }
    internal enum GrabaADistancia {
      /// Tu eliges donde grabar tus videos y/o capturar imágenes 
      /// 
      /// Nosotros pilotamos por ti.
      /// 
      /// Contamos con profesionales acreditados y con expeciencia tu WalkCamer te guiará.
      internal static var description: String { return L10n.tr("Localizable", "DroneOnboardingView.GrabaADistancia.description", fallback: "Tu eliges donde grabar tus videos y/o capturar imágenes \n\nNosotros pilotamos por ti.\n\nContamos con profesionales acreditados y con expeciencia tu WalkCamer te guiará.") }
      /// Graba a distancia
      internal static var title: String { return L10n.tr("Localizable", "DroneOnboardingView.GrabaADistancia.title", fallback: "Graba a distancia") }
    }
  }
  internal enum ExternalAssistantView {
    internal enum Codigo {
      /// Código
      internal static var title: String { return L10n.tr("Localizable", "ExternalAssistantView.Codigo.title", fallback: "Código") }
    }
    internal enum IngresaElCodigo {
      /// **Ingresa el código** que te ha enviado tu asistente para poder ser asistido.
      internal static var title: String { return L10n.tr("Localizable", "ExternalAssistantView.IngresaElCodigo.title", fallback: "**Ingresa el código** que te ha enviado tu asistente para poder ser asistido.") }
    }
    internal enum IngresarCodigo {
      /// Ingresa el código
      internal static var placeholder: String { return L10n.tr("Localizable", "ExternalAssistantView.IngresarCodigo.placeholder", fallback: "Ingresa el código") }
    }
    internal enum RecibeAsistencia {
      /// Recibe asistencia desde cualquier lugar
      internal static var title: String { return L10n.tr("Localizable", "ExternalAssistantView.RecibeAsistencia.title", fallback: "Recibe asistencia desde cualquier lugar") }
    }
    internal enum Unirme {
      /// Unirme
      internal static var title: String { return L10n.tr("Localizable", "ExternalAssistantView.Unirme.title", fallback: "Unirme") }
    }
  }
  internal enum FeatureInformationView {
    /// Cancelar
    internal static var cancel: String { return L10n.tr("Localizable", "FeatureInformationView.cancel", fallback: "Cancelar") }
    /// Siguiente
    internal static var next: String { return L10n.tr("Localizable", "FeatureInformationView.next", fallback: "Siguiente") }
    internal enum Deepness {
      /// Capacidad en metros de profundidad en buceo.
      internal static var depthCapacity: String { return L10n.tr("Localizable", "FeatureInformationView.deepness.depthCapacity", fallback: "Capacidad en metros de profundidad en buceo.") }
      /// Subir permiso de buceo
      internal static var uploadDivingPermit: String { return L10n.tr("Localizable", "FeatureInformationView.deepness.uploadDivingPermit", fallback: "Subir permiso de buceo") }
    }
    internal enum Description {
      /// Sube tus Licencias y Permisos relacionados a tus dispositivos y capacidades.
      internal static var uploadLicenses: String { return L10n.tr("Localizable", "FeatureInformationView.description.uploadLicenses", fallback: "Sube tus Licencias y Permisos relacionados a tus dispositivos y capacidades.") }
    }
    internal enum Header {
      /// Completa la información
      internal static var completeInformation: String { return L10n.tr("Localizable", "FeatureInformationView.header.completeInformation", fallback: "Completa la información") }
    }
    internal enum Rov {
      /// Agregar otro ROV Submarino
      internal static var addAnother: String { return L10n.tr("Localizable", "FeatureInformationView.rov.addAnother", fallback: "Agregar otro ROV Submarino") }
      /// Licencia y/o Permisos
      internal static var licenseAndPermissions: String { return L10n.tr("Localizable", "FeatureInformationView.rov.licenseAndPermissions", fallback: "Licencia y/o Permisos") }
      /// Modelo
      internal static var model: String { return L10n.tr("Localizable", "FeatureInformationView.rov.model", fallback: "Modelo") }
      /// Si tu modelo no aparece, no es un dispositivo admitido por WalkyCam
      internal static var modelNotSupported: String { return L10n.tr("Localizable", "FeatureInformationView.rov.modelNotSupported", fallback: "Si tu modelo no aparece, no es un dispositivo admitido por WalkyCam") }
      /// Nombre comercial
      internal static var name: String { return L10n.tr("Localizable", "FeatureInformationView.rov.name", fallback: "Nombre comercial") }
      /// N de serie
      internal static var serialNumber: String { return L10n.tr("Localizable", "FeatureInformationView.rov.serialNumber", fallback: "N de serie") }
      /// ROV Submarino
      internal static var title: String { return L10n.tr("Localizable", "FeatureInformationView.rov.title", fallback: "ROV Submarino") }
      /// Subir licensas
      internal static var uploadLicenses: String { return L10n.tr("Localizable", "FeatureInformationView.rov.uploadLicenses", fallback: "Subir licensas") }
    }
    internal enum Smartphone {
      /// Agregar otro Smartphone
      internal static var addAnother: String { return L10n.tr("Localizable", "FeatureInformationView.smartphone.addAnother", fallback: "Agregar otro Smartphone") }
      /// Modelo
      internal static var model: String { return L10n.tr("Localizable", "FeatureInformationView.smartphone.model", fallback: "Modelo") }
      /// Nombre comercial
      internal static var name: String { return L10n.tr("Localizable", "FeatureInformationView.smartphone.name", fallback: "Nombre comercial") }
      /// N de serie
      internal static var serialNumber: String { return L10n.tr("Localizable", "FeatureInformationView.smartphone.serialNumber", fallback: "N de serie") }
      /// Móvil/Smartphone
      internal static var title: String { return L10n.tr("Localizable", "FeatureInformationView.smartphone.title", fallback: "Móvil/Smartphone") }
    }
    internal enum Vehicle {
      /// Con qué vehículo propio cuentas?
      internal static var question: String { return L10n.tr("Localizable", "FeatureInformationView.vehicle.question", fallback: "Con qué vehículo propio cuentas?") }
      /// Subir licencia de conducir
      internal static var uploadDrivingLicense: String { return L10n.tr("Localizable", "FeatureInformationView.vehicle.uploadDrivingLicense", fallback: "Subir licencia de conducir") }
    }
  }
  internal enum FeatureSelectionView {
    /// Capacidades
    internal static var abilities: String { return L10n.tr("Localizable", "FeatureSelectionView.abilities", fallback: "Capacidades") }
    /// Cancelar
    internal static var cancel: String { return L10n.tr("Localizable", "FeatureSelectionView.cancel", fallback: "Cancelar") }
    /// Dispositivos
    internal static var devices: String { return L10n.tr("Localizable", "FeatureSelectionView.devices", fallback: "Dispositivos") }
    /// Siguiente
    internal static var next: String { return L10n.tr("Localizable", "FeatureSelectionView.next", fallback: "Siguiente") }
    /// Selecciona tus dispositivos y capacidades
    internal static var title: String { return L10n.tr("Localizable", "FeatureSelectionView.title", fallback: "Selecciona tus dispositivos y capacidades") }
    /// Ver %@
    internal static func viewMore(_ p1: Any) -> String {
      return L10n.tr("Localizable", "FeatureSelectionView.viewMore", String(describing: p1), fallback: "Ver %@")
    }
  }
  internal enum FeatureSelectionViewModel {
    internal enum AbilitiesModel {
      /// Impresiones 3D
      internal static var _3dprint: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.abilitiesModel.3dprint", fallback: "Impresiones 3D") }
      /// Actuar (animador de fiestas)
      internal static var acting: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.abilitiesModel.acting", fallback: "Actuar (animador de fiestas)") }
      /// Buceo
      internal static var dive: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.abilitiesModel.dive", fallback: "Buceo") }
      /// Trabajo en altura
      internal static var highWork: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.abilitiesModel.highWork", fallback: "Trabajo en altura") }
      /// Escaneo LIDAR
      internal static var lidar: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.abilitiesModel.lidar", fallback: "Escaneo LIDAR") }
      /// Hablar en público
      internal static var publicTalking: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.abilitiesModel.publicTalking", fallback: "Hablar en público") }
      /// Escaneo 3D
      internal static var scan3d: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.abilitiesModel.scan3d", fallback: "Escaneo 3D") }
      /// Fotografía submarina
      internal static var subPhoto: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.abilitiesModel.subPhoto", fallback: "Fotografía submarina") }
      /// Cuento con vehículo propio
      internal static var vehicle: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.abilitiesModel.vehicle", fallback: "Cuento con vehículo propio") }
    }
    internal enum DevicesModel {
      /// Test alcohol y drogas
      internal static var alcoholTest: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.alcoholTest", fallback: "Test alcohol y drogas") }
      /// Detector de cables
      internal static var cableDetector: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.cableDetector", fallback: "Detector de cables") }
      /// Cámara 360º
      internal static var camera360: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.camera360", fallback: "Cámara 360º") }
      /// Drone
      internal static var drone: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.drone", fallback: "Drone") }
      /// LIDAR
      internal static var lidar: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.lidar", fallback: "LIDAR") }
      /// Detector de metales
      internal static var metalDetector: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.metalDetector", fallback: "Detector de metales") }
      /// Analizador de redes electricas
      internal static var networkAnalyzer: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.networkAnalyzer", fallback: "Analizador de redes electricas") }
      /// Sin dispositivo
      internal static var noDevice: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.noDevice", fallback: "Sin dispositivo") }
      /// 3D Printer
      internal static var printer3D: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.printer3D", fallback: "3D Printer") }
      /// Robot Dog
      internal static var robotDog: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.robotDog", fallback: "Robot Dog") }
      /// ROV Submarino
      internal static var rov: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.rov", fallback: "ROV Submarino") }
      /// Escaner 3D
      internal static var scan3D: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.scan3D", fallback: "Escaner 3D") }
      /// Móvil/Smartphone
      internal static var smartphone: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.smartphone", fallback: "Móvil/Smartphone") }
      /// Camara termografica
      internal static var thermalCamera: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.thermalCamera", fallback: "Camara termografica") }
      /// Videocámara
      internal static var videocamera: String { return L10n.tr("Localizable", "FeatureSelectionViewModel.devicesModel.videocamera", fallback: "Videocámara") }
    }
  }
  internal enum FlightMenuView {
    internal enum Buscar {
      /// BUSCAR
      internal static var title: String { return L10n.tr("Localizable", "FlightMenuView.Buscar.title", fallback: "BUSCAR") }
    }
    internal enum IngresaElCodigo {
      /// Ingresa el código que has recebido.
      internal static var title: String { return L10n.tr("Localizable", "FlightMenuView.IngresaElCodigo.title", fallback: "Ingresa el código que has recebido.") }
    }
    internal enum IngresarCodigo {
      /// Ingresar código
      internal static var placeholder: String { return L10n.tr("Localizable", "FlightMenuView.IngresarCodigo.placeholder", fallback: "Ingresar código") }
    }
    internal enum LocalizaTuPiloto {
      /// Localiza tu Piloto más cercano.
      internal static var title: String { return L10n.tr("Localizable", "FlightMenuView.LocalizaTuPiloto.title", fallback: "Localiza tu Piloto más cercano.") }
    }
    internal enum ProgramaTuVuelo {
      /// Programa tu vuelo
      internal static var title: String { return L10n.tr("Localizable", "FlightMenuView.ProgramaTuVuelo.title", fallback: "Programa tu vuelo") }
    }
    internal enum Reservar {
      /// RESERVAR
      internal static var title: String { return L10n.tr("Localizable", "FlightMenuView.Reservar.title", fallback: "RESERVAR") }
    }
    internal enum Unirme {
      /// Unirme
      internal static var title: String { return L10n.tr("Localizable", "FlightMenuView.Unirme.title", fallback: "Unirme") }
    }
  }
  internal enum Formater {
    /// es_ES
    internal static var locale: String { return L10n.tr("Localizable", "Formater.locale", fallback: "es_ES") }
  }
  internal enum FunctionMenuView {
    internal enum Buscar {
      /// Localiza tu WalkCamer más cercano.
      internal static var description: String { return L10n.tr("Localizable", "FunctionMenuView.Buscar.description", fallback: "Localiza tu WalkCamer más cercano.") }
      /// BUSCAR
      internal static var title: String { return L10n.tr("Localizable", "FunctionMenuView.Buscar.title", fallback: "BUSCAR") }
    }
    internal enum IngresaElCodigo {
      /// Ingresa el código que has recebido.
      internal static var title: String { return L10n.tr("Localizable", "FunctionMenuView.IngresaElCodigo.title", fallback: "Ingresa el código que has recebido.") }
    }
    internal enum Reservar {
      /// Programa tu WalkCamer con anterioridad.
      internal static var description: String { return L10n.tr("Localizable", "FunctionMenuView.Reservar.description", fallback: "Programa tu WalkCamer con anterioridad.") }
      /// RESERVAR
      internal static var title: String { return L10n.tr("Localizable", "FunctionMenuView.Reservar.title", fallback: "RESERVAR") }
    }
    internal enum Unirme {
      /// Unirme
      internal static var title: String { return L10n.tr("Localizable", "FunctionMenuView.Unirme.title", fallback: "Unirme") }
    }
    internal enum Unirse {
      /// UNIRSE
      internal static var title: String { return L10n.tr("Localizable", "FunctionMenuView.Unirse.title", fallback: "UNIRSE") }
    }
  }
  internal enum FunctionsView {
    internal enum Function {
      /// AI & Data Analysis
      internal static var ai: String { return L10n.tr("Localizable", "FunctionsView.function.ai", fallback: "AI & Data Analysis") }
      /// AR Hands
      internal static var arHands: String { return L10n.tr("Localizable", "FunctionsView.function.arHands", fallback: "AR Hands") }
      /// Cam 360º
      internal static var cam360: String { return L10n.tr("Localizable", "FunctionsView.function.cam360", fallback: "Cam 360º") }
      /// Certified Recording
      internal static var certifiedRecording: String { return L10n.tr("Localizable", "FunctionsView.function.certifiedRecording", fallback: "Certified Recording") }
      /// Link to CRM/ERP
      internal static var crm: String { return L10n.tr("Localizable", "FunctionsView.function.crm", fallback: "Link to CRM/ERP") }
      /// Crypto Wallet
      internal static var cryptoWallet: String { return L10n.tr("Localizable", "FunctionsView.function.cryptoWallet", fallback: "Crypto Wallet") }
      /// Detector de Cables Enterrados
      internal static var detector: String { return L10n.tr("Localizable", "FunctionsView.function.detector", fallback: "Detector de Cables Enterrados") }
      /// Digital Twins
      internal static var digitalTwins: String { return L10n.tr("Localizable", "FunctionsView.function.digitalTwins", fallback: "Digital Twins") }
      /// Dog Robot
      internal static var dogRobot: String { return L10n.tr("Localizable", "FunctionsView.function.dogRobot", fallback: "Dog Robot") }
      /// Drone Fly
      internal static var droneFly: String { return L10n.tr("Localizable", "FunctionsView.function.droneFly", fallback: "Drone Fly") }
      /// Alcohol & Drug test
      internal static var drugTest: String { return L10n.tr("Localizable", "FunctionsView.function.drugTest", fallback: "Alcohol & Drug test") }
      /// Ecografía
      internal static var ecografia: String { return L10n.tr("Localizable", "FunctionsView.function.ecografia", fallback: "Ecografía") }
      /// Engineering (Consulting only)
      internal static var engineering: String { return L10n.tr("Localizable", "FunctionsView.function.engineering", fallback: "Engineering (Consulting only)") }
      /// Games
      internal static var games: String { return L10n.tr("Localizable", "FunctionsView.function.games", fallback: "Games") }
      /// Georadar (GPR)
      internal static var georadar: String { return L10n.tr("Localizable", "FunctionsView.function.georadar", fallback: "Georadar (GPR)") }
      /// IOT applications & Data Analysis
      internal static var iot: String { return L10n.tr("Localizable", "FunctionsView.function.iot", fallback: "IOT applications & Data Analysis") }
      /// Lawyer (Consulting only)
      internal static var lawConsulting: String { return L10n.tr("Localizable", "FunctionsView.function.lawConsulting", fallback: "Lawyer (Consulting only)") }
      /// LIDAR Scan
      internal static var lidar: String { return L10n.tr("Localizable", "FunctionsView.function.lidar", fallback: "LIDAR Scan") }
      /// Robótica para Mascotas
      internal static var mascotRobot: String { return L10n.tr("Localizable", "FunctionsView.function.mascotRobot", fallback: "Robótica para Mascotas") }
      /// Detector de metales
      internal static var metalDetector: String { return L10n.tr("Localizable", "FunctionsView.function.metalDetector", fallback: "Detector de metales") }
      /// Analizador de Redes Eléctricas
      internal static var networkAnalysis: String { return L10n.tr("Localizable", "FunctionsView.function.networkAnalysis", fallback: "Analizador de Redes Eléctricas") }
      /// NFT platform
      internal static var nft: String { return L10n.tr("Localizable", "FunctionsView.function.nft", fallback: "NFT platform") }
      /// Play & Business
      internal static var playBusiness: String { return L10n.tr("Localizable", "FunctionsView.function.playBusiness", fallback: "Play & Business") }
      /// 3D Printer
      internal static var printer3D: String { return L10n.tr("Localizable", "FunctionsView.function.printer3D", fallback: "3D Printer") }
      /// Radar & Sensors
      internal static var radar: String { return L10n.tr("Localizable", "FunctionsView.function.radar", fallback: "Radar & Sensors") }
      /// Robótica
      internal static var robot: String { return L10n.tr("Localizable", "FunctionsView.function.robot", fallback: "Robótica") }
      /// R.O.V. Underwater Drone
      internal static var rov: String { return L10n.tr("Localizable", "FunctionsView.function.rov", fallback: "R.O.V. Underwater Drone") }
      /// Gestión Agrícola
      internal static var ruralDrone: String { return L10n.tr("Localizable", "FunctionsView.function.ruralDrone", fallback: "Gestión Agrícola") }
      /// Scan 3D
      internal static var scan3D: String { return L10n.tr("Localizable", "FunctionsView.function.scan3D", fallback: "Scan 3D") }
      /// Backpack Screen Advertising
      internal static var screenAd: String { return L10n.tr("Localizable", "FunctionsView.function.screenAd", fallback: "Backpack Screen Advertising") }
      /// Street Cam
      internal static var streetCam: String { return L10n.tr("Localizable", "FunctionsView.function.streetCam", fallback: "Street Cam") }
      /// Robótica Telepresecia
      internal static var telepresenceRobot: String { return L10n.tr("Localizable", "FunctionsView.function.telepresenceRobot", fallback: "Robótica Telepresecia") }
      /// Thermal Camera
      internal static var thermalCamera: String { return L10n.tr("Localizable", "FunctionsView.function.thermalCamera", fallback: "Thermal Camera") }
      /// Video Call
      internal static var videoCall: String { return L10n.tr("Localizable", "FunctionsView.function.videoCall", fallback: "Video Call") }
    }
    internal enum Header {
      /// Todo lo que puedes hacer!
      internal static var title: String { return L10n.tr("Localizable", "FunctionsView.header.title", fallback: "Todo lo que puedes hacer!") }
    }
    internal enum Section {
      /// Básicas
      internal static var basic: String { return L10n.tr("Localizable", "FunctionsView.section.basic", fallback: "Básicas") }
      /// Descubre más
      internal static var discoverMore: String { return L10n.tr("Localizable", "FunctionsView.section.discoverMore", fallback: "Descubre más") }
    }
  }
  internal enum FunctionsViewModel {
    internal enum Function {
      /// AI & Data Analysis
      internal static var ai: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.ai", fallback: "AI & Data Analysis") }
      /// AR Hands
      internal static var arHands: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.arHands", fallback: "AR Hands") }
      /// Detector de Cables Enterrados
      internal static var cableDetector: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.cableDetector", fallback: "Detector de Cables Enterrados") }
      /// Cam 360º
      internal static var cam360: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.cam360", fallback: "Cam 360º") }
      /// Certified Recording
      internal static var certifiedRecording: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.certifiedRecording", fallback: "Certified Recording") }
      /// Link to CRM/ERP
      internal static var crm: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.crm", fallback: "Link to CRM/ERP") }
      /// Crypto Wallet
      internal static var cryptoWallet: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.cryptoWallet", fallback: "Crypto Wallet") }
      /// Digital Twins
      internal static var digitalTwins: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.digitalTwins", fallback: "Digital Twins") }
      /// Dog Robot
      internal static var dogRobot: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.dogRobot", fallback: "Dog Robot") }
      /// Drone Fly
      internal static var droneFly: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.droneFly", fallback: "Drone Fly") }
      /// Alcohol & Drug test
      internal static var drugTest: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.drugTest", fallback: "Alcohol & Drug test") }
      /// Ecografía
      internal static var ecografia: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.ecografia", fallback: "Ecografía") }
      /// Engineering (Consulting only)
      internal static var engineering: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.engineering", fallback: "Engineering (Consulting only)") }
      /// Games
      internal static var games: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.games", fallback: "Games") }
      /// Georadar (GPR)
      internal static var georadar: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.georadar", fallback: "Georadar (GPR)") }
      /// IOT applications & Data Analysis
      internal static var iot: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.iot", fallback: "IOT applications & Data Analysis") }
      /// Lawyer (Consulting only)
      internal static var lawConsulting: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.lawConsulting", fallback: "Lawyer (Consulting only)") }
      /// LIDAR Scan
      internal static var lidar: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.lidar", fallback: "LIDAR Scan") }
      /// Robótica para Mascotas
      internal static var mascotRobot: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.mascotRobot", fallback: "Robótica para Mascotas") }
      /// Detector de metales
      internal static var metalDetector: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.metalDetector", fallback: "Detector de metales") }
      /// Analizador de Redes Eléctricas
      internal static var networkAnalyzer: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.networkAnalyzer", fallback: "Analizador de Redes Eléctricas") }
      /// NFT platform
      internal static var nft: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.nft", fallback: "NFT platform") }
      /// Play & Business
      internal static var playBusiness: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.playBusiness", fallback: "Play & Business") }
      /// 3D Printer
      internal static var printer3D: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.printer3D", fallback: "3D Printer") }
      /// Radar & Sensors
      internal static var radar: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.radar", fallback: "Radar & Sensors") }
      /// Robótica
      internal static var robot: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.robot", fallback: "Robótica") }
      /// R.O.V. Underwater Drone
      internal static var rov: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.rov", fallback: "R.O.V. Underwater Drone") }
      /// Gestión Agrícola
      internal static var ruralDrone: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.ruralDrone", fallback: "Gestión Agrícola") }
      /// Scan 3D
      internal static var scan3D: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.scan3D", fallback: "Scan 3D") }
      /// Backpack Screen Advertising
      internal static var screenAd: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.screenAd", fallback: "Backpack Screen Advertising") }
      /// Street Cam
      internal static var streetCam: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.streetCam", fallback: "Street Cam") }
      /// Robótica Telepresecia
      internal static var telepresenceRobot: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.telepresenceRobot", fallback: "Robótica Telepresecia") }
      /// Thermal Camera
      internal static var thermalCamera: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.thermalCamera", fallback: "Thermal Camera") }
      /// Video Call
      internal static var videoCall: String { return L10n.tr("Localizable", "FunctionsViewModel.Function.videoCall", fallback: "Video Call") }
    }
  }
  internal enum GalleryItems {
    internal enum Image {
      internal enum Empty {
        /// No hay imágenes
        internal static var title: String { return L10n.tr("Localizable", "GalleryItems.image.empty.title", fallback: "No hay imágenes") }
      }
    }
    internal enum Model {
      internal enum Empty {
        /// No hay modelos
        internal static var title: String { return L10n.tr("Localizable", "GalleryItems.model.empty.title", fallback: "No hay modelos") }
      }
    }
  }
  internal enum GalleryView {
    /// Galería
    internal static var title: String { return L10n.tr("Localizable", "GalleryView.title", fallback: "Galería") }
  }
  internal enum GalleryViewModel {
    internal enum Tab {
      /// Archivos
      internal static var files: String { return L10n.tr("Localizable", "GalleryViewModel.Tab.files", fallback: "Archivos") }
      /// Fotos
      internal static var photos: String { return L10n.tr("Localizable", "GalleryViewModel.Tab.photos", fallback: "Fotos") }
      /// Videos
      internal static var videos: String { return L10n.tr("Localizable", "GalleryViewModel.Tab.videos", fallback: "Videos") }
    }
  }
  internal enum GamesView {
    /// Dress Prove
    internal static var dressProve: String { return L10n.tr("Localizable", "GamesView.dressProve", fallback: "Dress Prove") }
    /// Games
    internal static var games: String { return L10n.tr("Localizable", "GamesView.games", fallback: "Games") }
    /// Glasses Prove
    internal static var glassesProve: String { return L10n.tr("Localizable", "GamesView.glassesProve", fallback: "Glasses Prove") }
    /// Hair Prove
    internal static var hairProve: String { return L10n.tr("Localizable", "GamesView.hairProve", fallback: "Hair Prove") }
    /// Karaoke
    internal static var karaoke: String { return L10n.tr("Localizable", "GamesView.karaoke", fallback: "Karaoke") }
    /// RGB Bulb Party
    internal static var rgbBulbParty: String { return L10n.tr("Localizable", "GamesView.rgbBulbParty", fallback: "RGB Bulb Party") }
    /// Games
    internal static var title: String { return L10n.tr("Localizable", "GamesView.title", fallback: "Games") }
  }
  internal enum HomeView {
    internal enum Favorites {
      /// Favoritos
      internal static var title: String { return L10n.tr("Localizable", "HomeView.favorites.title", fallback: "Favoritos") }
    }
    internal enum Files {
      /// Galeria de archivos
      internal static var title: String { return L10n.tr("Localizable", "HomeView.files.title", fallback: "Galeria de archivos") }
    }
    internal enum News {
      /// Novedades
      internal static var title: String { return L10n.tr("Localizable", "HomeView.news.title", fallback: "Novedades") }
    }
    internal enum Profile {
      /// Hola %@!
      internal static func hello(_ p1: Any) -> String {
        return L10n.tr("Localizable", "HomeView.profile.hello", String(describing: p1), fallback: "Hola %@!")
      }
    }
    internal enum RecentFunctions {
      /// Recientes
      internal static var title: String { return L10n.tr("Localizable", "HomeView.recentFunctions.title", fallback: "Recientes") }
    }
    internal enum Reminders {
      /// Recordatorios
      internal static var title: String { return L10n.tr("Localizable", "HomeView.reminders.title", fallback: "Recordatorios") }
    }
    internal enum Section {
      /// Ver más
      internal static var seeMore: String { return L10n.tr("Localizable", "HomeView.section.seeMore", fallback: "Ver más") }
    }
  }
  internal enum HomeViewModel {
    internal enum Favorites {
      internal enum Bogota {
        /// Bogotá, Colombia
        internal static var location: String { return L10n.tr("Localizable", "HomeViewModel.favorites.bogota.location", fallback: "Bogotá, Colombia") }
      }
      internal enum Camila {
        /// Camila Cabello
        internal static var name: String { return L10n.tr("Localizable", "HomeViewModel.favorites.camila.name", fallback: "Camila Cabello") }
      }
      internal enum Cdmx {
        /// CDMX, México
        internal static var location: String { return L10n.tr("Localizable", "HomeViewModel.favorites.cdmx.location", fallback: "CDMX, México") }
      }
      internal enum Diego {
        /// Diego Salas
        internal static var name: String { return L10n.tr("Localizable", "HomeViewModel.favorites.diego.name", fallback: "Diego Salas") }
      }
      internal enum Lali {
        /// Lali Espósito
        internal static var name: String { return L10n.tr("Localizable", "HomeViewModel.favorites.lali.name", fallback: "Lali Espósito") }
      }
      internal enum MarDelPlata {
        /// Mar del Plata, Argentina
        internal static var location: String { return L10n.tr("Localizable", "HomeViewModel.favorites.marDelPlata.location", fallback: "Mar del Plata, Argentina") }
      }
      internal enum Thiago {
        /// Thiago Guirao
        internal static var name: String { return L10n.tr("Localizable", "HomeViewModel.favorites.thiago.name", fallback: "Thiago Guirao") }
      }
    }
    internal enum Files {
      internal enum Drone {
        /// Mis videos Drone
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.files.drone.title", fallback: "Mis videos Drone") }
      }
      internal enum Iot {
        /// Mis servicios IOT
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.files.iot.title", fallback: "Mis servicios IOT") }
      }
      internal enum Scan3D {
        /// Mis escaneos 3D
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.files.scan3D.title", fallback: "Mis escaneos 3D") }
      }
      internal enum WalkCamer {
        /// Mis videos WalkCamer
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.files.walkCamer.title", fallback: "Mis videos WalkCamer") }
      }
    }
    internal enum News {
      internal enum Drone {
        /// Recuerda que tu plan de vuelo es solo para Cajamarca. Caduca hoy a las 20:00 h.
        internal static var description: String { return L10n.tr("Localizable", "HomeViewModel.news.drone.description", fallback: "Recuerda que tu plan de vuelo es solo para Cajamarca. Caduca hoy a las 20:00 h.") }
      }
      internal enum Iot {
        /// Debes calibrar los sensores regularmente.
        internal static var description: String { return L10n.tr("Localizable", "HomeViewModel.news.iot.description", fallback: "Debes calibrar los sensores regularmente.") }
        /// WALKY te ayuda con tu IOT
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.news.iot.title", fallback: "WALKY te ayuda con tu IOT") }
      }
      internal enum Sap {
        /// Tienes las credenciales caducadas.
        internal static var description: String { return L10n.tr("Localizable", "HomeViewModel.news.sap.description", fallback: "Tienes las credenciales caducadas.") }
        /// Falló tu conexión con SAP
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.news.sap.title", fallback: "Falló tu conexión con SAP") }
      }
    }
    internal enum RecentFunctions {
      internal enum ArHands {
        /// AR Hands
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.recentFunctions.arHands.title", fallback: "AR Hands") }
      }
      internal enum DroneFly {
        /// Drone Fly
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.recentFunctions.droneFly.title", fallback: "Drone Fly") }
      }
      internal enum Mas {
        /// Más
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.recentFunctions.mas.title", fallback: "Más") }
      }
      internal enum Scan3D {
        /// Scan 3D
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.recentFunctions.scan3D.title", fallback: "Scan 3D") }
      }
      internal enum StreetCam {
        /// Street Cam
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.recentFunctions.streetCam.title", fallback: "Street Cam") }
      }
      internal enum VideoCall {
        /// Video Call
        internal static var title: String { return L10n.tr("Localizable", "HomeViewModel.recentFunctions.videoCall.title", fallback: "Video Call") }
      }
    }
    internal enum Reminders {
      internal enum Camila {
        /// 30 Oct 2023 - 10:00 h.
        internal static var date: String { return L10n.tr("Localizable", "HomeViewModel.reminders.camila.date", fallback: "30 Oct 2023 - 10:00 h.") }
      }
      internal enum Hoy {
        /// Hoy - 13:00 h.
        internal static var date: String { return L10n.tr("Localizable", "HomeViewModel.reminders.hoy.date", fallback: "Hoy - 13:00 h.") }
      }
    }
  }
  internal enum IOTMenuView {
    internal enum CategoríasIOT {
      /// Categorías IOT
      internal static var title: String { return L10n.tr("Localizable", "IOTMenuView.CategoríasIOT.title", fallback: "Categorías IOT") }
    }
    internal enum ContratarNuevo {
      /// Contratar Nuevo
      internal static var title: String { return L10n.tr("Localizable", "IOTMenuView.ContratarNuevo.title", fallback: "Contratar Nuevo") }
    }
    internal enum CódigoQR {
      /// Código QR
      internal static var title: String { return L10n.tr("Localizable", "IOTMenuView.CódigoQR.title", fallback: "Código QR") }
    }
    internal enum MisServiciosContratados {
      /// Mis Servicios Contratados
      internal static var title: String { return L10n.tr("Localizable", "IOTMenuView.MisServiciosContratados.title", fallback: "Mis Servicios Contratados") }
    }
    internal enum ScanQR {
      /// Scan QR
      internal static var title: String { return L10n.tr("Localizable", "IOTMenuView.ScanQR.title", fallback: "Scan QR") }
    }
    internal enum ScanQRCode {
      /// Scanea para autenticar tu ingreso al dashboard IOT Farming
      internal static var title: String { return L10n.tr("Localizable", "IOTMenuView.ScanQRCode.title", fallback: "Scanea para autenticar tu ingreso al dashboard IOT Farming") }
    }
  }
  internal enum IOTOnboardingView {
    internal enum BuscarWalkCamer {
      /// Buscar WalkCamer
      internal static var title: String { return L10n.tr("Localizable", "IOTOnboardingView.BuscarWalkCamer.title", fallback: "Buscar WalkCamer") }
    }
    internal enum Comenzar {
      /// Comenzar
      internal static var title: String { return L10n.tr("Localizable", "IOTOnboardingView.Comenzar.title", fallback: "Comenzar") }
    }
    internal enum DescripcionBuscarWalkCamer {
      /// Localiza tu WalkCamer más cercano y gestiona tu IOT.
      internal static var title: String { return L10n.tr("Localizable", "IOTOnboardingView.DescripcionBuscarWalkCamer.title", fallback: "Localiza tu WalkCamer más cercano y gestiona tu IOT.") }
    }
    internal enum DescripcionSeleccionarCategoria {
      /// Elige entre: Farming, Industry, Agriculture, Fleet, Retail, Smart City y mucho más!
      internal static var title: String { return L10n.tr("Localizable", "IOTOnboardingView.DescripcionSeleccionarCategoria.title", fallback: "Elige entre: Farming, Industry, Agriculture, Fleet, Retail, Smart City y mucho más!") }
    }
    internal enum DescripcionSeleccionarSensores {
      /// Los sensores deberán ser seleccionados previamente, indicando su valor.
      internal static var title: String { return L10n.tr("Localizable", "IOTOnboardingView.DescripcionSeleccionarSensores.title", fallback: "Los sensores deberán ser seleccionados previamente, indicando su valor.") }
    }
    internal enum SelecionarCategoria {
      /// Selecionar Categoría IOT
      internal static var title: String { return L10n.tr("Localizable", "IOTOnboardingView.SelecionarCategoria.title", fallback: "Selecionar Categoría IOT") }
    }
    internal enum SelecionarSensores {
      /// Selecionar sensores
      internal static var title: String { return L10n.tr("Localizable", "IOTOnboardingView.SelecionarSensores.title", fallback: "Selecionar sensores") }
    }
  }
  internal enum IOTSensorsView {
    /// Cancelar
    internal static var cancel: String { return L10n.tr("Localizable", "IOTSensorsView.cancel", fallback: "Cancelar") }
    /// Título Dashboard
    internal static var dashboardTitle: String { return L10n.tr("Localizable", "IOTSensorsView.dashboardTitle", fallback: "Título Dashboard") }
    /// Buscar WalkCamer
    internal static var search: String { return L10n.tr("Localizable", "IOTSensorsView.search", fallback: "Buscar WalkCamer") }
    /// Activa los tipos de sensores e indica sus parámetros correspondientes.
    internal static var subtitle: String { return L10n.tr("Localizable", "IOTSensorsView.subtitle", fallback: "Activa los tipos de sensores e indica sus parámetros correspondientes.") }
    /// Sensores IOT Farming
    internal static var title: String { return L10n.tr("Localizable", "IOTSensorsView.title", fallback: "Sensores IOT Farming") }
    internal enum Sensors {
      /// Humedad
      internal static var humidity: String { return L10n.tr("Localizable", "IOTSensorsView.sensors.humidity", fallback: "Humedad") }
      /// Nivel
      internal static var level: String { return L10n.tr("Localizable", "IOTSensorsView.sensors.level", fallback: "Nivel") }
      /// Nº Sensores
      internal static var number: String { return L10n.tr("Localizable", "IOTSensorsView.sensors.number", fallback: "Nº Sensores") }
      /// Pensión A
      internal static var pressureA: String { return L10n.tr("Localizable", "IOTSensorsView.sensors.pressureA", fallback: "Pensión A") }
      /// Proximidad
      internal static var proximity: String { return L10n.tr("Localizable", "IOTSensorsView.sensors.proximity", fallback: "Proximidad") }
      /// Rango
      internal static var range: String { return L10n.tr("Localizable", "IOTSensorsView.sensors.range", fallback: "Rango") }
      /// Temperatura
      internal static var temperature: String { return L10n.tr("Localizable", "IOTSensorsView.sensors.temperature", fallback: "Temperatura") }
      /// Unidad
      internal static var unit: String { return L10n.tr("Localizable", "IOTSensorsView.sensors.unit", fallback: "Unidad") }
    }
  }
  internal enum IdentityUploadView {
    /// Dorso
    internal static var back: String { return L10n.tr("Localizable", "IdentityUploadView.back", fallback: "Dorso") }
    /// Cancelar
    internal static var cancel: String { return L10n.tr("Localizable", "IdentityUploadView.cancel", fallback: "Cancelar") }
    /// Cancelar Registro
    internal static var cancelRegistration: String { return L10n.tr("Localizable", "IdentityUploadView.cancelRegistration", fallback: "Cancelar Registro") }
    /// Frente
    internal static var front: String { return L10n.tr("Localizable", "IdentityUploadView.front", fallback: "Frente") }
    /// Asegúrate que el ID esté vigente y que todos los campos sean legibles y nítidos.
    internal static var instruction: String { return L10n.tr("Localizable", "IdentityUploadView.instruction", fallback: "Asegúrate que el ID esté vigente y que todos los campos sean legibles y nítidos.") }
    /// Siguiente
    internal static var next: String { return L10n.tr("Localizable", "IdentityUploadView.next", fallback: "Siguiente") }
    /// Carga tu documento de identidad
    internal static var title: String { return L10n.tr("Localizable", "IdentityUploadView.title", fallback: "Carga tu documento de identidad") }
    /// Subir fotos
    internal static var uploadPhotos: String { return L10n.tr("Localizable", "IdentityUploadView.uploadPhotos", fallback: "Subir fotos") }
  }
  internal enum LegalDocumentationView {
    /// Cancelar Registro
    internal static var cancel: String { return L10n.tr("Localizable", "LegalDocumentationView.cancel", fallback: "Cancelar Registro") }
    /// Contrato
    internal static var contract: String { return L10n.tr("Localizable", "LegalDocumentationView.contract", fallback: "Contrato") }
    /// Declaración jurada
    internal static var declaration: String { return L10n.tr("Localizable", "LegalDocumentationView.declaration", fallback: "Declaración jurada") }
    /// Comenzar
    internal static var start: String { return L10n.tr("Localizable", "LegalDocumentationView.start", fallback: "Comenzar") }
    /// Firma y acepta los contratos para poder comenzar a ser WalkCamer
    internal static var subtitle: String { return L10n.tr("Localizable", "LegalDocumentationView.subtitle", fallback: "Firma y acepta los contratos para poder comenzar a ser WalkCamer") }
    /// Documentación legal
    internal static var title: String { return L10n.tr("Localizable", "LegalDocumentationView.title", fallback: "Documentación legal") }
  }
  internal enum LidarOnboardingView {
    internal enum AceptoTerminos {
      /// Acepto términos y condiciones
      internal static var title: String { return L10n.tr("Localizable", "LidarOnboardingView.AceptoTerminos.title", fallback: "Acepto términos y condiciones") }
    }
    internal enum Cancelar {
      /// Cancelar
      internal static var title: String { return L10n.tr("Localizable", "LidarOnboardingView.Cancelar.title", fallback: "Cancelar") }
    }
    internal enum ConsideracionesBasicas {
      /// Consideraciones básicas
      internal static var title: String { return L10n.tr("Localizable", "LidarOnboardingView.ConsideracionesBasicas.title", fallback: "Consideraciones básicas") }
    }
    internal enum DescripcionConsideraciones {
      /// No se permite volar a mas de 110 m de altura
      internal static var title: String { return L10n.tr("Localizable", "LidarOnboardingView.DescripcionConsideraciones.title", fallback: "No se permite volar a mas de 110 m de altura") }
    }
    internal enum DescripcionLIDARScan {
      /// Mapea y digitaliza áreas en contrucción o descubre lo que hay debajo de la selva.
      /// 
      /// Vive la magia del escaneado con laser mediante la técnica LIDAR
      internal static var title: String { return L10n.tr("Localizable", "LidarOnboardingView.DescripcionLIDARScan.title", fallback: "Mapea y digitaliza áreas en contrucción o descubre lo que hay debajo de la selva.\n\nVive la magia del escaneado con laser mediante la técnica LIDAR") }
    }
    internal enum LIDARScan {
      /// LIDAR Scan
      internal static var title: String { return L10n.tr("Localizable", "LidarOnboardingView.LIDARScan.title", fallback: "LIDAR Scan") }
    }
    internal enum MantendremosDistancia {
      /// Mantendremos la distancia legalmente regulada con áreas pobladas
      internal static var title: String { return L10n.tr("Localizable", "LidarOnboardingView.MantendremosDistancia.title", fallback: "Mantendremos la distancia legalmente regulada con áreas pobladas") }
    }
    internal enum NoEstaPermitido {
      /// No está permitido el vuelvo en áreas restringidas.
      internal static var title: String { return L10n.tr("Localizable", "LidarOnboardingView.NoEstaPermitido.title", fallback: "No está permitido el vuelvo en áreas restringidas.") }
    }
    internal enum PlanDeVuelo {
      /// Si se requiere plan de vuelo, se coordinará con anticipación y con la autoridad aeronautica.
      internal static var title: String { return L10n.tr("Localizable", "LidarOnboardingView.PlanDeVuelo.title", fallback: "Si se requiere plan de vuelo, se coordinará con anticipación y con la autoridad aeronautica.") }
    }
  }
  internal enum LoginView {
    internal enum Button {
      /// He olvidado la contraseña
      internal static var forgotPassword: String { return L10n.tr("Localizable", "LoginView.button.forgotPassword", fallback: "He olvidado la contraseña") }
      /// Login
      internal static var login: String { return L10n.tr("Localizable", "LoginView.button.login", fallback: "Login") }
      /// Registrame
      internal static var signup: String { return L10n.tr("Localizable", "LoginView.button.signup", fallback: "Registrame") }
    }
    internal enum Divider {
      /// Or Sign up with
      internal static var text: String { return L10n.tr("Localizable", "LoginView.divider.text", fallback: "Or Sign up with") }
    }
    internal enum Input {
      internal enum Password {
        /// Contraseña
        internal static var placeholder: String { return L10n.tr("Localizable", "LoginView.input.password.placeholder", fallback: "Contraseña") }
        /// Contraseña
        internal static var text: String { return L10n.tr("Localizable", "LoginView.input.password.text", fallback: "Contraseña") }
      }
      internal enum User {
        /// Usuario
        internal static var placeholder: String { return L10n.tr("Localizable", "LoginView.input.user.placeholder", fallback: "Usuario") }
        /// Usuario
        internal static var text: String { return L10n.tr("Localizable", "LoginView.input.user.text", fallback: "Usuario") }
      }
    }
    internal enum Title {
      /// Login
      internal static var text: String { return L10n.tr("Localizable", "LoginView.title.text", fallback: "Login") }
    }
  }
  internal enum MapTabView {
    internal enum BuscarWalkCamer {
      /// Buscar WalkCamer
      internal static var placeholder: String { return L10n.tr("Localizable", "MapTabView.BuscarWalkCamer.placeholder", fallback: "Buscar WalkCamer") }
    }
  }
  internal enum MenuViewModel {
    internal enum Item {
      /// Walky
      internal static var bot: String { return L10n.tr("Localizable", "MenuViewModel.item.bot", fallback: "Walky") }
      /// Galería
      internal static var galery: String { return L10n.tr("Localizable", "MenuViewModel.item.galery", fallback: "Galería") }
      /// Ayuda
      internal static var help: String { return L10n.tr("Localizable", "MenuViewModel.item.help", fallback: "Ayuda") }
      /// Configuración
      internal static var settings: String { return L10n.tr("Localizable", "MenuViewModel.item.settings", fallback: "Configuración") }
      /// Cash Wallet
      internal static var wallet: String { return L10n.tr("Localizable", "MenuViewModel.item.wallet", fallback: "Cash Wallet") }
    }
    internal enum Plans {
      internal enum Basic {
        /// Consigue mas beneficios!
        internal static var text: String { return L10n.tr("Localizable", "MenuViewModel.plans.basic.text", fallback: "Consigue mas beneficios!") }
        /// Basic
        internal static var title: String { return L10n.tr("Localizable", "MenuViewModel.plans.basic.title", fallback: "Basic") }
      }
      internal enum Premium {
        /// Consigue TODOS los beneficios que WalkyCam ofrece
        internal static var text: String { return L10n.tr("Localizable", "MenuViewModel.plans.premium.text", fallback: "Consigue TODOS los beneficios que WalkyCam ofrece") }
        /// Premium
        internal static var title: String { return L10n.tr("Localizable", "MenuViewModel.plans.premium.title", fallback: "Premium") }
      }
      internal enum Standard {
        /// Consigue mas beneficios. Vuela un Drone a distancia!
        internal static var text: String { return L10n.tr("Localizable", "MenuViewModel.plans.standard.text", fallback: "Consigue mas beneficios. Vuela un Drone a distancia!") }
        /// Standard
        internal static var title: String { return L10n.tr("Localizable", "MenuViewModel.plans.standard.title", fallback: "Standard") }
      }
    }
    internal enum Pricing {
      /// Planes y Precios
      internal static var title: String { return L10n.tr("Localizable", "MenuViewModel.pricing.title", fallback: "Planes y Precios") }
    }
  }
  internal enum NotificationsView {
    internal enum Date {
      /// Hoy
      internal static var today: String { return L10n.tr("Localizable", "NotificationsView.date.today", fallback: "Hoy") }
    }
    internal enum Header {
      /// Notificaciones
      internal static var title: String { return L10n.tr("Localizable", "NotificationsView.header.title", fallback: "Notificaciones") }
    }
  }
  internal enum OnboardingView {
    internal enum Button {
      /// Continuar
      internal static var next: String { return L10n.tr("Localizable", "OnboardingView.Button.next", fallback: "Continuar") }
      /// Omitir
      internal static var skip: String { return L10n.tr("Localizable", "OnboardingView.Button.skip", fallback: "Omitir") }
      /// Comenzar
      internal static var start: String { return L10n.tr("Localizable", "OnboardingView.Button.start", fallback: "Comenzar") }
    }
    internal enum Page1 {
      /// Tu STREETcam 24/7 
      /// 
      /// Streaming en vivo donde quieras, cuando quieras. Ubica a tu WalkCamer y empieza a grabar. 
      /// 
      /// WalkyCam tiene mas de 20 servicios. Descúbrelos!
      internal static var subtitle: String { return L10n.tr("Localizable", "OnboardingView.Page1.subtitle", fallback: "Tu STREETcam 24/7 \n\nStreaming en vivo donde quieras, cuando quieras. Ubica a tu WalkCamer y empieza a grabar. \n\nWalkyCam tiene mas de 20 servicios. Descúbrelos!") }
      /// Qué es?
      internal static var title: String { return L10n.tr("Localizable", "OnboardingView.Page1.title", fallback: "Qué es?") }
    }
    internal enum Page2 {
      /// Manos AR, PIXELADO de Caras, Escaneo 3D, DRONES Aéreos y R.O.V., IA especializada, IOT Service, 
      /// 
      /// **y mucho más!**
      internal static var subtitle: String { return L10n.tr("Localizable", "OnboardingView.Page2.subtitle", fallback: "Manos AR, PIXELADO de Caras, Escaneo 3D, DRONES Aéreos y R.O.V., IA especializada, IOT Service, \n\n**y mucho más!**") }
      /// Universo WalkyCam
      internal static var title: String { return L10n.tr("Localizable", "OnboardingView.Page2.title", fallback: "Universo WalkyCam") }
    }
    internal enum Page3 {
      /// Sumergete en otros lugares sin salir de casa.
      /// 
      /// Explora nuevos entornos y viaja virtualmente.
      internal static var subtitle: String { return L10n.tr("Localizable", "OnboardingView.Page3.subtitle", fallback: "Sumergete en otros lugares sin salir de casa.\n\nExplora nuevos entornos y viaja virtualmente.") }
      /// Experiencia Inmersiva
      internal static var title: String { return L10n.tr("Localizable", "OnboardingView.Page3.title", fallback: "Experiencia Inmersiva") }
    }
  }
  internal enum PlanPageView {
    internal enum Plan {
      /// Plan anual
      internal static var annual: String { return L10n.tr("Localizable", "PlanPageView.plan.annual", fallback: "Plan anual") }
      /// (ahorra 5%%)
      internal static var discount: String { return L10n.tr("Localizable", "PlanPageView.plan.discount", fallback: "(ahorra 5%%)") }
      /// Incluye **%@** más:
      internal static func includes(_ p1: Any) -> String {
        return L10n.tr("Localizable", "PlanPageView.plan.includes", String(describing: p1), fallback: "Incluye **%@** más:")
      }
    }
    internal enum Toggle {
      /// Toggle Test
      internal static var test: String { return L10n.tr("Localizable", "PlanPageView.toggle.test", fallback: "Toggle Test") }
    }
  }
  internal enum PlansComparisonPageView {
    /// O convertirlo en
    internal static var convertToUSD: String { return L10n.tr("Localizable", "PlansComparisonPageView.convertToUSD", fallback: "O convertirlo en") }
    /// En todos los planes se incluyen funciones como: White Board, Share to, Chat, REC, etc.
    internal static var includedFeatures: String { return L10n.tr("Localizable", "PlansComparisonPageView.includedFeatures", fallback: "En todos los planes se incluyen funciones como: White Board, Share to, Chat, REC, etc.") }
    /// Plan anual
    internal static var planAnual: String { return L10n.tr("Localizable", "PlansComparisonPageView.planAnual", fallback: "Plan anual") }
    /// (ahora 5%%)
    internal static var save5Percent: String { return L10n.tr("Localizable", "PlansComparisonPageView.save5Percent", fallback: "(ahora 5%%)") }
    /// Start
    internal static var start: String { return L10n.tr("Localizable", "PlansComparisonPageView.start", fallback: "Start") }
  }
  internal enum PlansPagesView {
    internal enum Button {
      /// Comparar
      internal static var compare: String { return L10n.tr("Localizable", "PlansPagesView.button.compare", fallback: "Comparar") }
      /// Start %@
      internal static func start(_ p1: Any) -> String {
        return L10n.tr("Localizable", "PlansPagesView.button.start", String(describing: p1), fallback: "Start %@")
      }
    }
  }
  internal enum PlayBusinessView {
    /// Idea de Negocio
    internal static var businessIdea: String { return L10n.tr("Localizable", "PlayBusinessView.businessIdea", fallback: "Idea de Negocio") }
    /// Famosos
    internal static var celebrities: String { return L10n.tr("Localizable", "PlayBusinessView.celebrities", fallback: "Famosos") }
    /// Copyright
    internal static var copyright: String { return L10n.tr("Localizable", "PlayBusinessView.copyright", fallback: "Copyright") }
    /// Film Maker
    internal static var filmMaker: String { return L10n.tr("Localizable", "PlayBusinessView.filmMaker", fallback: "Film Maker") }
    /// Pulsera Fitness
    internal static var fitnessBracelet: String { return L10n.tr("Localizable", "PlayBusinessView.fitnessBracelet", fallback: "Pulsera Fitness") }
    /// Gymkhana
    internal static var gymkhana: String { return L10n.tr("Localizable", "PlayBusinessView.gymkhana", fallback: "Gymkhana") }
    /// Patente de Invención
    internal static var inventionPatent: String { return L10n.tr("Localizable", "PlayBusinessView.inventionPatent", fallback: "Patente de Invención") }
    /// WalkyCam baja demanda
    internal static var lowDemand: String { return L10n.tr("Localizable", "PlayBusinessView.lowDemand", fallback: "WalkyCam baja demanda") }
    /// Mariachis
    internal static var mariachis: String { return L10n.tr("Localizable", "PlayBusinessView.mariachis", fallback: "Mariachis") }
    /// Personal Shopper
    internal static var personalShopper: String { return L10n.tr("Localizable", "PlayBusinessView.personalShopper", fallback: "Personal Shopper") }
    /// Plan Premium
    internal static var premiumPlan: String { return L10n.tr("Localizable", "PlayBusinessView.premiumPlan", fallback: "Plan Premium") }
    /// Muestra de Productos
    internal static var productSample: String { return L10n.tr("Localizable", "PlayBusinessView.productSample", fallback: "Muestra de Productos") }
    /// Scape Room
    internal static var scapeRoom: String { return L10n.tr("Localizable", "PlayBusinessView.scapeRoom", fallback: "Scape Room") }
    /// Caja Surpresa
    internal static var surpriseBox: String { return L10n.tr("Localizable", "PlayBusinessView.surpriseBox", fallback: "Caja Surpresa") }
    /// Play & Business
    internal static var title: String { return L10n.tr("Localizable", "PlayBusinessView.title", fallback: "Play & Business") }
  }
  internal enum PrintMenuView {
    internal enum EscanearImagen {
      /// Escanear imagen
      internal static var title: String { return L10n.tr("Localizable", "PrintMenuView.EscanearImagen.title", fallback: "Escanear imagen") }
    }
    internal enum Galeria {
      /// Galeria
      internal static var title: String { return L10n.tr("Localizable", "PrintMenuView.Galeria.title", fallback: "Galeria") }
    }
    internal enum Print3D {
      /// Print 3D
      internal static var title: String { return L10n.tr("Localizable", "PrintMenuView.Print3D.title", fallback: "Print 3D") }
    }
    internal enum SubirImagen {
      /// Subir imagen
      internal static var title: String { return L10n.tr("Localizable", "PrintMenuView.SubirImagen.title", fallback: "Subir imagen") }
    }
  }
  internal enum ProfileView {
    internal enum Premium {
      /// Consigure TODOS los beneficios que WalkyCam oferece
      internal static var upgradeDescription: String { return L10n.tr("Localizable", "ProfileView.Premium.upgradeDescription", fallback: "Consigure TODOS los beneficios que WalkyCam oferece") }
      /// Upgrade Plan Premium
      internal static var upgradeTitle: String { return L10n.tr("Localizable", "ProfileView.Premium.upgradeTitle", fallback: "Upgrade Plan Premium") }
    }
    internal enum Button {
      /// Cancelar
      internal static var cancel: String { return L10n.tr("Localizable", "ProfileView.button.cancel", fallback: "Cancelar") }
      /// Guardar cambios
      internal static var save: String { return L10n.tr("Localizable", "ProfileView.button.save", fallback: "Guardar cambios") }
    }
    internal enum Convert {
      /// Quiero ser WalkCamer
      internal static var walkycamer: String { return L10n.tr("Localizable", "ProfileView.convert.walkycamer", fallback: "Quiero ser WalkCamer") }
    }
    internal enum Earnings {
      /// (genera ganacias con nosotros)
      internal static var title: String { return L10n.tr("Localizable", "ProfileView.earnings.title", fallback: "(genera ganacias con nosotros)") }
    }
    internal enum Email {
      /// Email
      internal static var title: String { return L10n.tr("Localizable", "ProfileView.email.title", fallback: "Email") }
    }
    internal enum Field {
      /// Sobre mi
      internal static var aboutMe: String { return L10n.tr("Localizable", "ProfileView.field.aboutMe", fallback: "Sobre mi") }
      /// Domicilio
      internal static var address: String { return L10n.tr("Localizable", "ProfileView.field.address", fallback: "Domicilio") }
      /// Fecha de nacimiento
      internal static var birthDate: String { return L10n.tr("Localizable", "ProfileView.field.birthDate", fallback: "Fecha de nacimiento") }
      /// Sexo
      internal static var gender: String { return L10n.tr("Localizable", "ProfileView.field.gender", fallback: "Sexo") }
      /// Apellido
      internal static var lastname: String { return L10n.tr("Localizable", "ProfileView.field.lastname", fallback: "Apellido") }
      /// Nombre
      internal static var name: String { return L10n.tr("Localizable", "ProfileView.field.name", fallback: "Nombre") }
      /// No informado
      internal static var notInformed: String { return L10n.tr("Localizable", "ProfileView.field.notInformed", fallback: "No informado") }
      /// Número de celular
      internal static var phoneNumber: String { return L10n.tr("Localizable", "ProfileView.field.phoneNumber", fallback: "Número de celular") }
    }
    internal enum Navigation {
      internal enum Default {
        /// Perfil
        internal static var title: String { return L10n.tr("Localizable", "ProfileView.navigation.default.title", fallback: "Perfil") }
      }
      internal enum Edit {
        /// Editar Perfil
        internal static var title: String { return L10n.tr("Localizable", "ProfileView.navigation.edit.title", fallback: "Editar Perfil") }
      }
    }
    internal enum Section {
      /// Cerrar Sesión
      internal static var logout: String { return L10n.tr("Localizable", "ProfileView.section.logout", fallback: "Cerrar Sesión") }
    }
    internal enum Toggle {
      /// Soy WalkCamer
      internal static var walkycamer: String { return L10n.tr("Localizable", "ProfileView.toggle.walkycamer", fallback: "Soy WalkCamer") }
    }
    internal enum Username {
      /// Username
      internal static var title: String { return L10n.tr("Localizable", "ProfileView.username.title", fallback: "Username") }
    }
  }
  internal enum ProfitSelectionView {
    /// Completa nuestros pedidos y servicios y factura con nosotros.
    internal static var b2bDescription: String { return L10n.tr("Localizable", "ProfitSelectionView.b2bDescription", fallback: "Completa nuestros pedidos y servicios y factura con nosotros.") }
    /// Partner B2B: de Empresa a Empresa
    internal static var b2bTitle: String { return L10n.tr("Localizable", "ProfitSelectionView.b2bTitle", fallback: "Partner B2B: de Empresa a Empresa") }
    /// Cancelar
    internal static var cancelButton: String { return L10n.tr("Localizable", "ProfitSelectionView.cancelButton", fallback: "Cancelar") }
    /// Trabaja con nosotros, únete al Staff de WalkyCam.
    internal static var employeeDescription: String { return L10n.tr("Localizable", "ProfitSelectionView.employeeDescription", fallback: "Trabaja con nosotros, únete al Staff de WalkyCam.") }
    /// Empleado: de WalkyCam
    internal static var employeeTitle: String { return L10n.tr("Localizable", "ProfitSelectionView.employeeTitle", fallback: "Empleado: de WalkyCam") }
    /// Danos tu tiempo y tus medios y te haremos ganar dinero
    internal static var freelanceDescription: String { return L10n.tr("Localizable", "ProfitSelectionView.freelanceDescription", fallback: "Danos tu tiempo y tus medios y te haremos ganar dinero") }
    /// Freelance: Independiente
    internal static var freelanceTitle: String { return L10n.tr("Localizable", "ProfitSelectionView.freelanceTitle", fallback: "Freelance: Independiente") }
    /// Comenzar!
    internal static var startButton: String { return L10n.tr("Localizable", "ProfitSelectionView.startButton", fallback: "Comenzar!") }
    /// Elige como quieres generar ganancias
    internal static var title: String { return L10n.tr("Localizable", "ProfitSelectionView.title", fallback: "Elige como quieres generar ganancias") }
  }
  internal enum RadarMenuView {
    /// Radares & Sensores
    internal static var title: String { return L10n.tr("Localizable", "RadarMenuView.Title", fallback: "Radares & Sensores") }
    internal enum AnalizadorDeRedes {
      /// Analizador de redes
      internal static var title: String { return L10n.tr("Localizable", "RadarMenuView.AnalizadorDeRedes.title", fallback: "Analizador de redes") }
    }
    internal enum DetectorDeCables {
      /// Detector de cables
      internal static var title: String { return L10n.tr("Localizable", "RadarMenuView.DetectorDeCables.title", fallback: "Detector de cables") }
    }
    internal enum Georadar {
      /// Georadar
      internal static var title: String { return L10n.tr("Localizable", "RadarMenuView.Georadar.title", fallback: "Georadar") }
    }
  }
  internal enum RegisterWalkcamerView {
    /// Acepto los Términos y Condiciones de WalkyCam
    internal static var acceptedTerms: String { return L10n.tr("Localizable", "RegisterWalkcamerView.acceptedTerms", fallback: "Acepto los Términos y Condiciones de WalkyCam") }
    /// Email
    internal static var email: String { return L10n.tr("Localizable", "RegisterWalkcamerView.email", fallback: "Email") }
    /// nombre@email.com
    internal static var emailPlaceholder: String { return L10n.tr("Localizable", "RegisterWalkcamerView.emailPlaceholder", fallback: "nombre@email.com") }
    /// Genera ganancias, hazte 
    internal static var gainText: String { return L10n.tr("Localizable", "RegisterWalkcamerView.gainText", fallback: "Genera ganancias, hazte ") }
    /// Apellido
    internal static var lastName: String { return L10n.tr("Localizable", "RegisterWalkcamerView.lastName", fallback: "Apellido") }
    /// Apellido
    internal static var lastNamePlaceholder: String { return L10n.tr("Localizable", "RegisterWalkcamerView.lastNamePlaceholder", fallback: "Apellido") }
    /// Nombre
    internal static var name: String { return L10n.tr("Localizable", "RegisterWalkcamerView.name", fallback: "Nombre") }
    /// Nombre
    internal static var namePlaceholder: String { return L10n.tr("Localizable", "RegisterWalkcamerView.namePlaceholder", fallback: "Nombre") }
    /// Telefono
    internal static var phone: String { return L10n.tr("Localizable", "RegisterWalkcamerView.phone", fallback: "Telefono") }
    /// Telefono
    internal static var phonePlaceholder: String { return L10n.tr("Localizable", "RegisterWalkcamerView.phonePlaceholder", fallback: "Telefono") }
    /// Registrame
    internal static var register: String { return L10n.tr("Localizable", "RegisterWalkcamerView.register", fallback: "Registrame") }
    /// Registrate hoy!
    internal static var registerToday: String { return L10n.tr("Localizable", "RegisterWalkcamerView.registerToday", fallback: "Registrate hoy!") }
    /// WalkCamer
    internal static var walkcamer: String { return L10n.tr("Localizable", "RegisterWalkcamerView.walkcamer", fallback: "WalkCamer") }
  }
  internal enum RegistrationPlans {
    /// Para comenzar elige un plan, luego puedes cambiarlo.
    internal static var description: String { return L10n.tr("Localizable", "RegistrationPlans.description", fallback: "Para comenzar elige un plan, luego puedes cambiarlo.") }
    /// Elige tu plan
    internal static var title: String { return L10n.tr("Localizable", "RegistrationPlans.title", fallback: "Elige tu plan") }
    internal enum Button {
      /// Comparar Planes
      internal static var title: String { return L10n.tr("Localizable", "RegistrationPlans.button.title", fallback: "Comparar Planes") }
    }
    internal enum Plan {
      internal enum Button {
        /// Ver Plan
        internal static var title: String { return L10n.tr("Localizable", "RegistrationPlans.plan.button.title", fallback: "Ver Plan") }
      }
    }
    internal enum Value {
      /// %@ €/mo
      internal static func monthly(_ p1: Any) -> String {
        return L10n.tr("Localizable", "RegistrationPlans.value.monthly", String(describing: p1), fallback: "%@ €/mo")
      }
      /// %@ €/yr
      internal static func yearly(_ p1: Any) -> String {
        return L10n.tr("Localizable", "RegistrationPlans.value.yearly", String(describing: p1), fallback: "%@ €/yr")
      }
    }
  }
  internal enum RegistrationPlansView {
    internal enum Plan {
      /// Plan anual
      internal static var annual: String { return L10n.tr("Localizable", "RegistrationPlansView.plan.annual", fallback: "Plan anual") }
      /// (ahorra 5%%)
      internal static var discount: String { return L10n.tr("Localizable", "RegistrationPlansView.plan.discount", fallback: "(ahorra 5%%)") }
    }
    internal enum Toggle {
      /// Toggle Test
      internal static var test: String { return L10n.tr("Localizable", "RegistrationPlansView.toggle.test", fallback: "Toggle Test") }
    }
  }
  internal enum ReminderCardView {
    /// Día y hora
    internal static var dayAndTime: String { return L10n.tr("Localizable", "ReminderCardView.dayAndTime", fallback: "Día y hora") }
    /// Go to Street Cam
    internal static var goToStreetCam: String { return L10n.tr("Localizable", "ReminderCardView.goToStreetCam", fallback: "Go to Street Cam") }
    /// WalkCamer
    internal static var walkCamer: String { return L10n.tr("Localizable", "ReminderCardView.walkCamer", fallback: "WalkCamer") }
  }
  internal enum RobotMenuView {
    /// Dog Robot
    internal static var dogRobot: String { return L10n.tr("Localizable", "RobotMenuView.dogRobot", fallback: "Dog Robot") }
    /// Para Mascotas
    internal static var pets: String { return L10n.tr("Localizable", "RobotMenuView.pets", fallback: "Para Mascotas") }
    /// Telepresencia
    internal static var telepresence: String { return L10n.tr("Localizable", "RobotMenuView.telepresence", fallback: "Telepresencia") }
    /// Robótica
    internal static var title: String { return L10n.tr("Localizable", "RobotMenuView.title", fallback: "Robótica") }
  }
  internal enum RuralDroneOnboardingView {
    internal enum AceptoTerminos {
      /// Acepto términos y condiciones
      internal static var title: String { return L10n.tr("Localizable", "RuralDroneOnboardingView.AceptoTerminos.title", fallback: "Acepto términos y condiciones") }
    }
    internal enum Cancelar {
      /// Cancelar
      internal static var title: String { return L10n.tr("Localizable", "RuralDroneOnboardingView.Cancelar.title", fallback: "Cancelar") }
    }
    internal enum ConsideracionesBasicas {
      /// Consideraciones básicas
      internal static var title: String { return L10n.tr("Localizable", "RuralDroneOnboardingView.ConsideracionesBasicas.title", fallback: "Consideraciones básicas") }
    }
    internal enum MantendremosLaDistancia {
      /// Mantendremos la distancia legalmente regulada con áreas pobladas
      internal static var title: String { return L10n.tr("Localizable", "RuralDroneOnboardingView.MantendremosLaDistancia.title", fallback: "Mantendremos la distancia legalmente regulada con áreas pobladas") }
    }
    internal enum MapearCampos {
      /// Mapeo de campos, IOT, vigilancia y monitoreo de los cultivos, agricultura ecológica, mediante Drone. 
      /// 
      /// Contamos con profesionales acreditados y con experiencia.
      /// Tu WalkCamer te guiará.
      internal static var title: String { return L10n.tr("Localizable", "RuralDroneOnboardingView.MapearCampos.title", fallback: "Mapeo de campos, IOT, vigilancia y monitoreo de los cultivos, agricultura ecológica, mediante Drone. \n\nContamos con profesionales acreditados y con experiencia.\nTu WalkCamer te guiará.") }
    }
    internal enum NoEstaPermitido {
      /// No está permitido el vuelo en áreas restringidas.
      internal static var title: String { return L10n.tr("Localizable", "RuralDroneOnboardingView.NoEstaPermitido.title", fallback: "No está permitido el vuelo en áreas restringidas.") }
    }
    internal enum NoSePermiteVolar {
      /// No se permite volar a mas de 110 m de altura
      internal static var title: String { return L10n.tr("Localizable", "RuralDroneOnboardingView.NoSePermiteVolar.title", fallback: "No se permite volar a mas de 110 m de altura") }
    }
    internal enum SiSeRequierePlan {
      /// Si se requiere plan de vuelo, se coordinará con anticipación y con la autoridad aeronautica.
      internal static var title: String { return L10n.tr("Localizable", "RuralDroneOnboardingView.SiSeRequierePlan.title", fallback: "Si se requiere plan de vuelo, se coordinará con anticipación y con la autoridad aeronautica.") }
    }
    internal enum UtilizaDronesEnTuCultivo {
      /// Utiliza drones en tu cultivo
      internal static var title: String { return L10n.tr("Localizable", "RuralDroneOnboardingView.UtilizaDronesEnTuCultivo.title", fallback: "Utiliza drones en tu cultivo") }
    }
  }
  internal enum Scan3DMenuView {
    internal enum ADistancia {
      /// A distancia
      internal static var title: String { return L10n.tr("Localizable", "Scan3DMenuView.ADistancia.title", fallback: "A distancia") }
    }
    internal enum BuscarUnContacto {
      /// Buscar un Contacto
      internal static var cellTitle: String { return L10n.tr("Localizable", "Scan3DMenuView.BuscarUnContacto.cellTitle", fallback: "Buscar un Contacto") }
    }
    internal enum BuscarWalkCamer {
      /// Buscar WalkCamer
      internal static var cellTitle: String { return L10n.tr("Localizable", "Scan3DMenuView.BuscarWalkCamer.cellTitle", fallback: "Buscar WalkCamer") }
    }
    internal enum DesdeTuSmartphone {
      /// Desde tu smartphone
      internal static var title: String { return L10n.tr("Localizable", "Scan3DMenuView.DesdeTuSmartphone.title", fallback: "Desde tu smartphone") }
    }
    internal enum FAQs {
      /// FAQ's
      internal static var title: String { return L10n.tr("Localizable", "Scan3DMenuView.FAQs.title", fallback: "FAQ's") }
    }
    internal enum Galeria {
      /// Galería
      internal static var cellTitle: String { return L10n.tr("Localizable", "Scan3DMenuView.Galeria.cellTitle", fallback: "Galería") }
    }
    internal enum Scan3D {
      /// Scan 3D
      internal static var cellTitle: String { return L10n.tr("Localizable", "Scan3DMenuView.Scan3D.cellTitle", fallback: "Scan 3D") }
      /// Scan 3D
      internal static var title: String { return L10n.tr("Localizable", "Scan3DMenuView.Scan3D.title", fallback: "Scan 3D") }
    }
  }
  internal enum Scan3DOnboardingView {
    internal enum Comenzar {
      /// Comenzar
      internal static var title: String { return L10n.tr("Localizable", "Scan3DOnboardingView.Comenzar.title", fallback: "Comenzar") }
    }
    internal enum CreaModelos3D {
      /// Crea modelos 3D de objetos reales a partir de fotografias
      internal static var title: String { return L10n.tr("Localizable", "Scan3DOnboardingView.CreaModelos3D.title", fallback: "Crea modelos 3D de objetos reales a partir de fotografias") }
    }
    internal enum ModificaLaImagen {
      /// Modifica la imagen
      internal static var title: String { return L10n.tr("Localizable", "Scan3DOnboardingView.ModificaLaImagen.title", fallback: "Modifica la imagen") }
    }
    internal enum RealizaUnaImpresion {
      /// Realiza una impresión 3D del objeto
      internal static var title: String { return L10n.tr("Localizable", "Scan3DOnboardingView.RealizaUnaImpresion.title", fallback: "Realiza una impresión 3D del objeto") }
    }
    internal enum SolicitaUnWalkCamer {
      /// Solicita un WalkCamer
      internal static var title: String { return L10n.tr("Localizable", "Scan3DOnboardingView.SolicitaUnWalkCamer.title", fallback: "Solicita un WalkCamer") }
    }
  }
  internal enum ScheduleVideoCallView {
    /// Siguiente
    internal static var next: String { return L10n.tr("Localizable", "ScheduleVideoCallView.next", fallback: "Siguiente") }
    /// Selecciona fecha y hora de videollamada
    internal static var selectDateAndTime: String { return L10n.tr("Localizable", "ScheduleVideoCallView.selectDateAndTime", fallback: "Selecciona fecha y hora de videollamada") }
  }
  internal enum ScheduleVideoCallViewModel {
    internal enum Tabs {
      /// Fecha
      internal static var date: String { return L10n.tr("Localizable", "ScheduleVideoCallViewModel.tabs.date", fallback: "Fecha") }
      /// Hora
      internal static var time: String { return L10n.tr("Localizable", "ScheduleVideoCallViewModel.tabs.time", fallback: "Hora") }
    }
  }
  internal enum SearchWalkyCammerView {
    internal enum Button {
      /// Ver Listado
      internal static var viewList: String { return L10n.tr("Localizable", "SearchWalkyCammerView.button.viewList", fallback: "Ver Listado") }
      /// Ver Mapa
      internal static var viewMap: String { return L10n.tr("Localizable", "SearchWalkyCammerView.button.viewMap", fallback: "Ver Mapa") }
    }
    internal enum Search {
      /// Buscar WalkCamer
      internal static var placeholder: String { return L10n.tr("Localizable", "SearchWalkyCammerView.search.placeholder", fallback: "Buscar WalkCamer") }
    }
  }
  internal enum SearchWalkyCammerViewModel {
    internal enum Title {
      /// WalkCamers Disponibles
      internal static var availableWalkCammers: String { return L10n.tr("Localizable", "SearchWalkyCammerViewModel.title.availableWalkCammers", fallback: "WalkCamers Disponibles") }
      /// Buscar zona
      internal static var searchZone: String { return L10n.tr("Localizable", "SearchWalkyCammerViewModel.title.searchZone", fallback: "Buscar zona") }
    }
  }
  internal enum ServiceConfirmationView {
    /// Asistentes
    internal static var assistants: String { return L10n.tr("Localizable", "ServiceConfirmationView.assistants", fallback: "Asistentes") }
    /// Quiero cancelar
    internal static var cancel: String { return L10n.tr("Localizable", "ServiceConfirmationView.cancel", fallback: "Quiero cancelar") }
    /// La invitación se enviará a los miembros de esta reunión al finalizar el proceso.
    internal static var invitationMessage: String { return L10n.tr("Localizable", "ServiceConfirmationView.invitationMessage", fallback: "La invitación se enviará a los miembros de esta reunión al finalizar el proceso.") }
    /// Enlace
    internal static var link: String { return L10n.tr("Localizable", "ServiceConfirmationView.link", fallback: "Enlace") }
    /// Ok
    internal static var ok: String { return L10n.tr("Localizable", "ServiceConfirmationView.ok", fallback: "Ok") }
    /// Videollamada registrada con éxito!
    internal static var successMessage: String { return L10n.tr("Localizable", "ServiceConfirmationView.successMessage", fallback: "Videollamada registrada con éxito!") }
  }
  internal enum ServiceConfirmationViewModel {
    /// Asistentes
    internal static var assistants: String { return L10n.tr("Localizable", "ServiceConfirmationViewModel.assistants", fallback: "Asistentes") }
    /// Día
    internal static var day: String { return L10n.tr("Localizable", "ServiceConfirmationViewModel.day", fallback: "Día") }
    /// Enlace
    internal static var link: String { return L10n.tr("Localizable", "ServiceConfirmationViewModel.link", fallback: "Enlace") }
    /// Hora
    internal static var time: String { return L10n.tr("Localizable", "ServiceConfirmationViewModel.time", fallback: "Hora") }
  }
  internal enum ServiceDetails {
    /// Al apagar este selector, estarás dejando de ocultar los rostros de las personas.
    internal static var apagarSelector: String { return L10n.tr("Localizable", "ServiceDetails.apagarSelector", fallback: "Al apagar este selector, estarás dejando de ocultar los rostros de las personas.") }
    /// Asistentes
    internal static var asistentes: String { return L10n.tr("Localizable", "ServiceDetails.asistentes", fallback: "Asistentes") }
    /// Cancelar
    internal static var cancelar: String { return L10n.tr("Localizable", "ServiceDetails.cancelar", fallback: "Cancelar") }
    /// Capacidades
    internal static var capacidades: String { return L10n.tr("Localizable", "ServiceDetails.capacidades", fallback: "Capacidades") }
    /// Detalles del Servicio
    internal static var detallesServicio: String { return L10n.tr("Localizable", "ServiceDetails.detallesServicio", fallback: "Detalles del Servicio") }
    /// Dispositivos
    internal static var dispositivos: String { return L10n.tr("Localizable", "ServiceDetails.dispositivos", fallback: "Dispositivos") }
    /// Finalizar y Enviar
    internal static var finalizarEnviar: String { return L10n.tr("Localizable", "ServiceDetails.finalizarEnviar", fallback: "Finalizar y Enviar") }
    /// La invitación se enviará a los miembros de esta reunión al finalizar el proceso.
    internal static var invitacionEnviada: String { return L10n.tr("Localizable", "ServiceDetails.invitacionEnviada", fallback: "La invitación se enviará a los miembros de esta reunión al finalizar el proceso.") }
    /// Pixelado facial activado
    internal static var pixeladoActivado: String { return L10n.tr("Localizable", "ServiceDetails.pixeladoActivado", fallback: "Pixelado facial activado") }
    /// Videollamada
    internal static var videollamada: String { return L10n.tr("Localizable", "ServiceDetails.videollamada", fallback: "Videollamada") }
  }
  internal enum ServiceDetailsViewModel {
    internal enum Ciudad {
      /// Ciudad
      internal static var title: String { return L10n.tr("Localizable", "ServiceDetailsViewModel.Ciudad.title", fallback: "Ciudad") }
    }
    internal enum Dia {
      /// Día
      internal static var title: String { return L10n.tr("Localizable", "ServiceDetailsViewModel.Dia.title", fallback: "Día") }
    }
    internal enum Hora {
      /// Hora
      internal static var title: String { return L10n.tr("Localizable", "ServiceDetailsViewModel.Hora.title", fallback: "Hora") }
    }
    internal enum LugarDeGrabacion {
      /// Lugar de grabación
      internal static var title: String { return L10n.tr("Localizable", "ServiceDetailsViewModel.LugarDeGrabacion.title", fallback: "Lugar de grabación") }
    }
    internal enum Pais {
      /// País
      internal static var title: String { return L10n.tr("Localizable", "ServiceDetailsViewModel.Pais.title", fallback: "País") }
    }
    internal enum WalkCamer {
      /// WalkCamer
      internal static var title: String { return L10n.tr("Localizable", "ServiceDetailsViewModel.WalkCamer.title", fallback: "WalkCamer") }
    }
  }
  internal enum ShopTabView {
    /// Categorías
    internal static var categories: String { return L10n.tr("Localizable", "ShopTabView.categories", fallback: "Categorías") }
    /// Cambia tu dinero en la
    internal static var changeYourMoney: String { return L10n.tr("Localizable", "ShopTabView.changeYourMoney", fallback: "Cambia tu dinero en la") }
    /// Ofertas del día
    internal static var dailyOffers: String { return L10n.tr("Localizable", "ShopTabView.dailyOffers", fallback: "Ofertas del día") }
    /// Obtener
    internal static var `get`: String { return L10n.tr("Localizable", "ShopTabView.get", fallback: "Obtener") }
    /// Oferta
    internal static var offer: String { return L10n.tr("Localizable", "ShopTabView.offer", fallback: "Oferta") }
    /// Tienda
    internal static var shop: String { return L10n.tr("Localizable", "ShopTabView.shop", fallback: "Tienda") }
  }
  internal enum ShopTabViewModel {
    /// Arte
    internal static var art: String { return L10n.tr("Localizable", "ShopTabViewModel.art", fallback: "Arte") }
    /// 50%% de descuento en All inclusive en Cancún
    internal static var cancunOffer: String { return L10n.tr("Localizable", "ShopTabViewModel.cancunOffer", fallback: "50%% de descuento en All inclusive en Cancún") }
    /// Moda
    internal static var fashion: String { return L10n.tr("Localizable", "ShopTabViewModel.fashion", fallback: "Moda") }
    /// 20%% de descuento en vuelos a América del Sur
    internal static var flightOffer: String { return L10n.tr("Localizable", "ShopTabViewModel.flightOffer", fallback: "20%% de descuento en vuelos a América del Sur") }
    /// Funciones
    /// WalkyCam
    internal static var functions: String { return L10n.tr("Localizable", "ShopTabViewModel.functions", fallback: "Funciones\nWalkyCam") }
    /// 2x1 en iPhone 13
    internal static var iphoneOffer: String { return L10n.tr("Localizable", "ShopTabViewModel.iphoneOffer", fallback: "2x1 en iPhone 13") }
    /// Música
    internal static var music: String { return L10n.tr("Localizable", "ShopTabViewModel.music", fallback: "Música") }
    /// NFT's
    internal static var nft: String { return L10n.tr("Localizable", "ShopTabViewModel.nft", fallback: "NFT's") }
    /// Tecnología
    internal static var technology: String { return L10n.tr("Localizable", "ShopTabViewModel.technology", fallback: "Tecnología") }
    /// Viajes
    internal static var travel: String { return L10n.tr("Localizable", "ShopTabViewModel.travel", fallback: "Viajes") }
    /// Consigue los mejores WalkCamers a precio de oferta
    internal static var walkcamersOffer: String { return L10n.tr("Localizable", "ShopTabViewModel.walkcamersOffer", fallback: "Consigue los mejores WalkCamers a precio de oferta") }
  }
  internal enum SpecialistNotifiedView {
    internal enum Aceptar {
      /// Aceptar
      internal static var title: String { return L10n.tr("Localizable", "SpecialistNotifiedView.Aceptar.title", fallback: "Aceptar") }
    }
    internal enum CancelarAsistencia {
      /// Cancelar asistencia
      internal static var title: String { return L10n.tr("Localizable", "SpecialistNotifiedView.CancelarAsistencia.title", fallback: "Cancelar asistencia") }
    }
    internal enum CuandoElTecnicoConfirme {
      /// Cuando el técnico confirme, **te enviaremos el enlace de la videollamada** para poder ser asistido.
      internal static var title: String { return L10n.tr("Localizable", "SpecialistNotifiedView.CuandoElTecnicoConfirme.title", fallback: "Cuando el técnico confirme, **te enviaremos el enlace de la videollamada** para poder ser asistido.") }
    }
    internal enum ElEspecialistaHaSidoNotificado {
      /// El especialista ha sido notificado
      internal static var title: String { return L10n.tr("Localizable", "SpecialistNotifiedView.ElEspecialistaHaSidoNotificado.title", fallback: "El especialista ha sido notificado") }
    }
  }
  internal enum StartupView {
    /// Comenzar
    internal static var button: String { return L10n.tr("Localizable", "StartupView.button", fallback: "Comenzar") }
    /// Tu cuenta ha sido validada.
    internal static var subtitle: String { return L10n.tr("Localizable", "StartupView.subtitle", fallback: "Tu cuenta ha sido validada.") }
    /// Bienvenida %@!
    internal static func title(_ p1: Any) -> String {
      return L10n.tr("Localizable", "StartupView.title", String(describing: p1), fallback: "Bienvenida %@!")
    }
  }
  internal enum StreetCamMenuView {
    /// Conecta con cualquier lugar!
    internal static var title: String { return L10n.tr("Localizable", "StreetCamMenuView.title", fallback: "Conecta con cualquier lugar!") }
    internal enum Join {
      /// Unirme
      internal static var button: String { return L10n.tr("Localizable", "StreetCamMenuView.join.button", fallback: "Unirme") }
      /// Ingresa el código que has recebido.
      internal static var description: String { return L10n.tr("Localizable", "StreetCamMenuView.join.description", fallback: "Ingresa el código que has recebido.") }
      /// Ingresar código
      internal static var inputPlaceholder: String { return L10n.tr("Localizable", "StreetCamMenuView.join.inputPlaceholder", fallback: "Ingresar código") }
      /// UNIRSE
      internal static var title: String { return L10n.tr("Localizable", "StreetCamMenuView.join.title", fallback: "UNIRSE") }
    }
    internal enum Schedule {
      /// Reservar
      internal static var button: String { return L10n.tr("Localizable", "StreetCamMenuView.schedule.button", fallback: "Reservar") }
      /// Programa tu WalkCamer con anterioridad.
      internal static var description: String { return L10n.tr("Localizable", "StreetCamMenuView.schedule.description", fallback: "Programa tu WalkCamer con anterioridad.") }
      /// RESERVAR
      internal static var title: String { return L10n.tr("Localizable", "StreetCamMenuView.schedule.title", fallback: "RESERVAR") }
    }
    internal enum Search {
      /// Buscar
      internal static var button: String { return L10n.tr("Localizable", "StreetCamMenuView.search.button", fallback: "Buscar") }
      /// Localiza tu WalkCamer más cercano.
      internal static var description: String { return L10n.tr("Localizable", "StreetCamMenuView.search.description", fallback: "Localiza tu WalkCamer más cercano.") }
      /// BUSCAR
      internal static var title: String { return L10n.tr("Localizable", "StreetCamMenuView.search.title", fallback: "BUSCAR") }
    }
  }
  internal enum TabBarBuilder {
    internal enum Tab {
      /// Funciones
      internal static var functions: String { return L10n.tr("Localizable", "TabBarBuilder.tab.functions", fallback: "Funciones") }
      /// Home
      internal static var home: String { return L10n.tr("Localizable", "TabBarBuilder.tab.home", fallback: "Home") }
      /// Menú
      internal static var menu: String { return L10n.tr("Localizable", "TabBarBuilder.tab.menu", fallback: "Menú") }
    }
  }
  internal enum ThermalCameraOnboardingView {
    /// Detecta y visualiza el calor emitido por objetos y personas, permitiendo ver diferencias de temperatura, identificar problemas de aislamiento, detectar animales en la oscuridad y explorar el entorno.
    internal static var description1: String { return L10n.tr("Localizable", "ThermalCameraOnboardingView.description1", fallback: "Detecta y visualiza el calor emitido por objetos y personas, permitiendo ver diferencias de temperatura, identificar problemas de aislamiento, detectar animales en la oscuridad y explorar el entorno.") }
    /// Enfoca la cámara hacia el área u objeto que deseas analizar y toma una foto o graba un video.
    /// 
    /// Observa las diferencias de temperatura visualizadas en colores, desde los tonos más fríos (azules) a los más cálidos (rojos).
    internal static var description2: String { return L10n.tr("Localizable", "ThermalCameraOnboardingView.description2", fallback: "Enfoca la cámara hacia el área u objeto que deseas analizar y toma una foto o graba un video.\n\nObserva las diferencias de temperatura visualizadas en colores, desde los tonos más fríos (azules) a los más cálidos (rojos).") }
    /// Comenzar
    internal static var start: String { return L10n.tr("Localizable", "ThermalCameraOnboardingView.start", fallback: "Comenzar") }
    /// Thermal Camera
    internal static var title: String { return L10n.tr("Localizable", "ThermalCameraOnboardingView.title", fallback: "Thermal Camera") }
  }
  internal enum TimeTabView {
    internal enum Desde {
      /// Desde
      internal static var title: String { return L10n.tr("Localizable", "TimeTabView.Desde.title", fallback: "Desde") }
    }
    internal enum Hasta {
      /// Hasta
      internal static var title: String { return L10n.tr("Localizable", "TimeTabView.Hasta.title", fallback: "Hasta") }
    }
  }
  internal enum TimedLoadingScreenView {
    /// Cargando...
    internal static var loading: String { return L10n.tr("Localizable", "TimedLoadingScreenView.loading", fallback: "Cargando...") }
  }
  internal enum Tooltip {
    /// Análisis técnico de una muestra biológica, por ejemplo, orina, cabello, sangre, aliento, sudor o fluido oral/saliva, para determinar la presencia o ausencia de drogas originales específicas o sus metabolitos.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static var alcoholDrugTest: String { return L10n.tr("Localizable", "Tooltip.AlcoholDrugTest", fallback: "Análisis técnico de una muestra biológica, por ejemplo, orina, cabello, sangre, aliento, sudor o fluido oral/saliva, para determinar la presencia o ausencia de drogas originales específicas o sus metabolitos.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.") }
    /// Analiza Instalaciones y Sistemas eléctricos, mediante un computador que mide incidencias en tu red, consumos indebidos, entre otros.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static var analizadorDeRedes: String { return L10n.tr("Localizable", "Tooltip.Analizador de Redes", fallback: "Analiza Instalaciones y Sistemas eléctricos, mediante un computador que mide incidencias en tu red, consumos indebidos, entre otros.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.") }
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    /// O también puedes ingresar el código que te envíe tu asistente de confianza.
    internal static var asistenciaRemota: String { return L10n.tr("Localizable", "Tooltip.AsistenciaRemota", fallback: "Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.\nO también puedes ingresar el código que te envíe tu asistente de confianza.") }
    /// Crea tu campaña publicitaria con Anuncios en Pantallas móviles.
    /// Aumenta tu ratio de ventas.
    /// Selecciona el área en el que necesites asistencia.
    /// Haz que tu negocio se vea en la calle.
    /// Accede a zonas impensables y gana visibilidad.
    internal static var backPackScreenADversiting: String { return L10n.tr("Localizable", "Tooltip.BackPackScreenADversiting", fallback: "Crea tu campaña publicitaria con Anuncios en Pantallas móviles.\nAumenta tu ratio de ventas.\nSelecciona el área en el que necesites asistencia.\nHaz que tu negocio se vea en la calle.\nAccede a zonas impensables y gana visibilidad.") }
    /// Regalate o regala a otros nuestras alucinantes cajas sorpresa.
    internal static var cajaSorpresa: String { return L10n.tr("Localizable", "Tooltip.CajaSorpresa", fallback: "Regalate o regala a otros nuestras alucinantes cajas sorpresa.") }
    /// Graba videos con visión 360º, o crea Gemelos Digitales, para formación o mantenimiento.
    internal static var camara360: String { return L10n.tr("Localizable", "Tooltip.Camara360", fallback: "Graba videos con visión 360º, o crea Gemelos Digitales, para formación o mantenimiento.") }
    /// Grabación certificada de Documentos,Videos y Navegación Online
    internal static var certifiedRecording: String { return L10n.tr("Localizable", "Tooltip.CertifiedRecording", fallback: "Grabación certificada de Documentos,Videos y Navegación Online") }
    /// Legaliza y protege tus derechos de autor, gratis(*) o de forma guiada.
    internal static var copyrights: String { return L10n.tr("Localizable", "Tooltip.Copyrights", fallback: "Legaliza y protege tus derechos de autor, gratis(*) o de forma guiada.") }
    /// Conecta y sincroniza tus CRM con WalkyCam,de forma segura. Comparte y almacena información en ambas plataformas.
    internal static var crm: String { return L10n.tr("Localizable", "Tooltip.CRM", fallback: "Conecta y sincroniza tus CRM con WalkyCam,de forma segura. Comparte y almacena información en ambas plataformas.") }
    /// Monedero de Criptomonedas: Opera sobre tus criptomonedas con total seguridad.
    internal static var cryptoWallet: String { return L10n.tr("Localizable", "Tooltip.CryptoWallet", fallback: "Monedero de Criptomonedas: Opera sobre tus criptomonedas con total seguridad.") }
    /// Mediante ondas electromagnéticas detecta y mapea, cables eléctricos y tuberías, enterrados hasta una profundidad de 7 mt con total precisión.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static var detectorCables: String { return L10n.tr("Localizable", "Tooltip.DetectorCables", fallback: "Mediante ondas electromagnéticas detecta y mapea, cables eléctricos y tuberías, enterrados hasta una profundidad de 7 mt con total precisión.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.") }
    /// Encuentra tu anillo perdido.
    /// Puedes enviar a un experto a buscar por ti.
    /// Descubre increíbles tesoros desde la comodidad de tu hogar u oficina.
    internal static var detectorMetales: String { return L10n.tr("Localizable", "Tooltip.DetectorMetales", fallback: "Encuentra tu anillo perdido.\nPuedes enviar a un experto a buscar por ti.\nDescubre increíbles tesoros desde la comodidad de tu hogar u oficina.") }
    /// Representación virtual de un objeto o sistema que abarca su ciclo de vida, se actualiza a partir de datos en tiempo real y utiliza simulación, machine learning y razonamiento para ayudar en la toma de decisiones.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static var digitalTwins: String { return L10n.tr("Localizable", "Tooltip.DigitalTwins", fallback: "Representación virtual de un objeto o sistema que abarca su ciclo de vida, se actualiza a partir de datos en tiempo real y utiliza simulación, machine learning y razonamiento para ayudar en la toma de decisiones.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.") }
    /// Robot con forma de perro que utiliza sensores con (IA) para moverse e interaccionar con personas y objetos.
    /// Puede prestar ayuda en emergencias o como acompañante de personas dependientes, también puede monitorizar datos de su entorno de forma remota.
    internal static var dogRobot: String { return L10n.tr("Localizable", "Tooltip.DogRobot", fallback: "Robot con forma de perro que utiliza sensores con (IA) para moverse e interaccionar con personas y objetos.\nPuede prestar ayuda en emergencias o como acompañante de personas dependientes, también puede monitorizar datos de su entorno de forma remota.") }
    /// Tu provadro de ropa virtual, con grandes ofertas.
    internal static var dressProve: String { return L10n.tr("Localizable", "Tooltip.DressProve", fallback: "Tu provadro de ropa virtual, con grandes ofertas.") }
    /// Tu eliges donde grabar tus videos y/o capturar imágenes.
    /// Nosotros pilotamos por ti.
    /// Utiliza drones en tu cultivo: mapeo de campos, IOT, vigilancia y monitoreo de los cultivos, agricultura ecológica.
    /// Contamos con profesionales acreditados y con experiencia. Tu WalkCamer te guiará.
    internal static var droneFly: String { return L10n.tr("Localizable", "Tooltip.Drone Fly", fallback: "Tu eliges donde grabar tus videos y/o capturar imágenes.\nNosotros pilotamos por ti.\nUtiliza drones en tu cultivo: mapeo de campos, IOT, vigilancia y monitoreo de los cultivos, agricultura ecológica.\nContamos con profesionales acreditados y con experiencia. Tu WalkCamer te guiará.") }
    /// Ecografías a distancia efectuadas por profesionales.
    /// Llegamos a donde menos te lo esperas, con equipos de primera calidad.
    /// Consigue una segunda opinión
    /// Podrás ver las imágenes en directo.
    internal static var ecografía: String { return L10n.tr("Localizable", "Tooltip.Ecografía", fallback: "Ecografías a distancia efectuadas por profesionales.\nLlegamos a donde menos te lo esperas, con equipos de primera calidad.\nConsigue una segunda opinión\nPodrás ver las imágenes en directo.") }
    /// Consultores en ingeniería para resolver tus dudas, de legalizaciones, instalaciones, obras, etc
    internal static var engineering: String { return L10n.tr("Localizable", "Tooltip.Engineering", fallback: "Consultores en ingeniería para resolver tus dudas, de legalizaciones, instalaciones, obras, etc") }
    /// Consigue tu sueño una videollamada de tu famoso/a preferido/a.
    internal static var famosos: String { return L10n.tr("Localizable", "Tooltip.Famosos", fallback: "Consigue tu sueño una videollamada de tu famoso/a preferido/a.") }
    /// Conviertete en director/a de cine, crea tus propias películas con efectos y diálogos, gracias a nuestra AI.
    internal static var filmMaker: String { return L10n.tr("Localizable", "Tooltip.FilmMaker", fallback: "Conviertete en director/a de cine, crea tus propias películas con efectos y diálogos, gracias a nuestra AI.") }
    /// Juega a miles de videojuegos, gratis y de pago, en local o en linea.
    internal static var games: String { return L10n.tr("Localizable", "Tooltip.Games", fallback: "Juega a miles de videojuegos, gratis y de pago, en local o en linea.") }
    /// Radar de Penetración de Suelo:
    /// Permite Mapear y localizar estructuras y objetos enterrados en el subsuelo.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static var georadar: String { return L10n.tr("Localizable", "Tooltip.Georadar", fallback: "Radar de Penetración de Suelo:\nPermite Mapear y localizar estructuras y objetos enterrados en el subsuelo.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.") }
    /// Pruebate los ultimos modelos de gafas y obten grandes descuentos.
    internal static var glassesProve: String { return L10n.tr("Localizable", "Tooltip.Glasses Prove", fallback: "Pruebate los ultimos modelos de gafas y obten grandes descuentos.") }
    /// Monta tus mejores juegos de busqueda del tesoro con nosotros en ubicaciones increibles o en streaming. Participa y pasalo bien en grupo o desde casa.
    internal static var gymkhana: String { return L10n.tr("Localizable", "Tooltip.Gymkhana", fallback: "Monta tus mejores juegos de busqueda del tesoro con nosotros en ubicaciones increibles o en streaming. Participa y pasalo bien en grupo o desde casa.") }
    /// Pruebate los más atrevedidos peinados, y reserva cita en una de nuestras peluquerías.
    internal static var hairProve: String { return L10n.tr("Localizable", "Tooltip.HairProve", fallback: "Pruebate los más atrevedidos peinados, y reserva cita en una de nuestras peluquerías.") }
    /// Motor de AI entrenado sobre tus datos y tu comportamiento de uso dentro de WalkyCam.
    /// Por única vez, antes de iniciar es necesario integrar y permitir accesos para poder ofrecer mejores recomendaciones, ahorrar trabajo y ofrecer soluciones/ alternativas a los problemas.
    internal static var iaDataAnalysis: String { return L10n.tr("Localizable", "Tooltip.IADataAnalysis", fallback: "Motor de AI entrenado sobre tus datos y tu comportamiento de uso dentro de WalkyCam.\nPor única vez, antes de iniciar es necesario integrar y permitir accesos para poder ofrecer mejores recomendaciones, ahorrar trabajo y ofrecer soluciones/ alternativas a los problemas.") }
    /// Registra tu know how de negocio con nosotros y pruebalo en privado o en publico.
    internal static var ideaNegocio: String { return L10n.tr("Localizable", "Tooltip.IdeaNegocio", fallback: "Registra tu know how de negocio con nosotros y pruebalo en privado o en publico.") }
    /// Elige entre Farming, Industry, Agriculture, Fleet, Retail, Smart City y mucho más!
    /// Selecciona los sensores indicando su valor.
    /// Localiza tu WalkCamer más cercano y gestiona tu IOT.
    internal static var iot: String { return L10n.tr("Localizable", "Tooltip.IOT", fallback: "Elige entre Farming, Industry, Agriculture, Fleet, Retail, Smart City y mucho más!\nSelecciona los sensores indicando su valor.\nLocaliza tu WalkCamer más cercano y gestiona tu IOT.") }
    /// Disfruta de un karaoke en streaming con tu familia y amigos.
    internal static var karaoke: String { return L10n.tr("Localizable", "Tooltip.Karaoke", fallback: "Disfruta de un karaoke en streaming con tu familia y amigos.") }
    /// Consultores legales para resolver tus dudas, sobre temas laborales, fiscales, contables, etc
    internal static var lawyer: String { return L10n.tr("Localizable", "Tooltip.Lawyer", fallback: "Consultores legales para resolver tus dudas, sobre temas laborales, fiscales, contables, etc") }
    /// Mapea y digitaliza áreas en contrucción o descubre lo que hay debajo de la selva.
    /// Vive la magia del escaneado con laser mediante la técnica LIDAR
    internal static var lidar: String { return L10n.tr("Localizable", "Tooltip.LIDAR", fallback: "Mapea y digitaliza áreas en contrucción o descubre lo que hay debajo de la selva.\nVive la magia del escaneado con laser mediante la técnica LIDAR") }
    /// Envía un servicio de cantantes o mariachis a domicilio, para cumpleaños, bromas etc.
    internal static var mariachis: String { return L10n.tr("Localizable", "Tooltip.Mariachis", fallback: "Envía un servicio de cantantes o mariachis a domicilio, para cumpleaños, bromas etc.") }
    /// Expon tu propio show room de productos y envía muestras a tus clientes.
    internal static var muestraProductos: String { return L10n.tr("Localizable", "Tooltip.MuestraProductos", fallback: "Expon tu propio show room de productos y envía muestras a tus clientes.") }
    /// Crea NFT’s de tu arte digital o descubre nuevos NFT’s en nuestra tienda.
    internal static var nft: String { return L10n.tr("Localizable", "Tooltip.NFT", fallback: "Crea NFT’s de tu arte digital o descubre nuevos NFT’s en nuestra tienda.") }
    /// Te ayudamos a presentar tus patentes de invención,o nos hacemos socios si así lo deseas.
    internal static var patenteInvención: String { return L10n.tr("Localizable", "Tooltip.PatenteInvención", fallback: "Te ayudamos a presentar tus patentes de invención,o nos hacemos socios si así lo deseas.") }
    /// Si no tienes tiempo, compramos lo que necesites para ti, y te lo llevamos a casa o a donde tu quieras, todo ello en streaming.
    internal static var personalShopper: String { return L10n.tr("Localizable", "Tooltip.PersonalShopper", fallback: "Si no tienes tiempo, compramos lo que necesites para ti, y te lo llevamos a casa o a donde tu quieras, todo ello en streaming.") }
    /// Su privacidad es importante para nosotros.
    /// Para cuidar su privacidad, WalkyCam da la posibilidad de pixelar el rostro de las personas y placas de autos que puedan aparecer en una transmisión.
    /// WalkyCam no se responsabiliza por las imagenes que se transmiten ni por la grabación realizada.
    internal static var pixelationFaces: String { return L10n.tr("Localizable", "Tooltip.PixelationFaces", fallback: "Su privacidad es importante para nosotros.\nPara cuidar su privacidad, WalkyCam da la posibilidad de pixelar el rostro de las personas y placas de autos que puedan aparecer en una transmisión.\nWalkyCam no se responsabiliza por las imagenes que se transmiten ni por la grabación realizada.") }
    /// Una vez escaneado, puedes editar el color y el tamaño.
    /// Elige la forma de envío más adecuada.
    /// Elegir el material y el acabado del objeto antes de enviarlo a imprimir en 3D.
    /// Disfruta de nuestro envio VIP, envíos frecuentes, y mucho más!
    internal static var print3D: String { return L10n.tr("Localizable", "Tooltip.Print3D", fallback: "Una vez escaneado, puedes editar el color y el tamaño.\nElige la forma de envío más adecuada.\nElegir el material y el acabado del objeto antes de enviarlo a imprimir en 3D.\nDisfruta de nuestro envio VIP, envíos frecuentes, y mucho más!") }
    /// Participa en carreras en grupo por streaming, o ponle una pulsera a tu mascota.
    internal static var pulseraFitness: String { return L10n.tr("Localizable", "Tooltip.PulseraFitness", fallback: "Participa en carreras en grupo por streaming, o ponle una pulsera a tu mascota.") }
    /// Convierte tu Laptop o tú móvil, en un show de luces de colores, mientras escuchas tu música favorita.
    internal static var rgbBulbParty: String { return L10n.tr("Localizable", "Tooltip.RGBBulbParty.", fallback: "Convierte tu Laptop o tú móvil, en un show de luces de colores, mientras escuchas tu música favorita.") }
    /// Vigila, Entrena o Alimenta a tus mascotas a distancia.
    /// Podrás controlar sus movimientos y su estado general, desde la comodidad de tu móvil.
    internal static var robóticaMascotas: String { return L10n.tr("Localizable", "Tooltip.RobóticaMascotas", fallback: "Vigila, Entrena o Alimenta a tus mascotas a distancia.\nPodrás controlar sus movimientos y su estado general, desde la comodidad de tu móvil.") }
    /// Robot de vídeo online que permite que varios interlocutores se comuniquen.
    /// Desplázate por ferias y eventos como si estuvieras alli.
    /// Interactúa comercialmente o da clases y conferencias a distancia, mientras te mueves por el entorno.
    internal static var robóticaTelepresencia: String { return L10n.tr("Localizable", "Tooltip.RobóticaTelepresencia", fallback: "Robot de vídeo online que permite que varios interlocutores se comuniquen.\nDesplázate por ferias y eventos como si estuvieras alli.\nInteractúa comercialmente o da clases y conferencias a distancia, mientras te mueves por el entorno.") }
    /// Nuestros R.O.V. Drones Submarinos, serán controlados por WalkCamers especialistas.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    /// Sumerjete en aguas profundas y graba tus propios videos, con nuestros R.O.V. Drones Submarinos.
    /// Podrás usar su brazo robot, para recoger muestras, o manipular objetos.
    /// Los equipos van desde un simple R.O.V. para grabar video, hasta equipos de aguas profundas para la industria naval y la investigación científica
    internal static var rovDrone: String { return L10n.tr("Localizable", "Tooltip.ROVDrone", fallback: "Nuestros R.O.V. Drones Submarinos, serán controlados por WalkCamers especialistas.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.\nSumerjete en aguas profundas y graba tus propios videos, con nuestros R.O.V. Drones Submarinos.\nPodrás usar su brazo robot, para recoger muestras, o manipular objetos.\nLos equipos van desde un simple R.O.V. para grabar video, hasta equipos de aguas profundas para la industria naval y la investigación científica") }
    /// Crea modelos 3D de objetos reales a partir de fotografías.
    /// Solicita un WalkCamer para efectuar el Scan 3D por ti, a distancia.
    /// Una vez escaneado, puedes editar color, tamaño y forma de la imagen escaneada del objeto. Realiza una impresión 3D del objeto y recibe el objeto.
    internal static var scan3D: String { return L10n.tr("Localizable", "Tooltip.Scan3D", fallback: "Crea modelos 3D de objetos reales a partir de fotografías.\nSolicita un WalkCamer para efectuar el Scan 3D por ti, a distancia.\nUna vez escaneado, puedes editar color, tamaño y forma de la imagen escaneada del objeto. Realiza una impresión 3D del objeto y recibe el objeto.") }
    /// Monta las mejores fiestas de Scape Room, online o en una casa real.
    internal static var scapeRoom: String { return L10n.tr("Localizable", "Tooltip.ScapeRoom", fallback: "Monta las mejores fiestas de Scape Room, online o en una casa real.") }
    /// Conéctate con el mundo.
    /// Indica la zona a grabar.
    /// Elige un WalkCamer acorde a tus requerimientos
    /// Tu WalkCamer aceptará la invitación para iniciar la videollamada.
    internal static var streetCam: String { return L10n.tr("Localizable", "Tooltip.StreetCam", fallback: "Conéctate con el mundo.\nIndica la zona a grabar.\nElige un WalkCamer acorde a tus requerimientos\nTu WalkCamer aceptará la invitación para iniciar la videollamada.") }
    /// Detecta y visualiza el calor emitido por objetos y personas
    /// Problemas eléctricos y de aislamiento térmico
    internal static var thermalCamera: String { return L10n.tr("Localizable", "Tooltip.ThermalCamera", fallback: "Detecta y visualiza el calor emitido por objetos y personas\nProblemas eléctricos y de aislamiento térmico") }
    /// Crea una nueva reunión o programa para otro día.
    /// También puedes unirte a una reunión ingresando el código que te han compartido.
    internal static var videoCall: String { return L10n.tr("Localizable", "Tooltip.VideoCall", fallback: "Crea una nueva reunión o programa para otro día.\nTambién puedes unirte a una reunión ingresando el código que te han compartido.") }
  }
  internal enum UnavailableFeatureView {
    /// Ir a Home
    internal static var goHome: String { return L10n.tr("Localizable", "UnavailableFeatureView.goHome", fallback: "Ir a Home") }
    /// ¡Ups! Parece que esta función aún no está disponible
    internal static var message: String { return L10n.tr("Localizable", "UnavailableFeatureView.message", fallback: "¡Ups! Parece que esta función aún no está disponible") }
  }
  internal enum VideoCallView {
    /// Videollamada
    internal static var title: String { return L10n.tr("Localizable", "VideoCallView.title", fallback: "Videollamada") }
    internal enum Join {
      /// Unirme
      internal static var button: String { return L10n.tr("Localizable", "VideoCallView.join.button", fallback: "Unirme") }
      /// Ingresa el código que has recebido.
      internal static var description: String { return L10n.tr("Localizable", "VideoCallView.join.description", fallback: "Ingresa el código que has recebido.") }
      /// Ingresar código
      internal static var inputPlaceholder: String { return L10n.tr("Localizable", "VideoCallView.join.inputPlaceholder", fallback: "Ingresar código") }
      /// UNIRSE
      internal static var title: String { return L10n.tr("Localizable", "VideoCallView.join.title", fallback: "UNIRSE") }
    }
    internal enum New {
      /// Crear
      internal static var button: String { return L10n.tr("Localizable", "VideoCallView.new.button", fallback: "Crear") }
      /// Crea una nueva para compartir.
      internal static var description: String { return L10n.tr("Localizable", "VideoCallView.new.description", fallback: "Crea una nueva para compartir.") }
      /// NUEVA
      internal static var title: String { return L10n.tr("Localizable", "VideoCallView.new.title", fallback: "NUEVA") }
    }
    internal enum Schedule {
      /// Programar
      internal static var button: String { return L10n.tr("Localizable", "VideoCallView.schedule.button", fallback: "Programar") }
      /// Programar con anterioridad.
      internal static var description: String { return L10n.tr("Localizable", "VideoCallView.schedule.description", fallback: "Programar con anterioridad.") }
      /// PROGRAMAR
      internal static var title: String { return L10n.tr("Localizable", "VideoCallView.schedule.title", fallback: "PROGRAMAR") }
    }
  }
  internal enum VideocallOnboardingView {
    internal enum Comenzar {
      /// Comenzar
      internal static var title: String { return L10n.tr("Localizable", "VideocallOnboardingView.Comenzar.title", fallback: "Comenzar") }
    }
    internal enum Page {
      /// Crea una nueva reunión o programa para otro dia.
      /// 
      /// También puedes unirte a una reunión ingresando el código que te han compartido.
      internal static var subtitle: String { return L10n.tr("Localizable", "VideocallOnboardingView.Page.subtitle", fallback: "Crea una nueva reunión o programa para otro dia.\n\nTambién puedes unirte a una reunión ingresando el código que te han compartido.") }
      /// Videollamada
      internal static var title: String { return L10n.tr("Localizable", "VideocallOnboardingView.Page.title", fallback: "Videollamada") }
    }
    internal enum Salir {
      /// Salir
      internal static var title: String { return L10n.tr("Localizable", "VideocallOnboardingView.Salir.title", fallback: "Salir") }
    }
  }
  internal enum VideocallTimeTabView {
    /// Duración
    internal static var duration: String { return L10n.tr("Localizable", "VideocallTimeTabView.duration", fallback: "Duración") }
    /// Selecciona una duración
    internal static var durationSelection: String { return L10n.tr("Localizable", "VideocallTimeTabView.durationSelection", fallback: "Selecciona una duración") }
    /// Hora
    internal static var time: String { return L10n.tr("Localizable", "VideocallTimeTabView.time", fallback: "Hora") }
    internal enum Duration {
      /// 120 minutos
      internal static var _120Minutes: String { return L10n.tr("Localizable", "VideocallTimeTabView.duration.120Minutes", fallback: "120 minutos") }
      /// 40 minutos
      internal static var _40Minutes: String { return L10n.tr("Localizable", "VideocallTimeTabView.duration.40Minutes", fallback: "40 minutos") }
      /// 60 minutos
      internal static var _60Minutes: String { return L10n.tr("Localizable", "VideocallTimeTabView.duration.60Minutes", fallback: "60 minutos") }
      /// 90 minutos
      internal static var _90Minutes: String { return L10n.tr("Localizable", "VideocallTimeTabView.duration.90Minutes", fallback: "90 minutos") }
    }
  }
  internal enum WalkyBotView {
    /// ¿Qué hacemos hoy?
    internal static var text: String { return L10n.tr("Localizable", "WalkyBotView.text", fallback: "¿Qué hacemos hoy?") }
    internal enum Header {
      /// Asistente automático
      internal static var subtitle: String { return L10n.tr("Localizable", "WalkyBotView.header.subtitle", fallback: "Asistente automático") }
      /// Walky Bot FAQ's
      internal static var title: String { return L10n.tr("Localizable", "WalkyBotView.header.title", fallback: "Walky Bot FAQ's") }
    }
    internal enum Input {
      /// Escribe aquí...
      internal static var placeholder: String { return L10n.tr("Localizable", "WalkyBotView.input.placeholder", fallback: "Escribe aquí...") }
    }
  }
  internal enum WalkyCamerOnboardingView {
    internal enum Page1 {
      /// 1. Indica la zona a grabar.
      /// 
      /// 2. Elige un WalkCamer acorde con tus necesidades.
      /// 
      /// 3. Tu WalkCamer aceptará la invitación para iniciar la videollamada.
      internal static var subtitle: String { return L10n.tr("Localizable", "WalkyCamerOnboardingView.Page1.subtitle", fallback: "1. Indica la zona a grabar.\n\n2. Elige un WalkCamer acorde con tus necesidades.\n\n3. Tu WalkCamer aceptará la invitación para iniciar la videollamada.") }
      /// Conéctate con el mundo
      internal static var title: String { return L10n.tr("Localizable", "WalkyCamerOnboardingView.Page1.title", fallback: "Conéctate con el mundo") }
    }
    internal enum Page2 {
      /// Para cuidar su privacidad, WalkyCam ofrece la posibilidad de pixelar el rostro de las personas y las placas de los autos que puedan aparecer en una transmisión.
      internal static var subtitle1: String { return L10n.tr("Localizable", "WalkyCamerOnboardingView.Page2.subtitle1", fallback: "Para cuidar su privacidad, WalkyCam ofrece la posibilidad de pixelar el rostro de las personas y las placas de los autos que puedan aparecer en una transmisión.") }
      /// WalkyCam no se responsabiliza por las imagenes que se transmiten ni por la grabación realizada.
      internal static var subtitle2: String { return L10n.tr("Localizable", "WalkyCamerOnboardingView.Page2.subtitle2", fallback: "WalkyCam no se responsabiliza por las imagenes que se transmiten ni por la grabación realizada.") }
      /// Su privacidad es importante para nosotros
      internal static var title: String { return L10n.tr("Localizable", "WalkyCamerOnboardingView.Page2.title", fallback: "Su privacidad es importante para nosotros") }
    }
    internal enum Button {
      /// Salir
      internal static var exit: String { return L10n.tr("Localizable", "WalkyCamerOnboardingView.button.exit", fallback: "Salir") }
      /// Buscar WalkCamer
      internal static var search: String { return L10n.tr("Localizable", "WalkyCamerOnboardingView.button.search", fallback: "Buscar WalkCamer") }
    }
  }
  internal enum WalkyCammerListView {
    internal enum BuscarWalkCamer {
      /// Buscar WalkCamer
      internal static var placeholder: String { return L10n.tr("Localizable", "WalkyCammerListView.BuscarWalkCamer.placeholder", fallback: "Buscar WalkCamer") }
    }
    internal enum WalkCamersDisponibles {
      /// WalkCamers
      /// disponibles
      internal static var title: String { return L10n.tr("Localizable", "WalkyCammerListView.WalkCamersDisponibles.title", fallback: "WalkCamers\ndisponibles") }
    }
  }
  internal enum Copyright {
    /// @WalkyCam 2021 - All reserved copyright
    internal static var text: String { return L10n.tr("Localizable", "copyright.text", fallback: "@WalkyCam 2021 - All reserved copyright") }
  }
  internal enum ErrorView {
    internal enum Generic {
      /// Intentar otra vez
      internal static var buttonTitle: String { return L10n.tr("Localizable", "errorView.generic.buttonTitle", fallback: "Intentar otra vez") }
      /// Por alguna razón la información no cargó
      internal static var description: String { return L10n.tr("Localizable", "errorView.generic.description", fallback: "Por alguna razón la información no cargó") }
      /// retry
      internal static var icon: String { return L10n.tr("Localizable", "errorView.generic.icon", fallback: "retry") }
      /// Ops! Algo salió mal
      internal static var message: String { return L10n.tr("Localizable", "errorView.generic.message", fallback: "Ops! Algo salió mal") }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = switchLocalizationBundleDuringRuntime(forKey:table:fallbackValue:)(key, table, value)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
