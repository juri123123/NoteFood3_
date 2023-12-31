//
//  ContentView.swift
//  NoteFood3
//
//  Created by juri on 2023/07/05.
//

import SwiftUI
import CoreData

struct TestView: View {
    @Environment(\.managedObjectContext) private var viewContext
    //@ObservedObject var food: Food
    
    var user: User
    var today: Date
    //
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \User.name, ascending: true)],
    //        animation: .default)
    //    private var items: FetchedResults<Food>
    
    var body: some View {
        //let lists = user.foods?.allObjects
        
        List {
            if let items = user {
                ForEach(items.food) { item in
                    let todayStr = formatter.string(from: today)
                    let itemStr = formatter.string(from: item.today!)
                    let _ = print("today: \(itemStr)")
                    if todayStr == itemStr {
                    NavigationLink{ 
                        
                        //Text("Item at \(item.name!)")
                    } label: {
                        let protein = String(format: "%.1f", item.protein)
                        
                        let time = DateFormatter().string(from: item.today!)
                        
                        //Text("시간 : \(time)")
                        Text("단백질 : \(protein)")
                    }
                    }
                    
                }
                //                    .onDelete(perform: deleteItems)
            }
            
        }
        .background(.background)
        
    }
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter
    }()
    
    //    private func addItem() {
    //        withAnimation {
    //            let newUser = User(context: viewContext)
    //            newUser.name = "name1"
    //            newUser.weight = 50
    //            newUser.height = 160
    //            newUser.gender = "female"
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
    
    //    private func deleteItems(offsets: IndexSet) {
    //        withAnimation {
    //            offsets.map { items[$0] }.forEach(viewContext.delete)
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).previewInterfaceOrientation(.portrait)
//    }
//}

