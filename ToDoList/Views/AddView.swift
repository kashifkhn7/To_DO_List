//
//  AddView.swift
//  ToDoList
//
//  Created by MUHAMMAD KASHIF on 02/11/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentionMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var alertShow: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                
                Spacer(minLength: 15)
                
                Button {
                    saveButtonPressedText()
                } label: {
                    Text("Save".uppercased())
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                    
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
            }
            .padding(20)
        }
        .navigationTitle("Add an Item ✍🏻 ")
        .alert(isPresented: $alertShow, content: getAlertText)
    }
    
    func saveButtonPressedText(){
        if isTextAppropriate(){
            listViewModel.AddText(title: textFieldText)
            presentionMode.wrappedValue.dismiss()
        }
    }
    
    func isTextAppropriate() -> Bool{
        if textFieldText.count < 3{
            alertTitle = "Your TODo Item must be greater then three charaters 😕"
            alertShow.toggle()
            return false
        }
        return true
    }
    
    func getAlertText() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
