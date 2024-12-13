//
//  UpdateUseCase.swift
//  Object3
//
//  Created by Jeanpiere Laura on 12/12/24.
//

import Foundation

protocol UpdateCaseProtocol {
    func update(task: Tarea) throws
}

final class UpdateUseCase: UpdateCaseProtocol {
    
    let repository: RepositoryProtocol
    
    @MainActor
    init(repository: RepositoryProtocol = TareaRepository()) {
        self.repository = repository
    }
    
    func update(task: Tarea) throws {
        try repository.updateTask(identifier: task.identifier, task: task)
    }
}
