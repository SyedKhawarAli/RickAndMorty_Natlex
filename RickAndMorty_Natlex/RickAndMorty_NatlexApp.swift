//
//  RickAndMorty_NatlexApp.swift
//  RickAndMorty_Natlex
//
//  Created by Khawar Ali on 12.10.2024.
//

import SwiftUI

@main
struct RickAndMorty_NatlexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
