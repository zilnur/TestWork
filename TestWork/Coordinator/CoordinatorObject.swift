//
//  CoordinatorObject.swift
//  TestWork
//
//  Created by Ильнур Закиров on 04.10.2023.
//

import Foundation

class CoordinatorObject: ObservableObject {
    
    @Published var path = [Node]()
    var name = UserDefaults.standard.string(forKey: "root")
    
    func toNextView(node: Node) {
        path.append(node)
    }
}
