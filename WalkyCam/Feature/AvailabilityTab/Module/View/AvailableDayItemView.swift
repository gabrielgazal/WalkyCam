//
//  AvailableDayItemView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 09/05/24.
//

import Foundation
import SwiftUI

struct AvailableDayItemView: View {
    @Binding private var data: AvailabilityTabModel

    public init(data: Binding<AvailabilityTabModel>) {
        self._data = data
    }

    var body: some View {
        HStack(alignment: .top,
               spacing: Tokens.Size.Spacing.regular) {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(data.title)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Toggle(isOn: $data.active) {
                    EmptyView()
                }
                .toggleStyle(WCNamelessToggleStyle())
                LinkButton(title: "Hora",
                           icon: Asset.Icons.add.name,
                           color: .naranja,
                           action: {
                    data.secondTime = .init()
                })
                .isHidden(!data.active || data.secondTime != nil)
            }
            Spacer()
            VStack(alignment: .trailing,
                   spacing: Tokens.Size.Spacing.regular) {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    TimePicker(
                        viewModel: .init(selectedTime: data.firstTime.initialTime),
                        timePickerStyle: .default
                    )
                    .disabled(!data.active)
                    TimePicker(
                        viewModel: .init(selectedTime: data.firstTime.finalTime),
                        timePickerStyle: .default
                    )
                    .disabled(!data.active)
                }
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    Image(systemName: "xmark")
                        .onTapGesture {
                            data.secondTime = nil
                        }
                    TimePicker(
                        viewModel: .init(selectedTime: data.firstTime.initialTime),
                        timePickerStyle: .default
                    )
                    .disabled(!data.active)
                    TimePicker(
                        viewModel: .init(selectedTime: data.firstTime.finalTime),
                        timePickerStyle: .default
                    )
                    .disabled(!data.active)
                }
                       .isHidden(data.secondTime == nil)
                Spacer()
            }
        }
    }
}

struct AvailableDayItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AvailableDayItemView(
                data: .constant(
                    .init(
                        title: "Todos los dias",
                        active: true,
                        firstTime: .init(),
                        secondTime: nil
                    )
                )
            )
        }
    }
}
