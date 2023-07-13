//
//  ProfileView.swift
//  NoteFood
//
//  Created by juri on 2023/03/29.
//

import SwiftUI
import CoreData

struct ProfileView: View {
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \User.timestamp, ascending: true)],
//        animation: .default)
//    private var user: FetchedResults<User>
    
    var user: User
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    @State private var name = ""
    @State var height: Double = 0
    @State var weight: Double = 0

    
    
//    let genderItems: [String] = ["male", "female"]
//
//    @State private var selectedGender = ""
//    @State private var height: Int32 = 0
//    @State private var weight: Double = 0
//
//
//    init() {
//        self.add(managedObjectContext: managedObjectContext)
//    }
    var body: some View{
        Form{
            Section{
//                TextField("\(user.name!)", text:$name)
//                    .onAppear{
//                        name = user.name!
//                    }f
                HStack{
                    Text("name : ")
                    TextField("\(user.name!)", text:$name).onAppear() {
                        self.name = user.name!
                    }
                        .padding()
                        .background(Color(uiColor: .secondarySystemBackground))
                    
                }
                HStack {
                    Text("height:")
                    TextField("\(user.height)", value: $height, formatter: formatter)
                        .padding()
                        .background(Color(uiColor: .secondarySystemBackground))
                    
                }
                HStack {
                    Text("height:")
                    TextField("\(user.weight)", value: $weight, formatter: formatter)
                        .padding()
                        .background(Color(uiColor: .secondarySystemBackground))
                    
                }
            }
            
            Button(action: {
                //DB에 회원정보 저장
                //mainpage로 이동
                
                UserDataContorller()
                    .editUser(user: user, name: name, context: managedObjectContext)
                dismiss()
                
             
            }, label: {
                ZStack{
                    Capsule()
                        .frame(height: 50)
                        .foregroundColor(.orange)
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
            })
            .padding()
            Spacer()
        }
        .background(.background)
    }
}
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView().environment(\.managedObjectContext, NSManagedObjectContext)
//    }
//}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView(user: user).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
