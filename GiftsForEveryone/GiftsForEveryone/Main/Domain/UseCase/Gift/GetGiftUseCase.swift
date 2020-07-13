//
//  GetGiftUseCase.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

protocol GetGiftUseCase: class {
    
    func execute(birthday: Date, currentDay: Date, gender: Gender) -> [Gift]
}

final class DefaultGetGiftUseCase {
    
}

extension DefaultGetGiftUseCase: GetGiftUseCase {
    
    func execute(birthday: Date, currentDay: Date, gender: Gender) -> [Gift] {
        var gifts = [Gift]()
        let age = birthday.age(to: currentDay)
        
        switch (age, gender) {
        case (_, _) where currentDay.isLeapYear():
            break
        case (_, _) where currentDay.isSameDayAs(date: birthday):
            gifts.append(Book(name: "Book"))
            fallthrough
        case (7...12, _) where currentDay.isSameDayAs(date: birthday):
            gifts.append(Lego(name: ""))
            fallthrough
        case (7...12, _) where currentDay.isSameDayAs(month: 12, day: 31):
            gifts.append(Chocolate(name: "", quantity: 1, size: .big))
            gifts.append(Orange(name: "", quantity: 1))
            fallthrough
        case (_, .male) where currentDay.isSameDayAs(month: 2, day: 23):
            gifts.append(Socks(name: ""))
            fallthrough
        case (_, .female) where currentDay.isSameDayAs(month: 3, day: 8):
            gifts.append(Flowers(name: ""))
            fallthrough
        default:
            break
        }
        
        return gifts
    }
}
