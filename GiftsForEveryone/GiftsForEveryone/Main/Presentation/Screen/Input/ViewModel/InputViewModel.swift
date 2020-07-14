//
//  InputViewModel.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/10/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

final class InputViewModel {
    
    private let getUserUseCase: GetUserUseCase
    
    private let getGiftUseCase: GetGiftUseCase
    
    let birthday = Box<Date>()
    
    let gender = Box<Gender>()
    
    let currentDay = Box<Date>()
    
    let gifts = Box<[Gift]>()
    
    init(getUserUseCase: GetUserUseCase, getGiftUseCase: GetGiftUseCase) {
        self.getUserUseCase = getUserUseCase
        self.getGiftUseCase = getGiftUseCase
    }
    
    func randomizeInput() {
        getUserUseCase.execute { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case let .success(data):
                self.birthday.value = data.birthday
                self.gender.value = data.gender
            case let .failure(error):
                break
            }
        }
    }
    
    func getGifts(user: UserDomainModel, date: Date) {
        gifts.value = getGiftUseCase.execute(user: user, date: date)
    }
}
