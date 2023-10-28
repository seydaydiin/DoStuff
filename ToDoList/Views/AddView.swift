//
//  AddView.swift
//  ToDoList
//
//  Created by Şeyda Aydın on 18.10.2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var textfield : String = ""
    @State var showAlert : Bool = false
    @State var alertTitle : String = ""
    
    let addItemColor = Color("AddItemColor")
    var body: some View {
        
        ScrollView {
            VStack {
                TextField(" Type something here...", text: $textfield)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                .padding(.horizontal)
                
                Button(action: saveButtonPressed ,
                label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(14)
            }
      
                
        }
        .navigationTitle("Add Item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textfield)
            presentationMode.wrappedValue.dismiss()
        }
   
    }
    
    func textIsAppropriate() ->  Bool {
        if textfield.count < 3 {
            alertTitle = "Your new to do item must be at least 3 characters long! 🔏"
            showAlert.toggle()
            return false
        }
        return true
        
    }
    
    func getAlert() -> Alert {
        
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        

            
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            
       
       
    }
}
