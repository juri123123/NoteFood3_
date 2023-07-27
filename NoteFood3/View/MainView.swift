//
//  MainPageView.swift
//  NoteFood
//
//  Created by juri on 2023/04/05.
//

import SwiftUI

struct ColorManager {
    static let BackgroundColor = Color("BackgroundColor")
}

struct MainView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var currentDate: Date = Date()
    //@State var userId: UUID
    //var users: FetchedResults<User>.Element
    var user: User
    var today = Date()
    
    //
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \User.weight, ascending: true)],
    //        animation: .default)
    //    private var users: FetchedResults<User>
    
    var body: some View {
        ZStack {
            ColorManager.BackgroundColor.ignoresSafeArea()
            VStack {
//                HStack {
//                    NavigationLink(destination: ProfileView(user: user)) {
//                        Image(systemName: "line.3.horizontal")
//                            .foregroundColor(.orange)
//                            .font(.system(size: 30))
//                        //Text(user.name ?? "name")
//                        // Text(String(user.height))
//
//
//                    }
//                    .padding(.leading)
//                }
                CustomCalendar(user: user, currentDate: $currentDate)
                   
            }//VStack
            
        }//ZStack
        
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink{
                    ProfileView(user: user)
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.orange)
                }
            }
        }
//        .navigationBarHidden(true)
        
        
        
    }
    
}

//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}

