//
//  User+CoreDataProperties.swift
//  NoteFood3
//
//  Created by juri on 2023/08/15.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var gender: String?
    @NSManaged public var height: String?
    @NSManaged public var name: String?
    @NSManaged public var weight: String?
    @NSManaged public var foods: Set<Food>?
    
    public var food: [Food] {
        let setOfFood = foods
        return setOfFood!.sorted{
            $0.today! > $1.today!
        }
    }
    
    
}

// MARK: Generated accessors for foods
extension User {

    @objc(addFoodsObject:)
    @NSManaged public func addToFoods(_ value: Food)

    @objc(removeFoodsObject:)
    @NSManaged public func removeFromFoods(_ value: Food)

    @objc(addFoods:)
    @NSManaged public func addToFoods(_ values: NSSet)

    @objc(removeFoods:)
    @NSManaged public func removeFromFoods(_ values: NSSet)

}

extension User : Identifiable {

}
