//
//  SwiftArmyKnifeApp.swift
//  SwiftArmyKnife
//
//  Created by Jeremy Warren on 2/16/22.
//

import SwiftUI

@main
struct SwiftArmyKnifeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, TodoListStorage.shared.container.viewContext)
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
