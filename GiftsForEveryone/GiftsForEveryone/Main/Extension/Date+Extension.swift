//
//  Date+Extension.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/13/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

extension Date {
    
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
        
    var isLeapYear: Bool {
        return (year % 100 == 0) ? (year % 400 == 0) : (year % 4 == 0)
    }
    
    func isSameDay(month: Int, day: Int) -> Bool {
        return self.month == month && self.day == day
    }
}
