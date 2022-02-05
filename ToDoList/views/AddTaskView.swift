//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Youssif Hany on 04/02/2022.
//

import SwiftUI

struct AddTaskView: View {
    
    @State var textFieldText:String=""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Enter title",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .font(.title)
                Button(action:{},
                       label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
                
        }
        .navigationTitle("Add new Task 🖋")
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddTaskView()
        }
    }
}
