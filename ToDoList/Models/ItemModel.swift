//
//  ItemModels.swift
//  ToDoList
//
//  Created by MUHAMMAD KASHIF on 02/11/2022.
//

import Foundation

struct ItemModel: Identifiable, Codable{
    var id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}


//ItemModel(id: <#T##<<error type>>#>, title: <#T##String#>, isCompleted: <#T##Bool#>)
//ItemModel(title: <#T##String#>, isCompleted: <#T##Bool#>)
