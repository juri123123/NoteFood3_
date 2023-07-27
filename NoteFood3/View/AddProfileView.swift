//
//  AddProfileView.swift
//  NoteFood3
//
//  Created by juri on 2023/07/13.
//

import SwiftUI
import CoreData

struct AddProfileView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var height: String = ""
    @State var weight: String = ""
    
    var body: some View{
        
        VStack {
            
            Form{
                Section{
                    HStack{
                        Text("name : ")
                        TextField("Enter your name", text: $name)
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                        
                    }
                    HStack {
                        Text("height:")
                        TextField("Enter your height", text: $height)
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                        
                    }
                    
                    HStack {
                        Text("weight:")
                        TextField("Enter your weight", text: $weight)
                            .padding()
                            .background(Color(uiColor: .secondarySystemBackground))
                       
                    }
                    
                    
                    
                }.padding()
                
                Section{
                    Button(action: addUser, label: {
                        ZStack{
                            Capsule()
                                .frame(height: 50)
                                .foregroundColor(.orange)
                            Text("SAVE")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                        }
                    })
                }.padding()
                
                
                
            }
        }
    }
    
    func addUser() {
        let newUser = User(context: viewContext)
        newUser.name = self.name
        newUser.weight = self.weight
        newUser.height = self.height
        newUser.gender = "female"

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        dismiss()
    }
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
}

struct AddProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AddProfileView()
    }
}
