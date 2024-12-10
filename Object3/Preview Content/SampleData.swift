//
//  SampleData.swift
//  Object3
//
//  Created by Jeanpiere Laura on 11/12/24.
//

import SwiftData
import SwiftUI

struct SampleData: PreviewModifier {
    
    static func makeSharedContext() async throws -> ModelContainer {
        
        let schema: Schema = Schema([TaskModel.self])
        let setting: ModelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [setting])
        
        let task1 = TaskModel(id: UUID(),
                              name: "Tarea numero 1", descrip: "Esta es la tarea numero uno.",
                              date: .now,
                              state: .inactive)
        let task2 = TaskModel(id: UUID(),
                              name: "Tarea numero 2", descrip: "Esta es la tarea numero dos.",
                              date: .now,
                              state: .inactive)
        
        container.mainContext.insert(task1)
        container.mainContext.insert(task2)
        
        return container

    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}
