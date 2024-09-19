import SwiftUI
import WatchKit

struct WatchSearchView: View {
    
    @State private var isDictating = false
    @State private var navigateToNextView = false
    @State private var isAnimating = false
    
    @ObservedObject var viewModel: WatchSearchViewModel
    
    public init(viewModel: WatchSearchViewModel = .init()) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack {
            Color.negro
                .ignoresSafeArea()
            VStack(alignment: isAnimating ? .center : .leading) {
                Group {
                    Text("Where shall we go?")
                        .font(.projectFont(size: Tokens.Size.Font.large, weight: .bold))
                    Text("Tell us the location to reach")
                        .font(.projectFont(size: Tokens.Size.Font.small))
                }
                .isHidden(isAnimating)
                Button(action: startDictation) {
                    HStack(spacing: Tokens.Size.Spacing.small) {
                        Spacer()
                        Divider()
                            .frame(width: 20, height: 2)
                            .background(Color.naranja)
                        ZStack {
                            Button(action: {
                                withAnimation(.easeInOut(duration: 1.2)) {
                                    isAnimating = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                    startDictation()
                                }
                            }) {
                                Image(systemName: "mic")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .foregroundColor(.blanco)
                            }
                            .background(Color.naranja)
                            .clipShape(Circle())
                            .frame(width: 70, height: 70)
                        }
                        Divider()
                            .frame(width: 20, height: 2)
                            .background(Color.naranja)
                        Spacer()
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Image("soundwave")
                    .isHidden(!isAnimating)
                if let text = viewModel.dictatedText {
                    NavigationLink(
                        destination: WatchLocationView(
                            viewModel: .init(location: text)
                        ),
                        isActive: $navigateToNextView
                    ) {
                        EmptyView()
                    }
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
    
    func startDictation() {
        isDictating = true
        
        // Apresenta o controle de ditado por voz
        WKExtension.shared().rootInterfaceController?.presentTextInputController(
            withSuggestions: nil,
            allowedInputMode: .plain,
            completion: { result in
                if let result = result?.first as? String {
                    viewModel.dictatedText = result // Atualiza o texto ditado
                    navigateToNextView = true
                } else {
                    viewModel.dictatedText = nil
                }
                isDictating = false
            })
    }
}

struct WatchSearchView_Previews: PreviewProvider {
    static var previews: some View {
        WatchSearchView()
    }
}
