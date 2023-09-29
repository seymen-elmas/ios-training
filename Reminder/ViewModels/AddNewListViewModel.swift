//
//  AddNewListViewModel.swift
//  Reminder
//
//  Created by Seymen Nadir Elmas on 28.09.2023.
//

import Foundation
import CoreData
import SwiftUI

class AddNewListViewModel: ObservableObject {
    @Published var name :String = ""
    @Published var color : Color = .blue
    var context : NSManagedObjectContext
    init(context : NSManagedObjectContext){
        self.context = context
        
    }
    func save() {
        do {
            let mylist = MyList(context: context)
            mylist.name = name
            mylist.color = UIColor(color)
            try? mylist.save()
        } catch {
            print(error)
        }
    }
    
}
