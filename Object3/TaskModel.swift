//
//  DataModel.swift
//  Object3
//
//  Created by Jeanpiere Laura on 11/12/24.
//

import Foundation
import SwiftData

enum StateTask: String, Codable, CaseIterable {
    case active = "Activo"
    case inactive = "Desactivado"
}

@Model
final class TaskModel {
    @Attribute(.unique) var id: UUID
    var name: String
    var descrip: String
    var date: Date
    var state: StateTask
    
    init(id: UUID, name: String, descrip: String, date: Date, state: StateTask) {
        self.id = id
        self.name = name
        self.descrip = descrip
        self.date = date
        self.state = state
    }
}
