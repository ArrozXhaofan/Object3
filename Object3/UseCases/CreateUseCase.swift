//
//  CreateUseCase.swift
//  Object3
//
//  Created by Jeanpiere Laura on 12/12/24.
//

import Foundation

protocol CreateUseCaseProtocol {
    func insertItem(_ item: Tarea) throws
}


final class CreateUseCase: CreateUseCaseProtocol {
    
    var repository: RepositoryProtocol
    
    @MainActor
    init(repository: RepositoryProtocol = TareaRepository()) {
        self.repository = repository
    }
    
    func insertItem(_ item: Tarea) throws {
        try repository.addNewTask(item)
    }
    
    
}
