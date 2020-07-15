//
//  HolidayStore.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/14/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

protocol HolidayStore {
    
    func getHolidays(birthday: Date, date: Date) -> [Holiday]
}

struct DefaultHolidayStore {
    
    private func createHolidays(birthDate: Date) -> [Holiday] {
        return [.birthday(date: birthDate), .newYear, .march8, .february23]
    }
}

extension DefaultHolidayStore: HolidayStore {
    
    func getHolidays(birthday: Date, date: Date) -> [Holiday] {
        let holidays = createHolidays(birthDate: birthday)
        return holidays.filter { date.isSameDay(month: $0.month, day: $0.day) }
    }
}
