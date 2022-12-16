//
//  NumberOfDays.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 15.10.2022.
//

import Foundation

struct NumberOfDays {
   static func dateDayCount(date:String,format:String = "dd.MM.yy") -> Int {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.timeStyle = .medium
        dateFormatter.dateFormat = format
        
        let calender = Calendar.current
        
        let firstDate = calender.startOfDay(for: dateFormatter.date(from: date)!)
        let twiceDate = calender.startOfDay(for: Date())
        
        let companents = calender.dateComponents([.day], from: firstDate, to: twiceDate)
        
        return companents.day!
        
    }
    
    static func dayBetweenTwoDates(date:String,twiceDate : String ,format:String = "dd.MM.yy") -> Int {
         
         let dateFormatter = DateFormatter()
         
         dateFormatter.locale = Locale.current
         dateFormatter.timeZone = TimeZone.autoupdatingCurrent
         dateFormatter.timeStyle = .medium
         dateFormatter.dateFormat = format
         
         let calender = Calendar.current
         
         let firstDate = calender.startOfDay(for: dateFormatter.date(from: date)!)
         let twiceDate = calender.startOfDay(for: dateFormatter.date(from: twiceDate)!)
         
         let companents = calender.dateComponents([.day], from: firstDate, to: twiceDate)
         
         return companents.day!
         
     }
    
    
}
