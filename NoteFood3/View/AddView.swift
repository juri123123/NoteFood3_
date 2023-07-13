//
//  AddView.swift
//  NoteFood
//
//  Created by juri on 2023/04/11.
//

import SwiftUI

struct AddView: View {
//    @Binding var today: String = ""
    
    @State private var carbo: Double = 0
    @State private var protein: Double = 0
    @State private var province: Double = 0
    @State private var water: Int = 0
    
    var body: some View {
        ZStack{
            ColorManager.BackgroundColor.ignoresSafeArea()
            VStack{
                Text("Today")
                    .font(.title2)
                
                Divider()
                    .frame(width: 350, height:2)
                    .overlay(.gray)
                    .frame(height:30)
                VStack(alignment:.leading){
                    
                    HStack{
                        Text("탄수화물: ")
                        Spacer()
                        TextField("carbo: ", value: $carbo, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                        Text("g")
                    
                        
                    }.padding()
                    HStack{
                        Text("단백질: ")
                        Spacer()
                        TextField("protein: ", value: $protein, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                        Text("g")
                    
                        
                    }.padding()
                    HStack{
                        Text("지방: ")
                        Spacer()
                        TextField("province: ", value: $province, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                        Text("g")
                    
                        
                    }.padding()
                    HStack{
                        Text("물: ")
                        Spacer()
                        TextField("water: ", value: $water, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                        Text("ml")
                    
                        
                    }.padding()
                    Spacer()
                }
                Spacer()
                Button(action: {
                    //DB에 영양정보 저장
                    //mainpage로 이동
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
            }
            
           
        }
        
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}

