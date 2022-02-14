//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Youssif Hany on 04/02/2022.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
   @StateObject var listViewModel:ListViewModel=ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView();
            }
            .navigationViewStyle(StackNavigationViewStyle()) 
            .environmentObject(listViewModel)
        }
    }
}
