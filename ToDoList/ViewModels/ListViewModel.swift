//
//  ListViewModel.swift
//  ToDoList
//
//  Created by MUHAMMAD KASHIF on 02/11/2022.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = []{
        didSet{ //DidSet call each time saveItem when I'm delete, move addtext in items ...... otherwise we can use this saveItem func into each function of deleteItems, moveItem,AddText and updateText
            saveItem()
        }
    }
    let itemsKey: String = "List_Item"
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{ return }
        
        self.items = savedItems
        
    }
    
    func deleteItem(index: IndexSet){
        items.remove(atOffsets: index)
    }
    
    func moveItem(index: IndexSet, int: Int){
        items.move(fromOffsets: index, toOffset: int)
    }
    
    func AddText(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        
//        if let index = items.firstIndex { {existingItems} -> Bool in
//            return existingItems.id == item.id
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id}){
//            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
            items[index] = item.updateCompletion()
            
        }
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    
}
