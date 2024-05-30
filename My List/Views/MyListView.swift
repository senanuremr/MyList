//
//  MyListView.swift
//  My List
//
//  Created by Senanur EMİR on 27.04.2024.
//


import SwiftUI

struct MyListView: View {
    @EnvironmentObject var listItemsModel: ListItemsViewModel
    var listName: String
    var listId: UUID
    
    var body: some View {
                List {
                    ForEach(listItemsModel.items, id: \.id) { item in
                        HStack {
                            Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(item.isChecked ? .accentColor : .black)
                            Text(item.name)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .onTapGesture {
                            listItemsModel.toggleCheck(for: item)
                        }
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle(listName)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink("Ekle", destination: AddView().environmentObject(listItemsModel))
                )
            }
    
            func deleteItems(at offsets: IndexSet) {
                listItemsModel.deleteItem(at: offsets)
            }
            
            func moveItems(from source: IndexSet, to destination: Int) {
                listItemsModel.moveItem(from: source, to: destination)
        }
    }


struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyListView(listName: "Sample List", listId: UUID())
                .environmentObject(ListItemsViewModel(listId: UUID()))
        }
    }
}
