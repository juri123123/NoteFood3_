//
//  FoodDataController.swift
//  NoteFood3
//
//  Created by juri on 2023/07/07.
//

import Foundation
import CoreData

class UserDataContorller: ObservableObject {
    let container = NSPersistentContainer(name: "NoteFood3")
    
    init() {
        container.loadPersistentStores{
            desc, error in
            if let error = error {
                print("Failed \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("user saved!")
        } catch {
            print("failed to save user")
        }
    }
    
    func createUser(name: String, gender: String, weight: Double, height: Double, context: NSManagedObjectContext) {
        let user = User(context: context)
        
        user.name = name
        user.gender = gender
        user.weight = weight
        user.height = height
        
        save(context: context)
    }
    
//
//    func editUser(user: User, name: String, gender: String, weight: Double, height: Double, context: NSManagedObjectContext) {
//        user.name = name
//        user.gender = gender
//        user.weight = weight
//        user.height = height
//
//        save(context: context)
//    }
    func editUser(user: User, name: String, context: NSManagedObjectContext) {
        user.name = name
        
        save(context: context)
    }
 
}

