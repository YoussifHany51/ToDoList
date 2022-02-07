//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Youssif Hany on 05/02/2022.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items:[TaskModel]=[]{
        didSet{
            saveData()
        }
    }
    
    let taskKey:String = "taskList"
    
    init(){
        getTasks()
    }
    
    func getTasks(){
        guard
            let data =  UserDefaults.standard.data(forKey: taskKey),
            let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data)
        else {return}
        self.items = savedTasks
    }
    
    func addTask(title:String){
        let newTask=TaskModel(title: title, isCompleted: false)
        items.append(newTask)
    }
    
    func deleteTask(indexSet:IndexSet){
     items.remove(atOffsets:indexSet)
    }

     func moveTask(from:IndexSet,to:Int){
      items.move(fromOffsets: from, toOffset: to)
     }
    
    func updateTask(task: TaskModel){
        if let index=items.firstIndex(where: {$0.id==task.id}){
            items[index]=task.updateComplete()
        }
    }
    
    func saveData(){
        if let encoded=try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encoded, forKey: taskKey )
        }
    }
}
