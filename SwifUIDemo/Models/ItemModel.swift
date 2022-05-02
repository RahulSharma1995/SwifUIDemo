//
//  ItemModel.swift
//  SwifUIDemo
//
//  Created by Rahul Sharma on 01/05/22.
//

import Foundation

struct ItemModel : Identifiable {
    let id : String
    let title: String
    let isComplited: Bool
    
    init(id: String = UUID().uuidString, title : String, isComplited: Bool){
        self.id = id
        self.title = title
        self.isComplited = isComplited
    }
    
    func updateModel() -> ItemModel {
        return ItemModel(id: id, title: title, isComplited: !isComplited)
    }
    
}
