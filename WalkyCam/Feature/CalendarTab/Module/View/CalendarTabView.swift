import SwiftUI

struct CalendarTabView<ViewModel: CalendarTabViewModelProtocol, Router: CalendarTabRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State private var selectedDate: Date = .init()

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack {
            DatePicker("Selecciona una fecha", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(.graphical)
                .environment(\.locale, Locale(identifier: "es_ES"))
                .accentColor(.naranja)
                .onChange(of: selectedDate) { _, newValue in
                    viewModel.updateSelectedDate(newValue)
                }
            Spacer()
        }
    }
}

struct CalendarTabView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarTabView(
            viewModel: CalendarTabViewModel(),
            router: CalendarTabRouter(isPresented: .constant(false))
        )
    }
}
