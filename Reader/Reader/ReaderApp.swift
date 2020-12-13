//
//  ReaderApp.swift
//  Reader
//
//  Created by Eman on 11/15/20.
//

import SwiftUI

@main
struct ReaderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
