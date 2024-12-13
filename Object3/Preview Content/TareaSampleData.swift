//
//  TareaSampleData.swift
//  Object3
//
//  Created by Jeanpiere Laura on 12/12/24.
//

import SwiftUI
import SwiftData

struct SampleData2: PreviewModifier {
    
    static func makeSharedContext() async throws -> ModelContainer {
        
        let schema = Schema([Tarea.self])
        let setting = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        let container = try ModelContainer(for: schema, configurations: [setting])
            
        container.mainContext.insert(Tarea.generateRandom())
        container.mainContext.insert(Tarea.generateRandom())
        
        let tarea = Tarea(title: "Hola", descript: "ffsdf", taskStatus: .completed, horas: 13)
        
        container.mainContext.insert(tarea)
            
        return container
            
    }
   
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var tareaSampleData: Self = .modifier(SampleData2())
}
