//
//  ItemModel.swift
//  ToDoList
//
//  Created by Şeyda Aydın on 19.10.2023.
//

import Foundation

struct ItemModel : Identifiable , Encodable , Decodable{
    
    let id : String
    let title : String
    let isCompleted : Bool
    
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
  
}
