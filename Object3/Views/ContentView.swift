//
//  ContentView.swift
//  Object3
//
//  Created by Jeanpiere Laura on 10/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    @Query var allTask: [Tarea] = TareaViewModel().allTask
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                if allTask.isEmpty {
                    ContentUnavailableView("No hay tareas",
                                           systemImage: "pencil.line",
                                           description:
                                            Text("Agregue una tarea para comenzar"))
                
                } else {
                    List(allTask) { tarea in
                        TaskRow(tarea: tarea)
                    }
                }
            }
            .navigationTitle("Mis tareas")
        }
    }
    
    
}

#Preview(traits: .tareaSampleData) {
    ContentView()
}
