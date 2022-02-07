//
//  ListView.swift
//  ToDoList
//
//  Created by Youssif Hany on 04/02/2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
   
    var body: some View {
        List{
            ForEach(listViewModel.items){item in
                ListRowView(task: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateTask(task: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteTask)
            .onMove(perform: listViewModel.moveTask)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                                NavigationLink("Add",
                                destination: AddTaskView()) )
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

