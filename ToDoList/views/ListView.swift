//
//  ListView.swift
//  ToDoList
//
//  Created by Youssif Hany on 04/02/2022.
//

import SwiftUI

struct ListView: View {
    
    @State var items:[TaskModel]=[
       TaskModel(title: "First task", isCompleted: false),
       TaskModel(title: "Second task", isCompleted: true),
       TaskModel(title: "Third task", isCompleted: false),
    ]
    
    var body: some View {
        List{
            ForEach(items){item in
                ListRowView(task: item)
            }
            .onDelete(perform: deleteTask)
            .onMove(perform: moveTask)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add",
                                destination: AddTaskView()) )
    }


   func deleteTask(indexSet:IndexSet){
    items.remove(atOffsets:indexSet)
   }

    func moveTask(from:IndexSet,to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
    }
}

