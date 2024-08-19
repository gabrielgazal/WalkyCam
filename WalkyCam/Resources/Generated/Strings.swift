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
    /// Análisis técnico de una muestra biológica, por ejemplo, orina, cabello, sangre, aliento, sudor o fluido oral/saliva, para determinar la presencia o ausencia de drogas originales específicas o sus metabolitos.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static let alcoholDrugTest = L10n.tr("Localizable", "Tooltip.AlcoholDrugTest", fallback: "Análisis técnico de una muestra biológica, por ejemplo, orina, cabello, sangre, aliento, sudor o fluido oral/saliva, para determinar la presencia o ausencia de drogas originales específicas o sus metabolitos.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.")
    /// Analiza Instalaciones y Sistemas eléctricos, mediante un computador que mide incidencias en tu red, consumos indebidos, entre otros.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static let analizadorDeRedes = L10n.tr("Localizable", "Tooltip.Analizador de Redes", fallback: "Analiza Instalaciones y Sistemas eléctricos, mediante un computador que mide incidencias en tu red, consumos indebidos, entre otros.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.")
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    /// O también puedes ingresar el código que te envíe tu asistente de confianza.
    internal static let asistenciaRemota = L10n.tr("Localizable", "Tooltip.AsistenciaRemota", fallback: "Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.\nO también puedes ingresar el código que te envíe tu asistente de confianza.")
    /// Crea tu campaña publicitaria con Anuncios en Pantallas móviles.
    /// Aumenta tu ratio de ventas.
    /// Selecciona el área en el que necesites asistencia.
    /// Haz que tu negocio se vea en la calle.
    /// Accede a zonas impensables y gana visibilidad.
    internal static let backPackScreenADversiting = L10n.tr("Localizable", "Tooltip.BackPackScreenADversiting", fallback: "Crea tu campaña publicitaria con Anuncios en Pantallas móviles.\nAumenta tu ratio de ventas.\nSelecciona el área en el que necesites asistencia.\nHaz que tu negocio se vea en la calle.\nAccede a zonas impensables y gana visibilidad.")
    /// Regalate o regala a otros nuestras alucinantes cajas sorpresa.
    internal static let cajaSorpresa = L10n.tr("Localizable", "Tooltip.CajaSorpresa", fallback: "Regalate o regala a otros nuestras alucinantes cajas sorpresa.")
    /// Graba videos con visión 360º, o crea Gemelos Digitales, para formación o mantenimiento.
    internal static let camara360 = L10n.tr("Localizable", "Tooltip.Camara360", fallback: "Graba videos con visión 360º, o crea Gemelos Digitales, para formación o mantenimiento.")
    /// Grabación certificada de Documentos,Videos y Navegación Online
    internal static let certifiedRecording = L10n.tr("Localizable", "Tooltip.CertifiedRecording", fallback: "Grabación certificada de Documentos,Videos y Navegación Online")
    /// Legaliza y protege tus derechos de autor, gratis(*) o de forma guiada.
    internal static let copyrights = L10n.tr("Localizable", "Tooltip.Copyrights", fallback: "Legaliza y protege tus derechos de autor, gratis(*) o de forma guiada.")
    /// Conecta y sincroniza tus CRM con WalkyCam,de forma segura. Comparte y almacena información en ambas plataformas.
    internal static let crm = L10n.tr("Localizable", "Tooltip.CRM", fallback: "Conecta y sincroniza tus CRM con WalkyCam,de forma segura. Comparte y almacena información en ambas plataformas.")
    /// Monedero de Criptomonedas: Opera sobre tus criptomonedas con total seguridad.
    internal static let cryptoWallet = L10n.tr("Localizable", "Tooltip.CryptoWallet", fallback: "Monedero de Criptomonedas: Opera sobre tus criptomonedas con total seguridad.")
    /// Mediante ondas electromagnéticas detecta y mapea, cables eléctricos y tuberías, enterrados hasta una profundidad de 7 mt con total precisión.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static let detectorCables = L10n.tr("Localizable", "Tooltip.DetectorCables", fallback: "Mediante ondas electromagnéticas detecta y mapea, cables eléctricos y tuberías, enterrados hasta una profundidad de 7 mt con total precisión.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.")
    /// Encuentra tu anillo perdido.
    /// Puedes enviar a un experto a buscar por ti.
    /// Descubre increíbles tesoros desde la comodidad de tu hogar u oficina.
    internal static let detectorMetales = L10n.tr("Localizable", "Tooltip.DetectorMetales", fallback: "Encuentra tu anillo perdido.\nPuedes enviar a un experto a buscar por ti.\nDescubre increíbles tesoros desde la comodidad de tu hogar u oficina.")
    /// Representación virtual de un objeto o sistema que abarca su ciclo de vida, se actualiza a partir de datos en tiempo real y utiliza simulación, machine learning y razonamiento para ayudar en la toma de decisiones.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static let digitalTwins = L10n.tr("Localizable", "Tooltip.DigitalTwins", fallback: "Representación virtual de un objeto o sistema que abarca su ciclo de vida, se actualiza a partir de datos en tiempo real y utiliza simulación, machine learning y razonamiento para ayudar en la toma de decisiones.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.")
    /// Robot con forma de perro que utiliza sensores con (IA) para moverse e interaccionar con personas y objetos.
    /// Puede prestar ayuda en emergencias o como acompañante de personas dependientes, también puede monitorizar datos de su entorno de forma remota.
    internal static let dogRobot = L10n.tr("Localizable", "Tooltip.DogRobot", fallback: "Robot con forma de perro que utiliza sensores con (IA) para moverse e interaccionar con personas y objetos.\nPuede prestar ayuda en emergencias o como acompañante de personas dependientes, también puede monitorizar datos de su entorno de forma remota.")
    /// Tu provadro de ropa virtual, con grandes ofertas.
    internal static let dressProve = L10n.tr("Localizable", "Tooltip.DressProve", fallback: "Tu provadro de ropa virtual, con grandes ofertas.")
    /// Tu eliges donde grabar tus videos y/o capturar imágenes.
    /// Nosotros pilotamos por ti.
    /// Utiliza drones en tu cultivo: mapeo de campos, IOT, vigilancia y monitoreo de los cultivos, agricultura ecológica.
    /// Contamos con profesionales acreditados y con experiencia. Tu WalkCamer te guiará.
    internal static let droneFly = L10n.tr("Localizable", "Tooltip.Drone Fly", fallback: "Tu eliges donde grabar tus videos y/o capturar imágenes.\nNosotros pilotamos por ti.\nUtiliza drones en tu cultivo: mapeo de campos, IOT, vigilancia y monitoreo de los cultivos, agricultura ecológica.\nContamos con profesionales acreditados y con experiencia. Tu WalkCamer te guiará.")
    /// Ecografías a distancia efectuadas por profesionales.
    /// Llegamos a donde menos te lo esperas, con equipos de primera calidad.
    /// Consigue una segunda opinión
    /// Podrás ver las imágenes en directo.
    internal static let ecografía = L10n.tr("Localizable", "Tooltip.Ecografía", fallback: "Ecografías a distancia efectuadas por profesionales.\nLlegamos a donde menos te lo esperas, con equipos de primera calidad.\nConsigue una segunda opinión\nPodrás ver las imágenes en directo.")
    /// Consultores en ingeniería para resolver tus dudas, de legalizaciones, instalaciones, obras, etc
    internal static let engineering = L10n.tr("Localizable", "Tooltip.Engineering", fallback: "Consultores en ingeniería para resolver tus dudas, de legalizaciones, instalaciones, obras, etc")
    /// Consigue tu sueño una videollamada de tu famoso/a preferido/a.
    internal static let famosos = L10n.tr("Localizable", "Tooltip.Famosos", fallback: "Consigue tu sueño una videollamada de tu famoso/a preferido/a.")
    /// Conviertete en director/a de cine, crea tus propias películas con efectos y diálogos, gracias a nuestra AI.
    internal static let filmMaker = L10n.tr("Localizable", "Tooltip.FilmMaker", fallback: "Conviertete en director/a de cine, crea tus propias películas con efectos y diálogos, gracias a nuestra AI.")
    /// Juega a miles de videojuegos, gratis y de pago, en local o en linea.
    internal static let games = L10n.tr("Localizable", "Tooltip.Games", fallback: "Juega a miles de videojuegos, gratis y de pago, en local o en linea.")
    /// Radar de Penetración de Suelo:
    /// Permite Mapear y localizar estructuras y objetos enterrados en el subsuelo.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    internal static let georadar = L10n.tr("Localizable", "Tooltip.Georadar", fallback: "Radar de Penetración de Suelo:\nPermite Mapear y localizar estructuras y objetos enterrados en el subsuelo.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.")
    /// Pruebate los ultimos modelos de gafas y obten grandes descuentos.
    internal static let glassesProve = L10n.tr("Localizable", "Tooltip.Glasses Prove", fallback: "Pruebate los ultimos modelos de gafas y obten grandes descuentos.")
    /// Monta tus mejores juegos de busqueda del tesoro con nosotros en ubicaciones increibles o en streaming. Participa y pasalo bien en grupo o desde casa.
    internal static let gymkhana = L10n.tr("Localizable", "Tooltip.Gymkhana", fallback: "Monta tus mejores juegos de busqueda del tesoro con nosotros en ubicaciones increibles o en streaming. Participa y pasalo bien en grupo o desde casa.")
    /// Pruebate los más atrevedidos peinados, y reserva cita en una de nuestras peluquerías.
    internal static let hairProve = L10n.tr("Localizable", "Tooltip.HairProve", fallback: "Pruebate los más atrevedidos peinados, y reserva cita en una de nuestras peluquerías.")
    /// Motor de AI entrenado sobre tus datos y tu comportamiento de uso dentro de WalkyCam.
    /// Por única vez, antes de iniciar es necesario integrar y permitir accesos para poder ofrecer mejores recomendaciones, ahorrar trabajo y ofrecer soluciones/ alternativas a los problemas.
    internal static let iaDataAnalysis = L10n.tr("Localizable", "Tooltip.IADataAnalysis", fallback: "Motor de AI entrenado sobre tus datos y tu comportamiento de uso dentro de WalkyCam.\nPor única vez, antes de iniciar es necesario integrar y permitir accesos para poder ofrecer mejores recomendaciones, ahorrar trabajo y ofrecer soluciones/ alternativas a los problemas.")
    /// Registra tu know how de negocio con nosotros y pruebalo en privado o en publico.
    internal static let ideaNegocio = L10n.tr("Localizable", "Tooltip.IdeaNegocio", fallback: "Registra tu know how de negocio con nosotros y pruebalo en privado o en publico.")
    /// Elige entre Farming, Industry, Agriculture, Fleet, Retail, Smart City y mucho más!
    /// Selecciona los sensores indicando su valor.
    /// Localiza tu WalkCamer más cercano y gestiona tu IOT.
    internal static let iot = L10n.tr("Localizable", "Tooltip.IOT", fallback: "Elige entre Farming, Industry, Agriculture, Fleet, Retail, Smart City y mucho más!\nSelecciona los sensores indicando su valor.\nLocaliza tu WalkCamer más cercano y gestiona tu IOT.")
    /// Disfruta de un karaoke en streaming con tu familia y amigos.
    internal static let karaoke = L10n.tr("Localizable", "Tooltip.Karaoke", fallback: "Disfruta de un karaoke en streaming con tu familia y amigos.")
    /// Consultores legales para resolver tus dudas, sobre temas laborales, fiscales, contables, etc
    internal static let lawyer = L10n.tr("Localizable", "Tooltip.Lawyer", fallback: "Consultores legales para resolver tus dudas, sobre temas laborales, fiscales, contables, etc")
    /// Mapea y digitaliza áreas en contrucción o descubre lo que hay debajo de la selva.
    /// Vive la magia del escaneado con laser mediante la técnica LIDAR
    internal static let lidar = L10n.tr("Localizable", "Tooltip.LIDAR", fallback: "Mapea y digitaliza áreas en contrucción o descubre lo que hay debajo de la selva.\nVive la magia del escaneado con laser mediante la técnica LIDAR")
    /// Envía un servicio de cantantes o mariachis a domicilio, para cumpleaños, bromas etc.
    internal static let mariachis = L10n.tr("Localizable", "Tooltip.Mariachis", fallback: "Envía un servicio de cantantes o mariachis a domicilio, para cumpleaños, bromas etc.")
    /// Expon tu propio show room de productos y envía muestras a tus clientes.
    internal static let muestraProductos = L10n.tr("Localizable", "Tooltip.MuestraProductos", fallback: "Expon tu propio show room de productos y envía muestras a tus clientes.")
    /// Crea NFT’s de tu arte digital o descubre nuevos NFT’s en nuestra tienda.
    internal static let nft = L10n.tr("Localizable", "Tooltip.NFT", fallback: "Crea NFT’s de tu arte digital o descubre nuevos NFT’s en nuestra tienda.")
    /// Te ayudamos a presentar tus patentes de invención,o nos hacemos socios si así lo deseas.
    internal static let patenteInvención = L10n.tr("Localizable", "Tooltip.PatenteInvención", fallback: "Te ayudamos a presentar tus patentes de invención,o nos hacemos socios si así lo deseas.")
    /// Si no tienes tiempo, compramos lo que necesites para ti, y te lo llevamos a casa o a donde tu quieras, todo ello en streaming.
    internal static let personalShopper = L10n.tr("Localizable", "Tooltip.PersonalShopper", fallback: "Si no tienes tiempo, compramos lo que necesites para ti, y te lo llevamos a casa o a donde tu quieras, todo ello en streaming.")
    /// Su privacidad es importante para nosotros.
    /// Para cuidar su privacidad, WalkyCam da la posibilidad de pixelar el rostro de las personas y placas de autos que puedan aparecer en una transmisión.
    /// WalkyCam no se responsabiliza por las imagenes que se transmiten ni por la grabación realizada.
    internal static let pixelationFaces = L10n.tr("Localizable", "Tooltip.PixelationFaces", fallback: "Su privacidad es importante para nosotros.\nPara cuidar su privacidad, WalkyCam da la posibilidad de pixelar el rostro de las personas y placas de autos que puedan aparecer en una transmisión.\nWalkyCam no se responsabiliza por las imagenes que se transmiten ni por la grabación realizada.")
    /// Una vez escaneado, puedes editar el color y el tamaño.
    /// Elige la forma de envío más adecuada.
    /// Elegir el material y el acabado del objeto antes de enviarlo a imprimir en 3D.
    /// Disfruta de nuestro envio VIP, envíos frecuentes, y mucho más!
    internal static let print3D = L10n.tr("Localizable", "Tooltip.Print3D", fallback: "Una vez escaneado, puedes editar el color y el tamaño.\nElige la forma de envío más adecuada.\nElegir el material y el acabado del objeto antes de enviarlo a imprimir en 3D.\nDisfruta de nuestro envio VIP, envíos frecuentes, y mucho más!")
    /// Participa en carreras en grupo por streaming, o ponle una pulsera a tu mascota.
    internal static let pulseraFitness = L10n.tr("Localizable", "Tooltip.PulseraFitness", fallback: "Participa en carreras en grupo por streaming, o ponle una pulsera a tu mascota.")
    /// Convierte tu Laptop o tú móvil, en un show de luces de colores, mientras escuchas tu música favorita.
    internal static let rgbBulbParty = L10n.tr("Localizable", "Tooltip.RGBBulbParty.", fallback: "Convierte tu Laptop o tú móvil, en un show de luces de colores, mientras escuchas tu música favorita.")
    /// Vigila, Entrena o Alimenta a tus mascotas a distancia.
    /// Podrás controlar sus movimientos y su estado general, desde la comodidad de tu móvil.
    internal static let robóticaMascotas = L10n.tr("Localizable", "Tooltip.RobóticaMascotas", fallback: "Vigila, Entrena o Alimenta a tus mascotas a distancia.\nPodrás controlar sus movimientos y su estado general, desde la comodidad de tu móvil.")
    /// Robot de vídeo online que permite que varios interlocutores se comuniquen.
    /// Desplázate por ferias y eventos como si estuvieras alli.
    /// Interactúa comercialmente o da clases y conferencias a distancia, mientras te mueves por el entorno.
    internal static let robóticaTelepresencia = L10n.tr("Localizable", "Tooltip.RobóticaTelepresencia", fallback: "Robot de vídeo online que permite que varios interlocutores se comuniquen.\nDesplázate por ferias y eventos como si estuvieras alli.\nInteractúa comercialmente o da clases y conferencias a distancia, mientras te mueves por el entorno.")
    /// Nuestros R.O.V. Drones Submarinos, serán controlados por WalkCamers especialistas.
    /// Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.
    /// Sumerjete en aguas profundas y graba tus propios videos, con nuestros R.O.V. Drones Submarinos.
    /// Podrás usar su brazo robot, para recoger muestras, o manipular objetos.
    /// Los equipos van desde un simple R.O.V. para grabar video, hasta equipos de aguas profundas para la industria naval y la investigación científica
    internal static let rovDrone = L10n.tr("Localizable", "Tooltip.ROVDrone", fallback: "Nuestros R.O.V. Drones Submarinos, serán controlados por WalkCamers especialistas.\nSelecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.\nSumerjete en aguas profundas y graba tus propios videos, con nuestros R.O.V. Drones Submarinos.\nPodrás usar su brazo robot, para recoger muestras, o manipular objetos.\nLos equipos van desde un simple R.O.V. para grabar video, hasta equipos de aguas profundas para la industria naval y la investigación científica")
    /// Crea modelos 3D de objetos reales a partir de fotografías.
    /// Solicita un WalkCamer para efectuar el Scan 3D por ti, a distancia.
    /// Una vez escaneado, puedes editar color, tamaño y forma de la imagen escaneada del objeto. Realiza una impresión 3D del objeto y recibe el objeto.
    internal static let scan3D = L10n.tr("Localizable", "Tooltip.Scan3D", fallback: "Crea modelos 3D de objetos reales a partir de fotografías.\nSolicita un WalkCamer para efectuar el Scan 3D por ti, a distancia.\nUna vez escaneado, puedes editar color, tamaño y forma de la imagen escaneada del objeto. Realiza una impresión 3D del objeto y recibe el objeto.")
    /// Monta las mejores fiestas de Scape Room, online o en una casa real.
    internal static let scapeRoom = L10n.tr("Localizable", "Tooltip.ScapeRoom", fallback: "Monta las mejores fiestas de Scape Room, online o en una casa real.")
    /// Conéctate con el mundo.
    /// Indica la zona a grabar.
    /// Elige un WalkCamer acorde a tus requerimientos
    /// Tu WalkCamer aceptará la invitación para iniciar la videollamada.
    internal static let streetCam = L10n.tr("Localizable", "Tooltip.StreetCam", fallback: "Conéctate con el mundo.\nIndica la zona a grabar.\nElige un WalkCamer acorde a tus requerimientos\nTu WalkCamer aceptará la invitación para iniciar la videollamada.")
    /// Detecta y visualiza el calor emitido por objetos y personas
    /// Problemas eléctricos y de aislamiento térmico
    internal static let thermalCamera = L10n.tr("Localizable", "Tooltip.ThermalCamera", fallback: "Detecta y visualiza el calor emitido por objetos y personas\nProblemas eléctricos y de aislamiento térmico")
    /// Crea una nueva reunión o programa para otro día.
    /// También puedes unirte a una reunión ingresando el código que te han compartido.
    internal static let videoCall = L10n.tr("Localizable", "Tooltip.VideoCall", fallback: "Crea una nueva reunión o programa para otro día.\nTambién puedes unirte a una reunión ingresando el código que te han compartido.")
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
      /// Intentar otra vez
      internal static let buttonTitle = L10n.tr("Localizable", "errorView.generic.buttonTitle", fallback: "Intentar otra vez")
      /// Por alguna razón la información no cargó
      internal static let description = L10n.tr("Localizable", "errorView.generic.description", fallback: "Por alguna razón la información no cargó")
      /// retry
      internal static let icon = L10n.tr("Localizable", "errorView.generic.icon", fallback: "retry")
      /// Ops! Algo salió mal
      internal static let message = L10n.tr("Localizable", "errorView.generic.message", fallback: "Ops! Algo salió mal")
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
