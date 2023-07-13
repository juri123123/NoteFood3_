////
////  CustomDatePicker.swift
////  CustomDatePickerDemo
////
////  Created by Thongchai Subsaidee on 29/9/21.
////
//
//import SwiftUI
//
//struct CustomCalendar: View {
//    
//    @Binding var currentDate: Date
//    @State var  currentMonth: Int = 0
//    
//    var body: some View {
//        VStack(spacing: 35) {
//            
//            // Days
//            let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
//                        
//            HStack(spacing: 20) {
//                
//                
//                Button {
//                    withAnimation {
//                        currentMonth -= 1
//                    }
//                } label: {
//                    Image(systemName: "chevron.left")
//                        .font(.title2 )
//                }
//                
//                VStack(alignment: .leading, spacing: 10) {
////                    Text(extraDate()[0])
////                        .font(.caption)
////                        .fontWeight(.semibold)
//                    Text(extraDate()[1])
//                        .font(.title.bold())
//                }
//                
//                Button {
//                    withAnimation {
//                        currentMonth += 1
//                    }
//                } label: {
//                    Image(systemName: "chevron.right")
//                        .font(.title2)
//                }
//
//                
//            }
//            .padding()
//            
//            // Day View...
//            HStack(spacing: 0) {
//                ForEach(days, id: \.self) { day in
//                        Text(day)
//                        .font(.callout)
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: .infinity)
//                        .foregroundColor(.gray)
//                }
//            }
//            
//            
//            //Date
//            // Lazy Grid..
//            let columns = Array(repeating: GridItem(.flexible()), count: 7)
//            
//            LazyVGrid(columns: columns, spacing: 15) {
//                ForEach(extractDate()) { value in
//                  CardView(value: value)
//                        .background(
//                            Capsule()
//                                .fill(.orange)
//                                .padding(.horizontal, 8)
//                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
//                        )
//                        .onTapGesture {
//                            currentDate = value.date
//                        }
//                }
//            }
//            
//            VStack(spacing: 0) {
////                Text("Tasks")
////                    .font(.title2.bold())
////                    .frame(maxWidth: .infinity, alignment: .leading)
////                    .padding(.vertical , 20)
//
//                if let task = foods.first(where: { task in
//                    return isSameDay(date1: task.foodDate, date2: currentDate)
//                }) {
//
//                    ForEach(task.food) { task in
//
//                        VStack(alignment: .leading, spacing: 10) {
//                            
//                            Text("탄수화물: " + String(format: "%.1f", task.carbo))
//                                .font(.body)
//                            Text("단백질: " + String(format: "%.1f", task.protein))
//                                .font(.body)
//                            Text("지방: " + String(format: "%.1f", task.province))
//                                .font(.body)
//                            Text("수분: \(task.water)")
//                                .font(.body)
//                           
//                        }
//                        .padding(.vertical, 10)
//                        .padding(.horizontal)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(
//                            Color("Purple")
//                                .opacity(0.5)
//                                .cornerRadius(10)
//                                .frame(maxWidth: .infinity)
//
//                        )
//
//                    }
//
//                }else {
//                    Text("No Task Found")
//                }
//            }
//            .padding()
//
//            
//        }
//        .onChange(of: currentMonth) { newValue in
//            // update month
//            currentDate = getCurrentMonth()
//        }
//    }
//    
//    @ViewBuilder
//    func CardView(value: DateValue) -> some View {
//        
//        VStack {
//            
//            if value.day != -1 {
//                
//                if let task = foods.first(where: { task in
//                    return isSameDay(date1: task.foodDate, date2: value.date)
//                }) {
//
//                    Text("\(value.day)")
//                        .font(.title3.bold())
//                        .foregroundColor(isSameDay(date1: task.foodDate, date2: currentDate) ? .white : .primary)
//                        .frame(maxWidth: .infinity)
//
//                    Spacer()
//
//                    Circle()
//                        .fill(isSameDay(date1: task.foodDate, date2: currentDate) ? .white : Color(.orange) )
//                        .frame(width: 8, height: 8)
//
//                }else {
//                    Text("\(value.day)")
//                        .font(.title3.bold())
//                        .foregroundColor(isSameDay(date1: value.date , date2: currentDate) ? .white : .gray)
//                        .frame(maxWidth: .infinity)
//
//                    Spacer()
//                }
//
//                
//            }
//        }
//        .padding(.vertical, 9)
//        .frame(height: 60, alignment: .top)
//            
//    }
//    // Checking dates
//    func isSameDay(date1: Date, date2: Date) -> Bool {
//        
//        return Calendar.current.isDate(date1, inSameDayAs: date2)
//        
//    }
//    
//    
//    // Extraing year and month for display
//    func extraDate() -> [String] {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "YYYY MMMM"
//        
//        let date = formatter.string(from: currentDate)
//         
//        return date.components(separatedBy: " ")
//    }
//    
//    func getCurrentMonth() -> Date {
//        let calendar = Calendar.current
//        
//        // Getting Current month date
//        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
//            return Date()
//        }
//        
//        return currentMonth
//    }
//    
//    
//    func extractDate() -> [DateValue] {
//        
//        let calendar = Calendar.current
//        
//        // Getting Current month date
//        let currentMonth = getCurrentMonth()
//        
//        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
//            let day = calendar.component(.day, from: date)
//            let dateValue =  DateValue(day: day, date: date)
//            return dateValue
//        }
//        
//        // adding offset days to get exact week day...
//        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
//        
//        for _ in 0..<firstWeekday - 1 {
//            days.insert(DateValue(day: -1, date: Date()), at: 0)
//        }
//        
//        return days
//    }
//    
//}
//
//struct CustomCalendar_Previews: PreviewProvider {
//    static var previews: some View {
//        MainPageView()
//    }
//}
//
//extension Date {
//    
//    func getAllDates() -> [Date] {
//        
//        let calendar = Calendar.current
//        
//        // geting start date
//        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
//        
//        let range = calendar.range(of: .day, in: .month, for: startDate)
//        
//        
//        // getting date...
//        return range!.compactMap{ day -> Date in
//            return calendar.date(byAdding: .day, value: day - 1 , to: startDate)!
//        }
//        
//    }
//    
//    
//}
//
