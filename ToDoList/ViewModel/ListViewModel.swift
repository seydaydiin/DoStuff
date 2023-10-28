//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Şeyda Aydın on 26.10.2023.
//

import Foundation

class ListViewModel : ObservableObject {
    
    @Published var items : [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemKeys : String = "item_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        guard
         let data = UserDefaults.standard.data(forKey: itemKeys) ,  //veriye sahip olup olmadığımızı
         let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)   //dönüştürebileceğimizi kontrol
        else {return}
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem (from : IndexSet , to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem (item : ItemModel) {
       
        if let index = items.firstIndex(where: { $0.id == item.id } ) {
            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
        }
        
    }
    func saveItems() {
        
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData,forKey : itemKeys)
        }
        
    }
    
    
}

