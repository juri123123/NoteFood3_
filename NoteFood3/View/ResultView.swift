//
//  ResultView.swift
//  NoteFood
//
//  Created by juri on 2023/04/11.
//

import SwiftUI

struct ResultView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    var user: User
    var today: Date

    //DB에서 영양성분 받아와야 함
//    private var carbo: Double = 0
//    private var protein: Double = 0
//    private var province: Double = 0
//    private var water: Int = 0
//
    @State private var alertShow = false
    
    var body: some View {
        
//        if let items = user.foods!.allObjects as? [Food] {
//            ForEach(items) { item in
//                let todayStr = formatter.string(from: today)
//                let itemStr = formatter.string(from: item.today!)
//                let _ = print("today: \(itemStr)")
//                if todayStr == itemStr {
//                    carbo += Double(item.carbo)
//                    protein = Double(item.protein)
//                    province = Double(item.province)
//                    water = Int(item.water)
//                }
//
//            }
//        }
//
        ZStack{
            ColorManager.BackgroundColor.ignoresSafeArea()
            VStack{
                Text("\(formatter.string(from: today))")
                    .font(.title2)
                
                Divider()
                    .frame(width: 350, height:2)
                    .overlay(.gray)
                    .frame(height:30)
                VStack(alignment:.leading){
                    
                    HStack{
                        Text("탄수화물: ")
                        Spacer()
                        //Text("\(user.foods)")
                        Text("mg")
                    
                        
                    }.padding()
                    HStack{
                        Text("단백질: ")
                        Spacer()
                        
                        Text("mg")
                    
                        
                    }.padding()
                    HStack{
                        Text("지방: ")
                        Spacer()
                        
                        Text("mg")
                    
                        
                    }.padding()
                    HStack{
                        Text("물: ")
                        Spacer()
                        
                        Text("ml")
                    
                        
                    }.padding()
                    Spacer()
                }
                Spacer()
                Button(action: {
                    // 영양성분 분석 로직 필요
                    // alert 표시 --> alert말고 bottom sheet 사용하는게 좋을 듯
                    alertShow = true
                }, label: {
                    ZStack{
                        Circle()
                            .frame(height: 50)
                            .foregroundColor(.orange)
                        Image(systemName: "questionmark")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }
                })
                .alert("GREAT!", isPresented: $alertShow) {
                    Button("OK", role: .cancel){
                        
                    }
                }
                .padding()
            }
            
           
        }
    }
    let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd"
            return formatter
        }()
}
//
//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView(user: user)
//    }
//}

