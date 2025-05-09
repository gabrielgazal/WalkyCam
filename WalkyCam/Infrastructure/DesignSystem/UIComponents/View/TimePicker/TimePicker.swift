//
//  TimePicker.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 09/05/24.
//

import SwiftUI

class TimePickerViewModel: ObservableObject {
    @Binding var selectedTime: Date
    
    init(selectedTime: Binding<Date>) {
        self._selectedTime = selectedTime
    }
}

struct TimePicker: View {
    enum TimePickerStyle {
        case `default`, expanded, giant
    }
    
    @Environment(\.isEnabled) var isEnabled
    @ObservedObject var viewModel: TimePickerViewModel
    private var timePickerStyle: TimePickerStyle
    @State private var isPickerPresented = false
    
    public init(viewModel: TimePickerViewModel,
                timePickerStyle: TimePickerStyle) {
        self.viewModel = viewModel
        self.timePickerStyle = timePickerStyle
    }
    
    var body: some View {
        VStack {
            Button(action: {
                isPickerPresented.toggle()
            }) {
                switch timePickerStyle {
                case .default:
                    Text("\(timeFormat(date: viewModel.selectedTime))")
                        .padding()
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                        .background {
                            Capsule()
                                .fill(Color.blancoGris)
                        }
                case .expanded:
                    Text("\(timeFormat(date: viewModel.selectedTime))")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .padding()
                case .giant:
                    Text("\(timeFormat(date: viewModel.selectedTime)) h")
                        .font(.projectFont(size: Tokens.Size.Font.giant, weight: .bold))
                        .padding()
                }
            }
            .buttonStyle(.plain)
            .popover(isPresented: $isPickerPresented, attachmentAnchor: .point(.top)) {
                TimeSelector(viewModel: viewModel)
                    .presentationCompactAdaptation(.popover)
            }
        }
    }
    
    private func timeFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return isEnabled ? formatter.string(from: date) : "    -    "
    }
}

struct TimeSelector: View {
    @ObservedObject var viewModel: TimePickerViewModel
    
    var body: some View {
        DatePicker("", selection: $viewModel.selectedTime, displayedComponents: .hourAndMinute)
            .datePickerStyle(WheelDatePickerStyle())
    }
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel1 = TimePickerViewModel(selectedTime: .constant(Date()))
        let viewModel2 = TimePickerViewModel(selectedTime: .constant(Date()))
        let viewModel3 = TimePickerViewModel(selectedTime: .constant(Date()))
        
        return VStack {
            TimePicker(viewModel: viewModel1, timePickerStyle: .expanded)
            TimePicker(viewModel: viewModel2, timePickerStyle: .default)
            TimePicker(viewModel: viewModel3, timePickerStyle: .giant)
        }
    }
}

