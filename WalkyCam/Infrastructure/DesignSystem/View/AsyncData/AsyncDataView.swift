import SwiftUI

struct AsyncDataView<Success, Content: View>: View {
    let asyncData: AsyncData<Success, ErrorProtocol>
    let content: (_ item: Success) -> Content
    let errorAction: (() -> Void)

    init(_ asyncData: AsyncData<Success, ErrorProtocol>,
         @ViewBuilder content: @escaping (_ item: Success) -> Content,
         errorAction: @escaping (() -> Void)) {
        self.asyncData = asyncData
        self.content = content
        self.errorAction = errorAction
    }

    var body: some View {
        switch asyncData {
        case .idle:
            EmptyView()
        case .loading:
            VStack(alignment: .center) {
                Spacer()
                ProgressView()
                    .controlSize(.large)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        case let .loaded(value):
            content(value)
        case let .failed(error):
            ErrorView(error: error, action: errorAction)
        }
    }
}
