//
//  BudgetsAppApp.swift
//  BudgetsApp
//
//  Created by Ajay Kumar on 29/03/25.
//

import SwiftUI

@main
struct BudgetsAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,CoreDataManager.shared.viewContext)
            
        }
    }
}
