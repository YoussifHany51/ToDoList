//
//  ListRowView.swift
//  ToDoList
//
//  Created by Youssif Hany on 04/02/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let task:TaskModel
    
    var body: some View {
        HStack{
            Image(systemName: task.isCompleted ? "checkmark.circle":"circle"  )
                .foregroundColor(task.isCompleted ? .green:.red)
            Text(task.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var task1=TaskModel(title: "First", isCompleted: false)
    static var task2=TaskModel(title: "Second", isCompleted: true)
    
    static var previews: some View {
        Group{
            ListRowView(task: task1)
            ListRowView(task: task2)
        }
        .previewLayout(.sizeThatFits)
    }
}
