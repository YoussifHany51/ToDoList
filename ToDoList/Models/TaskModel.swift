//
//  TaskModel.swift
//  ToDoList
//
//  Created by Youssif Hany on 04/02/2022.
//

import Foundation

struct TaskModel:Identifiable{
    let id:String = UUID().uuidString
    let title:String
    let isCompleted:Bool
}
