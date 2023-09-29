//
//  ReminderApp.swift
//  Reminder
//
//  Created by Seymen Nadir Elmas on 28.09.2023.
//

import SwiftUI

@main
struct ReminderApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentContainer.viewContext
            HomeScreen().environment(\.managedObjectContext, viewContext)
        }
    }
}
