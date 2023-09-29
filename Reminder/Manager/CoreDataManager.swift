//
//  CoreDataManager.swift
//  Reminder
//
//  Created by Seymen Nadir Elmas on 28.09.2023.
//

import Foundation
import CoreData

class CoreDataManager{
    
    let persistentContainer : NSPersistentContainer
    static let shared = CoreDataManager()
    private init(){
        persistentContainer = NSPersistentContainer(name: "ReminderModel")
        persistentContainer.loadPersistentStores{ description, error in
            if let error = error {
                fatalError("Unable initialize Core Date \(error)")
            }
        
            
        }
    
        
    }
    
}
