//
//  FoodDataController.swift
//  NoteFood3
//
//  Created by juri on 2023/07/07.
//

import Foundation
import CoreData

class FoodDataContorller: ObservableObject {
    let container = NSPersistentContainer(name: "Food") //NoteFood3
    
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
            print("food saved!")
        } catch {
            print("failed to save food")
        }
    }
    
//    func addFood(carbo: Double, protein: Double, province: Double, water: Int32, context: NSManagedObjectContext) {
//        let food = Food(context: context)
//        food.id = UUID()
//        food.today = Date()
//        food.carbo = carbo;
//        food.protein = protein;
//        food.province = province;
//        food.water = water;
//
//        save(context: context)
//    }
}
