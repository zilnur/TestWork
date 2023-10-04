//
//  NodeExtension.swift
//  TestWork
//
//  Created by Ильнур Закиров on 03.10.2023.
//

import Foundation

extension Node {
    
    //Преобразовываем свойство children из NSSet в Array
    var childrenArray: [Node] {
        get {
            let set = children as? Set<Node> ?? []
            return set.sorted(by: {$0.name ?? "" < $1.name ?? ""})
        }
        
    }
}
