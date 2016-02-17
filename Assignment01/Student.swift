//
//  Student.swift
//  Assignment01
//
//  Created by James Farrington on 1/25/16.
//  Copyright (c) 2016 James Farrington. All rights reserved.
//

import Foundation

class student: CustomStringConvertible {
    var emoji: String = ""
    var First: String = ""
    var Last: String = ""
    var Classification: String = ""
    var Home: String = ""
    var DOB: NSDate?
    var birthday: String = ""
    var Age: Double {
        let Today = NSDate()
        let todayMilli: NSTimeInterval = Today.timeIntervalSince1970
        let bdayMilli: NSTimeInterval = (DOB?.timeIntervalSince1970)!
        let difference = (todayMilli - bdayMilli) / 31536000
        return Double(round(1000*difference)/1000)
    }
    var description: String {
        return "\(First) \(Last) is a \(Classification) from \(Home). \(First) was born on \(birthday) and is \(Age) years old. \(emoji)"
    }
    func dateStringAs(Date: NSDate) -> String{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM-DD-YYYY"
        let dateString = formatter.stringFromDate(Date)
        return dateString
    }
    
 
    
}