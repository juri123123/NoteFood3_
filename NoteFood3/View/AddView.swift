//
//  AddView.swift
//  NoteFood
//
//  Created by juri on 2023/04/11.
//

import SwiftUI

struct AddView: View {
//    @Binding var today: String = ""
    //@Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    var user: User
    var today: Date
    
    @State private var carbo: Double = 0
    @State private var protein: Double = 0
    @State private var province: Double = 0
    @State private var water: Int = 0
   // @State private var selectedUser = User()
    
    var body: some View {
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
                        TextField("carbo: ", value: $carbo, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                        Text("mg")
                    
                        
                    }.padding()
                    HStack{
                        Text("단백질: ")
                        Spacer()
                        TextField("protein: ", value: $protein, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                        Text("mg")
                    
                        
                    }.padding()
                    HStack{
                        Text("지방: ")
                        Spacer()
                        TextField("province: ", value: $province, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                            .frame(width: 80)
                        Text("mg")
                    
                        
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
                    addFood()
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
            }
            
           
        }
        
    }
    
    let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd"
            return formatter
        }()
    
    func addFood() {
        let newFood = Food(context: viewContext)
        newFood.id = UUID()
        newFood.user = user
        newFood.today = today
        newFood.carbo = self.carbo
        newFood.protein = self.protein
        newFood.province = self.province
        newFood.water = Int32(self.water)
        
        
        //let _ = print("\(newFood.today)")
        //FoodDataContorller().save(context: viewContext)
        do {
            try viewContext.save()
            //dismiss() //가장 처음에 저장된 날짜에 뜸

        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        //dismiss() //가장 마지막에 저장된 날짜로 뜸
        //try? managedObjectContext.save()
        
    }
}


//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView()
//    }
//}

