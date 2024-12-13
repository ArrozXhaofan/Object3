//
//  FetchUseCase.swift
//  Object3
//
//  Created by Jeanpiere Laura on 12/12/24.
//

import Foundation

protocol FetchUseCaseProtocol {
    func fetch() -> [Tarea]
}


final class FetchUseCase: FetchUseCaseProtocol {
    
    let repository: RepositoryProtocol
    
    @MainActor
    init(repository: RepositoryProtocol = TareaRepository()) {
        self.repository = repository
    }
    
    func fetch() -> [Tarea] {
        return repository.getAllTasks()
    }

}
