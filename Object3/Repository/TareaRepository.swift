//
//  TareaRepository.swift
//  Object3
//
//  Created by Jeanpiere Laura on 11/12/24.
//

import Foundation
import SwiftData

enum DatabaseError: String, Error {
    case invalidDatabase = "Error"
    case insertFailed = "Error al insertar"
    case elemetNotFound = "Elemento no encontrado"
    case updateFailed = "Error al actualizar"
    case fetchFailed = "Error al buscar"
    case deleteFailed = "Error al eliminar"
}

protocol RepositoryProtocol {
    func getAllTasks() -> [Tarea]
    func addNewTask(_ task: Tarea) throws
    func updateTask(identifier: UUID, task: Tarea) throws
    func deleteTask(identifier: UUID) throws
}

@MainActor
final class TareaRepository: @preconcurrency RepositoryProtocol {
    
    let container: ModelContainer = setUp(inDisk: true)
    
    static func setUp(inDisk: Bool) -> ModelContainer {
        
        let schema = Schema([
            Tarea.self
        ])
        let setting = ModelConfiguration(schema: schema, isStoredInMemoryOnly: !inDisk)
        
        do {
            let container = try ModelContainer(for: schema, configurations: [setting])
            container.mainContext.autosaveEnabled = false
            return container
            
        } catch {
            fatalError("Error al crear el container de datos: \(error.localizedDescription)")
        }
    }
    
    func getAllTasks() -> [Tarea] {
        
        let sort = SortDescriptor<Tarea>(\.lastChange)
        let fetchDescriptor = FetchDescriptor(sortBy: [sort])
        
        do {
            return try container.mainContext.fetch(fetchDescriptor)
        } catch {
            return []
        }
    }
    
    func addNewTask(_ task: Tarea) throws {
        
        container.mainContext.insert(task)
        
        do {
            try container.mainContext.save()
        } catch {
            throw DatabaseError.insertFailed
        }
    }
    
    func updateTask(identifier: UUID, task: Tarea) throws {
        
        let predicate = #Predicate<Tarea> {
            $0.identifier == identifier
        }
        
        var preData = FetchDescriptor(predicate: predicate)
        preData.fetchLimit = 1
        
        do {
            guard let item = try container.mainContext.fetch(preData).first else {
                throw DatabaseError.elemetNotFound
            }
            
            item.title = task.title
            item.descript = task.descript
            item.taskStatus = task.taskStatus
            item.horas = task.horas
            
            try container.mainContext.save()
            
        } catch {
            throw DatabaseError.updateFailed
        }
    }
    
    func deleteTask(identifier: UUID) throws {
        
        let predicate = #Predicate<Tarea> {
            $0.identifier == identifier
        }
        var descriptor = FetchDescriptor(predicate: predicate)
        descriptor.fetchLimit = 1
        
        do {
            guard let item = try container.mainContext.fetch(descriptor).first else {
                throw DatabaseError.elemetNotFound
            }
            
            container.mainContext.delete(item)
            try container.mainContext.save()
            
        } catch {
            throw DatabaseError.deleteFailed
        }
    }
}
