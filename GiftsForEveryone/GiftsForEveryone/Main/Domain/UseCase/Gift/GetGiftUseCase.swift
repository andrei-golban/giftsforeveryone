//
//  GetGiftUseCase.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

protocol GetGiftUseCase: class {
    
   func execute(birthDay: Date, date: Date, gender: Gender) -> [Gift]
}

final class DefaultGetGiftUseCase {
    
    let giftStore: GiftStore
    
    init(giftStore: GiftStore) {
        self.giftStore = giftStore
    }
}

extension DefaultGetGiftUseCase: GetGiftUseCase {
    
    func execute(birthDay: Date, date: Date, gender: Gender) -> [Gift] {
        return giftStore.getGifts(birthday: birthDay, date: date, gender: gender)
    }
}
