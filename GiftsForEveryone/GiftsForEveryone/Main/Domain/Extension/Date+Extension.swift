//
//  Date+Extension.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/13/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

extension Date {
    
    func age(to: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self, to: to)
        return components.year!
    }
    
    func isLeapYear() -> Bool {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        let year = components.year!
        return (year % 100 == 0) ? (year % 400 == 0) : (year % 4 == 0)
    }
    
    func isSameDayAs(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }
    
    func isSameDayAs(month: Int, day: Int) -> Bool {
        let calendar = Calendar.current
        let components = DateComponents(calendar: calendar, month: month, day: day)
        let date = components.date!
        return calendar.isDate(self, inSameDayAs: date)
    }
}
