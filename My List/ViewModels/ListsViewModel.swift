//
//  ListsViewModel.swift
//  My List
//
//  Created by Senanur EMİR on 3.05.2024.
//

import Foundation

class ListsViewModel: ObservableObject {
    @Published var lists: [ListItem] = []
    var listItemsModels: [UUID: ListItemsViewModel] = [:]

    init() {
        loadLists()
    }
    
    func addList(name: String) {
        let newList = ListItem(name: name)
        lists.append(newList)
        listItemsModels[newList.id] = ListItemsViewModel(listId: newList.id)
        saveLists()
    }
    
    func getListViewModel(for listId: UUID) -> ListItemsViewModel? {
        if let viewModel = listItemsModels[listId] {
            return viewModel
        } else {
            let newViewModel = ListItemsViewModel(listId: listId)
            listItemsModels[listId] = newViewModel
            return newViewModel
        }
    }
    
    func deleteLists(at offsets: IndexSet) {
        for index in offsets {
            let idToRemove = lists[index].id
            lists.remove(at: index)
            listItemsModels.removeValue(forKey: idToRemove)
        }
        saveLists()
    }
    
    func moveList(from source: IndexSet, to destination: Int) {
        lists.move(fromOffsets: source, toOffset: destination)
        rebuildListItemsModels()
    }
    
    func loadLists() {
        if let savedData = UserDefaults.standard.data(forKey: "lists"),
           let decodedData = try? JSONDecoder().decode([ListItem].self, from: savedData) {
            lists = decodedData
            listItemsModels = [:]
            for listItem in lists {
                listItemsModels[listItem.id] = ListItemsViewModel(listId: listItem.id)
            }
        }
    }
    
    func rebuildListItemsModels() {
        var newModels = [UUID: ListItemsViewModel]()
        for listItem in lists {
            let viewModel = listItemsModels[listItem.id] ?? ListItemsViewModel(listId: listItem.id)
            newModels[listItem.id] = viewModel
        }
        listItemsModels = newModels
    }
    
    func addPredefinedList(name: String, items: [String]) {
        let newList = ListItem(name: name)
        lists.append(newList)
        let newItemsViewModel = ListItemsViewModel(listId: newList.id)
        items.forEach { itemName in
            newItemsViewModel.addItem(itemName)
        }
        
        listItemsModels[newList.id] = newItemsViewModel
        saveLists()
    }
    
    func saveLists() {
        if let encodedData = try? JSONEncoder().encode(lists) {
            UserDefaults.standard.set(encodedData, forKey: "lists")
        }
    }
}
