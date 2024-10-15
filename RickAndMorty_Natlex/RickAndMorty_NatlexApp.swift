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
    @StateObject private var homeViewModel = HomeViewModel()

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
//        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.theme.accent)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(homeViewModel)
        }
    }
}
