//
//  TestWorkApp.swift
//  TestWork
//
//  Created by Ильнур Закиров on 01.10.2023.
//

import SwiftUI

@main
struct TestWorkApp: App {
    let dataBase = PersistenceController()
    var body: some Scene {
        let coordinator = CoordinatorObject()
        WindowGroup {
            CoordinatorView(coordinator: coordinator)
                .environment(\.managedObjectContext, dataBase.viewContext)
        }
    }
}
