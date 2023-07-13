//
//  NoteFood3App.swift
//  NoteFood3
//
//  Created by juri on 2023/07/05.
//

import SwiftUI

@main
struct NoteFood3App: App {
    
    //@Environment(\.managedObjectContext) var managedObjectContext

//    @StateObject private var foodDataController = FoodDataContorller()
    //@StateObject private var userDataController = UserDataContorller()
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            
            
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
