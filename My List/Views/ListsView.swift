//
//  ListView.swift
//  My List
//
//  Created by Senanur EMİR on 27.04.2024.
//

import SwiftUI

struct ListsView: View {
    @EnvironmentObject var listsViewModel: ListsViewModel
    @State private var isAddingNewList = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Listelerim 🌟")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, -120)
                
                if listsViewModel.lists.isEmpty {
                    NoItemsView()
                } else {
                    List {
                        ForEach(listsViewModel.lists) { list in
                            NavigationLink(destination: MyListView(listName: list.name, listId: list.id)
                                .environmentObject(listsViewModel.getListViewModel(for: list.id) ?? ListItemsViewModel(listId: list.id))) {
                                    Text(list.name)
                            }
                        }
                        .onDelete(perform: listsViewModel.deleteLists)
                        .onMove(perform: listsViewModel.moveList)
                    }
                    .listStyle(PlainListStyle())
                    .padding(.top, 0)
                }
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.isAddingNewList.toggle()
                }) {
                    Image(systemName: "plus.rectangle.portrait")
                }
            )
            .sheet(isPresented: $isAddingNewList, content: {
                NewListNameView(isAddingNewList: self.$isAddingNewList)
                    .environmentObject(self.listsViewModel)
            })
        }
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
            .environmentObject(ListsViewModel())
    }
}
