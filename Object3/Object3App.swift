//
//  Object3App.swift
//  Object3
//
//  Created by Jeanpiere Laura on 10/12/24.
//

import SwiftUI
import SwiftData

@main
struct Object3App: App {
    /*var container: ModelContainer = {
        let schema = Schema([TaskModel.self])
        let setting = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [setting])
        } catch  {
            fatalError("Error creating ModelContainer: \(error.localizedDescription)")
        }
    }()*/
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
       // .modelContainer(container)

    }
}
