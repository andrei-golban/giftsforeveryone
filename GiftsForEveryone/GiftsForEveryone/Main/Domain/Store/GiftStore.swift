//
//  GiftStore.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/13/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

protocol GiftStore {
    
    func getGifts(user: UserDomainModel, date: Date) -> [Gift]
}

struct DefaultGiftStore {
    
    let holidayStore: HolidayStore
    
    private func getGifts(holiday: Holiday, user: UserDomainModel, date: Date) -> [Gift] {
        let isLeapYear = date.isLeapYear
        
        guard !isLeapYear else { return [] }
        
        let age = date.year - user.birthday.year
        
        switch holiday {
        case .birthday where (7...12).contains(age):
            return [.lego, .book]
        case .birthday:
            return [.book]
        case .newYear where (7...12).contains(age):
            return [.chocolate(quantity: 1, size: .big, color: .black), .orange(quantity: 1)]
        case .february23 where user.gender == .male:
            return [.socks]
        case .march8 where user.gender == .female:
            return [.flowers]
        default:
            return []
        }
    }
}

extension DefaultGiftStore: GiftStore {
    
    func getGifts(user: UserDomainModel, date: Date) -> [Gift] {
        let holidays = holidayStore.getHolidays(user: user, date: date)
        return holidays.flatMap { getGifts(holiday: $0, user: user, date: date) }
    }
}
