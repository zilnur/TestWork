//
//  ContentView.swift
//  TestWork
//
//  Created by Ильнур Закиров on 01.10.2023.
//

import SwiftUI
import CoreData

struct NodeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel: NodeViewModel
    var node: Node
    
    var body: some View {
        List {
            ForEach(node.childrenArray, id: \.self) { child in
                Button(child.name ?? "") {
                    viewModel.toNextView(node: child)
                }
            }
            .onDelete(perform: { indexSet in
                deleteItems(offsets: indexSet)
            })
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigation) {
                Button {
                    addItem(name: RandomNameGenerator.shared.randomHexString())
                } label: {
                    Text("+")
                }
            }
        })
        .navigationTitle(node.name ?? "")
    }
    
    //создание дочерней Node
    private func addItem(name: String) {
        withAnimation {
            let newItem = Node(context: viewContext)
            newItem.name = name
            newItem.parent = node
            node.addToChildren(newItem)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    //Удаление дочерней Node
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { node.childrenArray[$0] }.forEach(viewContext.delete)
            offsets.map { node.childrenArray[$0] }.forEach(node.removeFromChildren(_:))
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
