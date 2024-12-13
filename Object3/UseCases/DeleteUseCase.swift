//
//  DeleteUseCase.swift
//  Object3
//
//  Created by Jeanpiere Laura on 12/12/24.
//

import Foundation

protocol DeleteUseCaseProtocol {
    func delete(identifier: UUID) throws
}

final class DeleteUseCase: DeleteUseCaseProtocol {
    
    let repository: RepositoryProtocol
    
    @MainActor
    init(repository: RepositoryProtocol = TareaRepository()) {
        self.repository = repository
    }
    
    func delete(identifier: UUID) throws {
        try repository.deleteTask(identifier: identifier)
    }
}
