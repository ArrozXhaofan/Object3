//
//  UtilsData.swift
//  Object3
//
//  Created by Jeanpiere Laura on 12/12/24.
//

import Foundation

extension Tarea {
    static func generateRandom() -> Tarea {
        Tarea(
            title: "Tarea \(UUID().uuidString)",
            descript: "Descripcion \(UUID().uuidString)",
            taskStatus: .pending,
            horas: Range(1...10).randomElement()!
        )
    }
}

