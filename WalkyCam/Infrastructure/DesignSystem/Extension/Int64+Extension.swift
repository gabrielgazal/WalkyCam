//
//  Int64+Extensiopn.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 07/03/24.
//

import Foundation

extension Int64 {
    func toTimeString() -> String {
        // Converter milissegundos para um objeto Date
        let date = Date(timeIntervalSince1970: TimeInterval(self) / 1000.0)

        // Criar um DateFormatter para formatar apenas o horário no fuso horário local
        let dateFormatter = DateFormatter()
//        dateFormatter.timeZone = TimeZone.current // Fuso horário local
        dateFormatter.dateFormat = "HH:mm" // Formatando apenas o horário

        // Formatar a data como uma string de horário
        let timeString = dateFormatter.string(from: date)

        return timeString
    }
}
