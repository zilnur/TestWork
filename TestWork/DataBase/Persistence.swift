//
//  Persistence.swift
//  TestWork
//
//  Created by Ильнур Закиров on 01.10.2023.
//

import CoreData

class PersistenceController {
    let container: NSPersistentContainer
    lazy var viewContext = container.viewContext
    
    init() {
        container = NSPersistentContainer(name: "TestWork")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        addRootNode()
        viewContext.automaticallyMergesChangesFromParent = true
    }
    
    //Создает корневой Node при инициализации класса
    func addRootNode() {
        let request = Node.fetchRequest()
        do {
            let fetch =  try self.viewContext.fetch(request)
            if fetch.isEmpty {
                let rootNode = Node(context: self.viewContext)
                let name = RandomNameGenerator.shared.randomHexString()
                rootNode.name = name
                UserDefaults.standard.setValue(name, forKey: "root")
            }
            try self.viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
