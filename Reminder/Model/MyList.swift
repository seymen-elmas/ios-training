//
//  MyList.swift
//  Reminder
//
//  Created by Seymen Nadir Elmas on 28.09.2023.
//

import Foundation
import CoreData
import UIKit
@objc(MyList)
class MyList : NSManagedObject,BaseModel{
    
}

extension MyList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }

    @NSManaged public var color: UIColor?
    @NSManaged public var name: String?

}

extension MyList : Identifiable {

}
