////
////  ResultView.swift
////  NoteFood
////
////  Created by juri on 2023/04/11.
////
//
//import SwiftUI
//
//struct ResultView: View {
//    //DB에서 영양성분 받아와야 함
//    private var carbo: Double = 0
//    private var protein: Double = 0
//    private var province: Double = 0
//    private var water: Int = 0
//    
//    @State private var alertShow = false
//    
//    var body: some View {
//        ZStack{
//            ColorManager.BackgroundColor.ignoresSafeArea()
//            VStack{
//                Text("Today")
//                    .font(.title2)
//                
//                Divider()
//                    .frame(width: 350, height:2)
//                    .overlay(.gray)
//                    .frame(height:30)
//                VStack(alignment:.leading){
//                    
//                    HStack{
//                        Text("탄수화물: ")
//                        Spacer()
//                        //Text(carbo)
//                        Text("g")
//                    
//                        
//                    }.padding()
//                    HStack{
//                        Text("단백질: ")
//                        Spacer()
//                        
//                        Text("g")
//                    
//                        
//                    }.padding()
//                    HStack{
//                        Text("지방: ")
//                        Spacer()
//                        
//                        Text("g")
//                    
//                        
//                    }.padding()
//                    HStack{
//                        Text("물: ")
//                        Spacer()
//                        
//                        Text("ml")
//                    
//                        
//                    }.padding()
//                    Spacer()
//                }
//                Spacer()
//                Button(action: {
//                    // 영양성분 분석 로직 필요
//                    // alert 표시 --> alert말고 bottom sheet 사용하는게 좋을 듯
//                    alertShow = true
//                }, label: {
//                    ZStack{
//                        Circle()
//                            .frame(height: 50)
//                            .foregroundColor(.orange)
//                        Image(systemName: "questionmark")
//                            .foregroundColor(.white)
//                            .font(.system(size: 25))
//                    }
//                })
//                .alert("GREAT!", isPresented: $alertShow) {
//                    Button("OK", role: .cancel){
//                        
//                    }
//                }
//                .padding()
//            }
//            
//           
//        }
//    }
//}
//
//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
//
