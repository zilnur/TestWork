//
//  NodeViewModel.swift
//  TestWork
//
//  Created by Ильнур Закиров on 04.10.2023.
//

import Foundation

class NodeViewModel: ObservableObject {
    
    var coordinator: CoordinatorObject
    
    init(coordinator: CoordinatorObject) {
        self.coordinator = coordinator
    }
    
    func toNextView(node: Node) {
        coordinator.toNextView(node: node)
    }
    
}
