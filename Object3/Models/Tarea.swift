//
//  Tarea.swift
//  Object3
//
//  Created by Jeanpiere Laura on 11/12/24.
//

import Foundation
import SwiftData

enum TaskStatus: String, Codable {
    case pending = "Pendiente"
    case inProgress = "En proceso"
    case completed = "Completado"
}

@Model
final class Tarea {
    @Attribute var identifier: UUID = UUID()
    var title: String
    var descript: String
    var taskStatus: TaskStatus
    var horas: Int
    var lastChange: Date
    
    init(identifier: UUID = UUID(), title: String, descript: String, taskStatus: TaskStatus, horas: Int, lastChange: Date = .now) {
        self.identifier = identifier
        self.title = title
        self.descript = descript
        self.taskStatus = taskStatus
        self.horas = horas
        self.lastChange = lastChange
    }
}
