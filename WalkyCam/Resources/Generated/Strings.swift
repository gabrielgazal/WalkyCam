// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum CashWalletOnboardingView {
    internal enum Button {
      /// Continuar
      internal static let next = L10n.tr("Localizable", "CashWalletOnboardingView.Button.next", fallback: "Continuar")
      /// Omitir
      internal static let skip = L10n.tr("Localizable", "CashWalletOnboardingView.Button.skip", fallback: "Omitir")
      /// Ingresar
      internal static let start = L10n.tr("Localizable", "CashWalletOnboardingView.Button.start", fallback: "Ingresar")
    }
    internal enum Page1 {
      /// Tu dinero de curso legal (Dinero FIAT), accede a tus cuentas bancarias y efectúa o recibe transferencias, con la máxima seguridad.
      internal static let subtitle = L10n.tr("Localizable", "CashWalletOnboardingView.Page1.subtitle", fallback: "Tu dinero de curso legal (Dinero FIAT), accede a tus cuentas bancarias y efectúa o recibe transferencias, con la máxima seguridad.")
      /// Cash Wallet
      internal static let title = L10n.tr("Localizable", "CashWalletOnboardingView.Page1.title", fallback: "Cash Wallet")
    }
    internal enum Page2 {
      /// Monedero de Criptomonedas: Opera sobre tus criptomonedas con total seguridad.
      internal static let subtitle = L10n.tr("Localizable", "CashWalletOnboardingView.Page2.subtitle", fallback: "Monedero de Criptomonedas: Opera sobre tus criptomonedas con total seguridad.")
      /// Crypto Wallet
      internal static let title = L10n.tr("Localizable", "CashWalletOnboardingView.Page2.title", fallback: "Crypto Wallet")
    }
  }
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
      /// Quiero ser WalkCamer
      internal static let walkycamer = L10n.tr("Localizable", "ProfileView.convert.walkycamer", fallback: "Quiero ser WalkCamer")
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
  internal enum Tooltip {
    /// 
    internal static let _360ºCamera = L10n.tr("Localizable", "Tooltip.360º Camera", fallback: "")
    /// Análisis técnico de una muestra biológica, por ejemplo, orina, cabello, sangre, aliento, sudor o fluido oral/saliva, para determinar la presencia o ausencia de drogas originales específicas o sus metabolitos. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static let alcoholDrugTest = L10n.tr("Localizable", "Tooltip.Alcohol & Drug test", fallback: "Análisis técnico de una muestra biológica, por ejemplo, orina, cabello, sangre, aliento, sudor o fluido oral/saliva, para determinar la presencia o ausencia de drogas originales específicas o sus metabolitos. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.")
    /// Analiza Instalaciones y Sistemas eléctricos, mediante un computador que mide incidencias en tu red, consumos indebidos, entre otros. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static let analizadorDeRedes = L10n.tr("Localizable", "Tooltip.Analizador de redes", fallback: "Analiza Instalaciones y Sistemas eléctricos, mediante un computador que mide incidencias en tu red, consumos indebidos, entre otros. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.")
    /// 
    internal static let arHands = L10n.tr("Localizable", "Tooltip.AR Hands", fallback: "")
    /// 
    internal static let certifiedRecording = L10n.tr("Localizable", "Tooltip.Certified Recording", fallback: "")
    /// 
    internal static let cryptoWallet = L10n.tr("Localizable", "Tooltip.CryptoWallet", fallback: "")
    /// Mediante ondas electromagnéticas detecta y mapea, cables eléctricos y tuberías, enterrados hasta una profundidad de 7 mt con  total precisión. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static let detectorDeCables = L10n.tr("Localizable", "Tooltip.Detector de cables", fallback: "Mediante ondas electromagnéticas detecta y mapea, cables eléctricos y tuberías, enterrados hasta una profundidad de 7 mt con  total precisión. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.")
    /// Encuentra tu anillo perdido. Puedes enviar a un experto a buscar por ti. Descubre increíbles tesoros desde la comodidad de tu hogar u oficina.
    internal static let detectorDeMetales = L10n.tr("Localizable", "Tooltip.Detector de metales", fallback: "Encuentra tu anillo perdido. Puedes enviar a un experto a buscar por ti. Descubre increíbles tesoros desde la comodidad de tu hogar u oficina.")
    /// Representación virtual de un objeto o sistema que abarca su ciclo de vida, se actualiza a partir de datos en tiempo real y utiliza simulación, machine learning y razonamiento para ayudar en la toma de decisiones. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static let digitalTwin = L10n.tr("Localizable", "Tooltip.Digital Twin", fallback: "Representación virtual de un objeto o sistema que abarca su ciclo de vida, se actualiza a partir de datos en tiempo real y utiliza simulación, machine learning y razonamiento para ayudar en la toma de decisiones. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.")
    /// Robot con forma de perro que utiliza sensores con (IA) para moverse e interaccionar con personas y objetos. Puede prestar ayuda en emergencias o como acompañante de personas dependientes, también puede monitorizar datos de su entorno de forma remota.
    internal static let dogRobot = L10n.tr("Localizable", "Tooltip.Dog Robot", fallback: "Robot con forma de perro que utiliza sensores con (IA) para moverse e interaccionar con personas y objetos. Puede prestar ayuda en emergencias o como acompañante de personas dependientes, también puede monitorizar datos de su entorno de forma remota.")
    /// Tu eliges donde grabar tus videos y/o capturar imágenes. Nosotros pilotamos por ti. Utiliza drones en tu cultivo: mapeo de campos, IOT, vigilancia y monitoreo de los cultivos, agricultura ecológica. Contamos con profesionales acreditados y con experiencia. Tu WalkCamer te guiará.
    internal static let droneFly = L10n.tr("Localizable", "Tooltip.Drone Fly", fallback: "Tu eliges donde grabar tus videos y/o capturar imágenes. Nosotros pilotamos por ti. Utiliza drones en tu cultivo: mapeo de campos, IOT, vigilancia y monitoreo de los cultivos, agricultura ecológica. Contamos con profesionales acreditados y con experiencia. Tu WalkCamer te guiará.")
    /// Ecografías a distancia efectuadas por profesionales. Llegamos a donde menos te lo esperas, con equipos de primera calidad. Consigue una segunda opinión Podrás ver las imágenes en directo.
    internal static let ecografía = L10n.tr("Localizable", "Tooltip.Ecografía", fallback: "Ecografías a distancia efectuadas por profesionales. Llegamos a donde menos te lo esperas, con equipos de primera calidad. Consigue una segunda opinión Podrás ver las imágenes en directo.")
    /// Radar de Penetración de Suelo: Permite Mapear y localizar estructuras y objetos enterrados en el subsuelo. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static let georradar = L10n.tr("Localizable", "Tooltip.Georradar", fallback: "Radar de Penetración de Suelo: Permite Mapear y localizar estructuras y objetos enterrados en el subsuelo. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.")
    /// Motor de AI entrenado sobre tus datos y tu comportamiento de uso dentro de WalkyCam. Por única vez, antes de iniciar es necesario integrar y permitir accesos para poder ofrecer mejores recomendaciones, ahorrar trabajo y ofrecer soluciones/ alternativas a los problemas.
    internal static let iaDataAnalysis = L10n.tr("Localizable", "Tooltip.IA & Data Analysis", fallback: "Motor de AI entrenado sobre tus datos y tu comportamiento de uso dentro de WalkyCam. Por única vez, antes de iniciar es necesario integrar y permitir accesos para poder ofrecer mejores recomendaciones, ahorrar trabajo y ofrecer soluciones/ alternativas a los problemas.")
    /// Elige entre Farming, Industry, Agriculture, Fleet, Retail, Smart City y mucho más! Selecciona los sensores indicando su valor. Localiza tu WalkCamer más cercano y gestiona tu IOT.
    internal static let iotApplicationsDataAnalysis = L10n.tr("Localizable", "Tooltip.IOT applications & Data analysis", fallback: "Elige entre Farming, Industry, Agriculture, Fleet, Retail, Smart City y mucho más! Selecciona los sensores indicando su valor. Localiza tu WalkCamer más cercano y gestiona tu IOT.")
    /// 
    internal static let juegosYOtros = L10n.tr("Localizable", "Tooltip.Juegos y otros", fallback: "")
    /// 
    internal static let linkToCRMERP = L10n.tr("Localizable", "Tooltip.Link to CRM/ERP", fallback: "")
    /// 
    internal static let nftPictures = L10n.tr("Localizable", "Tooltip.NFT (Pictures)", fallback: "")
    /// Su privacidad es importante para nosotros. Para cuidar su privacidad, WalkyCam da la posibilidad de pixelar el rostro de las personas y placas de autos que puedan aparecer en una transmisión. WalkyCam no se responsabiliza por las imagenes que se transmiten ni por la grabación realizada.
    internal static let pixelationFaces = L10n.tr("Localizable", "Tooltip.Pixelation Faces", fallback: "Su privacidad es importante para nosotros. Para cuidar su privacidad, WalkyCam da la posibilidad de pixelar el rostro de las personas y placas de autos que puedan aparecer en una transmisión. WalkyCam no se responsabiliza por las imagenes que se transmiten ni por la grabación realizada.")
    /// 
    internal static let robótica = L10n.tr("Localizable", "Tooltip.Robótica", fallback: "")
    /// Vigila, Entrena o Alimenta a tus mascotas a distancia. Podrás controlar sus movimientos y su estado general, desde la comodidad de tu móvil.
    internal static let robóticaParaMascotas = L10n.tr("Localizable", "Tooltip.Robótica para Mascotas", fallback: "Vigila, Entrena o Alimenta a tus mascotas a distancia. Podrás controlar sus movimientos y su estado general, desde la comodidad de tu móvil.")
    /// Robot de vídeo online que permite que varios interlocutores se comuniquen. Desplázate por ferias y eventos como si estuvieras alli. Interactúa comercialmente o da clases y conferencias a distancia, mientras te mueves por el entorno.
    internal static let robóticaTelepresencia = L10n.tr("Localizable", "Tooltip.Robótica Telepresencia", fallback: "Robot de vídeo online que permite que varios interlocutores se comuniquen. Desplázate por ferias y eventos como si estuvieras alli. Interactúa comercialmente o da clases y conferencias a distancia, mientras te mueves por el entorno.")
    /// Mapea y digitaliza áreas en contrucción o descubre lo que hay debajo de la selva. Vive la magia del escaneado con laser mediante la técnica LIDAR
    internal static let rotoLIDARScan = L10n.tr("Localizable", "Tooltip.Roto LIDAR Scan", fallback: "Mapea y digitaliza áreas en contrucción o descubre lo que hay debajo de la selva. Vive la magia del escaneado con laser mediante la técnica LIDAR")
    /// Crea modelos 3D de objetos reales a partir de fotografías. Solicita un WalkCamer para efectuar el Scan 3D por ti, a distancia. Una vez escaneado, puedes editar color, tamaño y forma de la imagen escaneada del objeto. Realiza una impresión 3D del objeto y recibe el objeto.
    internal static let scan3D = L10n.tr("Localizable", "Tooltip.Scan 3D", fallback: "Crea modelos 3D de objetos reales a partir de fotografías. Solicita un WalkCamer para efectuar el Scan 3D por ti, a distancia. Una vez escaneado, puedes editar color, tamaño y forma de la imagen escaneada del objeto. Realiza una impresión 3D del objeto y recibe el objeto.")
    /// Conéctate con el mundo.
    /// 1. Indica la zona a grabar.
    /// 2. Elige un WalkCamer acorde a tus requerimientos
    /// 3. Tu WalkCamer aceptará la invitación para iniciar la videollamada.
    internal static let streetCamWalkCamer = L10n.tr("Localizable", "Tooltip.Street Cam (WalkCamer)", fallback: "Conéctate con el mundo.\n1. Indica la zona a grabar.\n2. Elige un WalkCamer acorde a tus requerimientos\n3. Tu WalkCamer aceptará la invitación para iniciar la videollamada.")
    /// 
    internal static let thermalCamara = L10n.tr("Localizable", "Tooltip.Thermal Camara", fallback: "")
    /// Crea una nueva reunión o programa para otro día.También puedes unirte a una reunión ingresando el código que te han compartido.
    internal static let videoCall200PersonasConDuraciónIlimitada = L10n.tr("Localizable", "Tooltip.Video Call: 200 Personas con duración ilimitada.", fallback: "Crea una nueva reunión o programa para otro día.También puedes unirte a una reunión ingresando el código que te han compartido.")
    internal enum R {
      internal enum O {
        internal enum V {
          /// Nuestros R.O.V. Drones Submarinos, serán controlados por WalkCamers especialistas. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados. Sumerjete en aguas profundas y graba tus propios videos, con nuestros R.O.V. Drones Submarinos. Podrás usar su brazo robot, para recoger muestras, o manipular objetos. Los equipos van desde un simple R.O.V. para grabar video, hasta equipos de aguas profundas para la industria naval y la investigación científica
          internal static let underwaterDrone = L10n.tr("Localizable", "Tooltip.R.O.V. Underwater Drone", fallback: "Nuestros R.O.V. Drones Submarinos, serán controlados por WalkCamers especialistas. Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados. Sumerjete en aguas profundas y graba tus propios videos, con nuestros R.O.V. Drones Submarinos. Podrás usar su brazo robot, para recoger muestras, o manipular objetos. Los equipos van desde un simple R.O.V. para grabar video, hasta equipos de aguas profundas para la industria naval y la investigación científica")
        }
      }
    }
  }
  internal enum VideocallOnboardingView {
    internal enum Page {
      /// Crea una nueva reunión o programa para otro dia.
      /// 
      /// También puedes unirte a una reunión ingresando el código que te han compartido.
      internal static let subtitle = L10n.tr("Localizable", "VideocallOnboardingView.Page.subtitle", fallback: "Crea una nueva reunión o programa para otro dia.\n\nTambién puedes unirte a una reunión ingresando el código que te han compartido.")
      /// Videollamada
      internal static let title = L10n.tr("Localizable", "VideocallOnboardingView.Page.title", fallback: "Videollamada")
    }
  }
  internal enum WalkyBotView {
    /// ¿Qué hacemos hoy?
    internal static let text = L10n.tr("Localizable", "WalkyBotView.text", fallback: "¿Qué hacemos hoy?")
  }
  internal enum WalkyCamerOnboardingView {
    internal enum Page1 {
      /// 1. Indica la zona a grabar.
      /// 
      /// 2. Elige un WalkCamer acorde con tus necesidades.
      /// 
      /// 3. Tu WalkCamer aceptará la invitación para iniciar la videollamada.
      internal static let subtitle = L10n.tr("Localizable", "WalkyCamerOnboardingView.Page1.subtitle", fallback: "1. Indica la zona a grabar.\n\n2. Elige un WalkCamer acorde con tus necesidades.\n\n3. Tu WalkCamer aceptará la invitación para iniciar la videollamada.")
      /// Conéctate con el mundo
      internal static let title = L10n.tr("Localizable", "WalkyCamerOnboardingView.Page1.title", fallback: "Conéctate con el mundo")
    }
    internal enum Page2 {
      /// Para cuidar su privacidad, WalkyCam ofrece la posibilidad de pixelar el rostro de las personas y las placas de los autos que puedan aparecer en una transmisión.
      internal static let subtitle1 = L10n.tr("Localizable", "WalkyCamerOnboardingView.Page2.subtitle1", fallback: "Para cuidar su privacidad, WalkyCam ofrece la posibilidad de pixelar el rostro de las personas y las placas de los autos que puedan aparecer en una transmisión.")
      /// WalkyCam no se responsabiliza por las imagenes que se transmiten ni por la grabación realizada.
      internal static let subtitle2 = L10n.tr("Localizable", "WalkyCamerOnboardingView.Page2.subtitle2", fallback: "WalkyCam no se responsabiliza por las imagenes que se transmiten ni por la grabación realizada.")
      /// Su privacidad es importante para nosotros
      internal static let title = L10n.tr("Localizable", "WalkyCamerOnboardingView.Page2.title", fallback: "Su privacidad es importante para nosotros")
    }
  }
  internal enum Copyright {
    /// @WalkyCam 2021 - All reserved copyright
    internal static let text = L10n.tr("Localizable", "copyright.text", fallback: "@WalkyCam 2021 - All reserved copyright")
  }
  internal enum ErrorView {
    internal enum Generic {
      /// Tentar novamente
      internal static let buttonTitle = L10n.tr("Localizable", "errorView.generic.buttonTitle", fallback: "Tentar novamente")
      /// Por algum motivo as informações não carregaram
      internal static let description = L10n.tr("Localizable", "errorView.generic.description", fallback: "Por algum motivo as informações não carregaram")
      /// retry
      internal static let icon = L10n.tr("Localizable", "errorView.generic.icon", fallback: "retry")
      /// Ops! Algo deu errado
      internal static let message = L10n.tr("Localizable", "errorView.generic.message", fallback: "Ops! Algo deu errado")
    }
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
