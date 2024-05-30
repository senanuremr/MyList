//
//  NewListNameView.swift
//  My List
//
//  Created by Senanur EMİR on 7.05.2024.
//

import SwiftUI

struct NewListNameView: View {
    @Binding var isAddingNewList: Bool
    @State private var newListName = ""
    @EnvironmentObject var listsViewModel: ListsViewModel
    
    var body: some View {
        ZStack {
            Image("backgroundImage") 
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TextField("Yeni liste adı", text: self.$newListName)
                    .padding(2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.7))
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.accentColor, lineWidth: 1)
                )
                Button(action: {
                    listsViewModel.addList(name: self.newListName)
                    self.newListName = ""
                    self.isAddingNewList.toggle()
                }) {
                    Text("Ekle")
                        .padding(.horizontal, 120)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .shadow(radius: 5)
                        }
                }
                .padding()
            }
            .padding()
        }
    }


struct NewListNameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewListNameView(isAddingNewList: .constant(true))
                .environmentObject(ListsViewModel())
        }
    }
}
