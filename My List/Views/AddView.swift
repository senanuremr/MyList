//
//  AddView.swift
//  My List
//
//  Created by Senanur EMİR on 28.04.2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listItemsModel : ListItemsViewModel
    @State var textFieldText: String = ""
    @State  var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        
        ScrollView{
            VStack{
                TextField("İlk Maddeni Ekle....", text:$textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed,
                    label: {
                    Text("Kaydet".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Yeni madde ekle")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            listItemsModel.addItem(textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 1 {
            alertTitle = "Karakter sayın 1'den fazla olmalıdır! 😱 "
            showAlert.toggle()
            
            return false
        }
        //
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        let tempUUID = UUID()
        
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListItemsViewModel(listId: tempUUID))
            
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListItemsViewModel(listId: tempUUID))  
        }
    }
}
