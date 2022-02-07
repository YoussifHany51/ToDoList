//
//  TaskModel.swift
//  ToDoList
//
//  Created by Youssif Hany on 04/02/2022.
//

import Foundation

struct TaskModel:Identifiable,Codable{
    let id:String
    let title:String
    let isCompleted:Bool
    
    init(id:String = UUID().uuidString,title: String,isCompleted:Bool){
        self.id=id
        self.title=title
        self.isCompleted=isCompleted
    }
    
    func updateComplete()->TaskModel{
        return TaskModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
