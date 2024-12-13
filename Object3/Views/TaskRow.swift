//
//  ExtractedView.swift
//  Object3
//
//  Created by Jeanpiere Laura on 13/12/24.
//


struct ExtractedView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            HStack(spacing: 45) {
                Text(tarea.title)
                    .font(.title2)
                    .lineLimit(1)
                    .bold()
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(getStatusColor(tarea.taskStatus))
            }
            
            Text(tarea.descript)
                .lineLimit(2)
                .font(.footnote)
            
        }
    }
}