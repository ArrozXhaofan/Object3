//
//  MapViewModel.swift
//  Object3
//
//  Created by Jeanpiere Laura on 10/12/24.
//

import Foundation
import Observation

@Observable
final class TareaViewModel {
    
    var allTask: [Tarea] = []
    
    var repository: RepositoryProtocol
    var fetchUseCase: FetchUseCaseProtocol
    var createUseCase: CreateUseCaseProtocol
    var updateUseCase: UpdateCaseProtocol
    var deleteUseCase: DeleteUseCaseProtocol
    
    @MainActor
    init(repository: RepositoryProtocol = TareaRepository(),
         fetchUseCase: FetchUseCaseProtocol = FetchUseCase(),
         createUseCase: CreateUseCaseProtocol = CreateUseCase(),
         updateUseCase: UpdateCaseProtocol = UpdateUseCase(),
         deleteUseCase: DeleteUseCaseProtocol = DeleteUseCase()) {
        self.repository = repository
        self.fetchUseCase = fetchUseCase
        self.createUseCase = createUseCase
        self.updateUseCase = updateUseCase
        self.deleteUseCase = deleteUseCase
        fetchAllTask()
    }
    
    func fetchAllTask() {
        allTask = fetchUseCase.fetch()
    }
    
    
}
