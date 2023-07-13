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
                    HStack {
                        NavigationLink(destination: ProfileView(user: user)) {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.orange)
                                .font(.system(size: 30))
                            Text(user.name ?? "name")
                            
                            
                        }
                        .padding(.leading)
                        Spacer()
                    }
                    //CustomCalendar(currentDate: $currentDate)
                    HStack(spacing: 200) {
                        //View 넘길 때 체크된 날짜 정보도 넘기기
                        NavigationLink(destination: AddView()) {
                            ZStack{
                                Circle()
                                    .frame(width: 45)
                                    .foregroundColor(.orange)
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                            }
                        }
                        
                        //                        NavigationLink(destination: ResultView()) {
                        //                            ZStack{
                        //                                Circle()
                        //                                    .frame(width: 45)
                        //                                    .foregroundColor(.orange)
                        //                                Image(systemName: "checkmark")
                        //                                    .foregroundColor(.white)
                        //                                    .font(.system(size: 25))
                        //                            }
                        //                        }
                    }//HStack
                    
                    
                    
                }//VStack
                
            }//ZStack


        
    }
    
}

//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}

