//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Youssif Hany on 04/02/2022.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode)var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var textFieldText:String=""
    
    @State var alertTitle:String=""
    @State var showAlert:Bool=false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Enter title",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .font(.title)
                Button(action:saveButton,
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
        .alert(isPresented: $showAlert , content: getAlert)
    }
    
    func saveButton(){
        if textChecker(){
        listViewModel.addTask(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
       }
    }
    
    func textChecker()->Bool{
        if(textFieldText.count<3){
            alertTitle="Enter at least 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert()->Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddTaskView()
        }
        .environmentObject(ListViewModel())
    }
}
