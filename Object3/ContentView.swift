//
//  ContentView.swift
//  Object3
//
//  Created by Jeanpiere Laura on 10/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var tasks: [TaskModel]
    
    var body: some View {
        VStack {
            List(tasks) { task in
                VStack {
                    Text(task.name)
                    Text(task.descrip)

                }
            }
        }
    }
}

#Preview(traits: .sampleData) {
    ContentView()
}
