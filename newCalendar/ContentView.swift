//
//  ContentView.swift
//  newCalendar
//
//  Created by Zet on 12/25/19.
//  Copyright © 2019 Zet. All rights reserved.
//

import SwiftUI



struct CalendarDate {
  
    let myDateFormatter = DateFormatter()
    
    func convertCalendar (inputDate:Date, calendarChosen:Calendar.Identifier) -> String {
        
        myDateFormatter.dateStyle = .long
        myDateFormatter.calendar = .init(identifier: calendarChosen)
        
        return  myDateFormatter.string(from: inputDate)
    }
    
    
    
}




struct ContentView: View {
    
  
    var myCalendarDate = CalendarDate()
    
    @State var pickedDate = Date()
    @State var pickedCalendar: Calendar.Identifier = .buddhist
    
    var body: some View {
        
        
        ZStack {
            
            Color.black
            
            VStack (spacing: 20) {
                
                Spacer()
           
                Text("Calendar Changer").font(.largeTitle).foregroundColor(.white)
                
                DatePicker(selection: $pickedDate, displayedComponents: .date, label:{Text("Pick a date")}).labelsHidden()
                    .background(RoundedRectangle(cornerRadius: 20)).foregroundColor(.gray)
             Divider()
                VStack {
                    Text(" \(myCalendarDate.convertCalendar(inputDate: pickedDate, calendarChosen: pickedCalendar))")
                    Text ("according to below choosen calendar")
                }.font(.body).padding().frame(maxWidth: .infinity).background(Color.orange)
             Divider()
             
             HStack {
                 Text ("Pick the calendar").font(.title)
                 Image(systemName: "arrow.down").font(.title)
                }.foregroundColor(Color.white)
             
                 Picker(selection: $pickedCalendar, label:Text("Pick the calendar")) {
                            
                            Text ("buddhist").tag(Calendar.Identifier.buddhist)
                            Text ("chinese").tag(Calendar.Identifier.chinese)
                            Text ("coptic").tag(Calendar.Identifier.coptic)
                            Text ("gregorian").tag(Calendar.Identifier.gregorian)
                            Text ("hebrew").tag(Calendar.Identifier.hebrew)
                            Text ("indian").tag(Calendar.Identifier.indian)
                            Text ("islamic").tag(Calendar.Identifier.islamic)
                            Text ("japanese").tag(Calendar.Identifier.japanese)
                            Text ("persian").tag(Calendar.Identifier.persian)
                            
                 }.labelsHidden().background(RoundedRectangle(cornerRadius:20).foregroundColor(.gray))
                
                Spacer()
                
                Text("Copyright @ Dec,2019, F.Karimov").foregroundColor(.orange)
            
                         
             
                 }
             
             
        }.edgesIgnoringSafeArea(.all)
            
            
        }
        
        }
       
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




