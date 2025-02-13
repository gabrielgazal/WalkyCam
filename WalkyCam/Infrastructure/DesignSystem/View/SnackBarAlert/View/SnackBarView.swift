import SwiftUI
import MapKit

typealias SnackbarOnDismiss = (() -> Void)

struct SnackBarView<Router: SnackBarRouterProtocol>: View {
    // MARK: - Inner Types

    private struct ViewMetrics {
        let iconConstant: CGFloat = 20.0
        let bannerHeight: CGFloat = 80.0
        let statusBarHeight: CGFloat = 5.0
        let animationOffset: CGFloat = -100.0
        let nullConstant: CGFloat = 0.0
    }

    // MARK: - Dependencies

    let id = UUID()
    let title: String
    let style: InformationViewStyle
    @ObservedObject var router: Router
    @State var animate: Bool = false
    public var shouldAnimate: Bool = true
    private var dismissTime: CGFloat?
    private let viewMetrics: ViewMetrics = .init()
    private let onDismiss: SnackbarOnDismiss?

    // MARK: - Initialization

    public init(
        router: Router,
        title: String,
        style: InformationViewStyle,
        dismissTime: CGFloat? = 3,
        onDismiss: SnackbarOnDismiss? = nil
    ) {
        self.router = router
        self.title = title
        self.style = style
        self.dismissTime = dismissTime
        self.onDismiss = onDismiss
    }

    // MARK: - UIView Body

    public var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .contentShape(Rectangle())
                .onTapGesture {
                    animateAppear()
                    onDismiss?()
                    router.dismiss()
                }
            VStack {
                Spacer()
                    .frame(height: viewMetrics.statusBarHeight)
                VStack(spacing: viewMetrics.nullConstant) {
                    HStack(alignment: .top,
                           spacing: Tokens.Size.Spacing.regular) {
                        style.icon
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(style.borderColor)
                            .frame(
                                width: viewMetrics.iconConstant,
                                height: viewMetrics.iconConstant
                            )
                        Text(title)
                            .font(.projectFont(size: Tokens.Size.Font.regular))
                            .foregroundColor(style.textColor)
                            .lineLimit(nil)
                        Spacer()
                        Button {
                            withoutAnimation {
                                animateAppear()
                                onDismiss?()
                                router.dismiss()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .renderingMode(.template)
                                .foregroundColor(style.borderColor)
                                .frame(width: viewMetrics.iconConstant,
                                       height: viewMetrics.iconConstant)
                        }
                    }
                }
                .padding(Tokens.Size.Spacing.regular)
                .background(style.backgroundColor)
                .frame(alignment: .top)
                .edgesIgnoringSafeArea(.all)
                .offset(x: viewMetrics.nullConstant,
                        y: animate ? viewMetrics.nullConstant : viewMetrics.animationOffset)
                .onAppear {
                    animateAppear()
                    fireTimer()
                }
                .ignoresSafeArea(.all, edges: .all)
                Spacer()
            }
        }
    }

    // MARK: - Private Methods

    private func animateAppear() {
        if !shouldAnimate {
            animate.toggle()
            return
        }
        withAnimation {
            animate.toggle()
        }
    }

    private func fireTimer() {
        if let dismissTime = dismissTime {
            Timer.scheduledTimer(withTimeInterval: dismissTime, repeats: false) { newTimer in
                withoutAnimation {
                    animateAppear()
                    onDismiss?()
                    router.dismiss()
                }
                newTimer.invalidate()
            }
        }
    }
}

// MARK: Preview

struct SnackBarAlert_Previews: PreviewProvider {
    static var previews: some View {
        SnackBarView(
            router: SnackBarRouter(isPresented: .constant(true)),
            title: "Message goes here to indicate some action",
            style: InformationViewInfoStyle()
        )
    }
}
