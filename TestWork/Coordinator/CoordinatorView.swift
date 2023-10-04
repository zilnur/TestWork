//
//  NavigationView.swift
//  TestWork
//
//  Created by Ильнур Закиров on 02.10.2023.
//

import SwiftUI

struct CoordinatorView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    var nodes: FetchedResults<Node>
    
    @ObservedObject var coordinator: CoordinatorObject
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            
            NodeView(viewModel: NodeViewModel(coordinator: coordinator), node: nodes.first(where: {$0.name == coordinator.name})!)
                .navigationDestination(for: Node.self) { node in
                    NodeView(viewModel: NodeViewModel(coordinator: coordinator), node: node)
                }
        }
    }
}
