//
//  AddNew.swift
//  SwifUIDemo
//
//  Created by Rahul Sharma on 01/05/22.
//

import SwiftUI

struct AddNew: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something hare...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed) {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }                
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🦯")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new item must be at least 3 characters long !!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddNew()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
            
            NavigationView {
                AddNew()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
        }
    }
}
