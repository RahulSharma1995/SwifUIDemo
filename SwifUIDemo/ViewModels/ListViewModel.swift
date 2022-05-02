//
//  ListViewModel.swift
//  SwifUIDemo
//
//  Created by Rahul Sharma on 02/05/22.
//

import Foundation

class ListViewModel : ObservableObject {
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first title!", isComplited: false),
            ItemModel(title: "This is the secound!", isComplited: true),
            ItemModel(title: "Third!", isComplited: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isComplited: false)
        items.append(newItem)
    }
    
    func updateItem(item : ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateModel()
        }
    }
    
}
