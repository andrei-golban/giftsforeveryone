//
//  GiftStore.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/13/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

protocol GiftStore {
    
    func getGifts(birthday: Date, date: Date, gender: Gender) -> [Gift]
}

struct DefaultGiftStore {
    
    let holidayStore: HolidayStore
    
    private func getGifts(holiday: Holiday, age: Int, gender: Gender) -> [Gift] {
        switch holiday {
        case .birthday where (7...12).contains(age):
            return [.lego, .book]
        case .birthday:
            return [.book]
        case .newYear where (7...12).contains(age):
            return [.chocolate(quantity: 1, color: .black, size: .big), .orange(quantity: 1)]
        case .february23 where gender == .male:
            return [.socks]
        case .march8 where gender == .female:
            return [.flowers]
        default:
            return []
        }
    }
}

extension DefaultGiftStore: GiftStore {
    
    func getGifts(birthday: Date, date: Date, gender: Gender) -> [Gift] {
        let isLeapYear = date.isLeapYear
        
        guard !isLeapYear else { return [] }
        
        let age = date.year - birthday.year
        let holidays = holidayStore.getHolidays(birthday: birthday, date: date)
        
        return holidays.flatMap { getGifts(holiday: $0, age: age, gender: gender) }
    }
}
