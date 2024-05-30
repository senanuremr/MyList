//
//  ListItemModel.swift
//  My List
//
//  Created by Senanur EMİR on 4.05.2024.
//
import Foundation

class ListItemsViewModel: ObservableObject {
    @Published var items: [ListItem] = []
    var listId: UUID  

    init(listId: UUID = UUID(uuidString: "your-constant-uuid-string-here")!) {
           self.listId = listId
           loadItems()
       }

    func addItem(_ name: String) {
        objectWillChange.send()
        let newItem = ListItem(name: name)
        items.append(newItem)
        saveItems()
    }

    func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            items.remove(at: index)
        }
        saveItems()
    }

    func moveItem(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
        saveItems()
    }

    private func loadItems() {
        let key = "list_items_\(listId)"
        if let savedData = UserDefaults.standard.data(forKey: key) {
            do {
                let decodedData = try JSONDecoder().decode([ListItem].self, from: savedData)
                self.items = decodedData
                print("Loaded items successfully: \(items)")
            } catch {
                print("Failed to decode items: \(error)")
            }
        } else {
            print("No data available for key: \(key), starting with an empty list.")
            self.items = []
        }
    }


    
    func saveItems() {
        let key = "list_items_\(listId)"
        do {
            let encodedData = try JSONEncoder().encode(items)
            UserDefaults.standard.set(encodedData, forKey: key)
            print("Items saved successfully under key: \(key)")
        } catch {
            print("Failed to encode items: \(error)")
        }
    }

    func updateItem(_ item: ListItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item
            saveItems()
        }
    }
    
    func toggleCheck(for item: ListItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index].isChecked.toggle()
        objectWillChange.send()
        saveItems()
    }


    func updateItemSelection(_ item: ListItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isChecked.toggle()
            saveItems()
        }
    }
}
