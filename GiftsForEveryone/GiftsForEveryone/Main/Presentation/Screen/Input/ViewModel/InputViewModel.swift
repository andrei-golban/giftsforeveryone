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
    
    let birthday = Observable<Date>()
    
    let gender = Observable<Gender>()
    
    let currentDay = Observable<Date>()
    
    let error = Observable<DomainError>()
    
    let result = Observable<ResultPresentationModel>()
    
    init(getUserUseCase: GetUserUseCase, getGiftUseCase: GetGiftUseCase) {
        self.getUserUseCase = getUserUseCase
        self.getGiftUseCase = getGiftUseCase
    }
    
    func randomizeInput() {
        getUserUseCase.execute { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case let .success(data):
                let user = data.first
                self.birthday.value = user?.birthday
                self.gender.value = user?.gender
            case let .failure(error):
                self.error.value = error
            }
        }
    }
    
    func birthdayDidChange(value: Date) {
        birthday.value = value
    }
    
    func genderDidChange(value: Gender) {
        gender.value = value
    }
    
    func currentDayDidChange(value: Date) {
        currentDay.value = value
    }
    
    func getGifts() {
        guard let birthday = birthday.value else {
            error.value = DomainError.birthdayFieldEmpty
            return
        }
        
        guard let gender = gender.value else {
            error.value = DomainError.genderFieldEmpty
            return
        }
        
        guard let currentDay = currentDay.value else {
            error.value = DomainError.currentDateEmpty
            return
        }
        
        let gifts = getGiftUseCase.execute(birthDay: birthday, date: currentDay, gender: gender)
        
        result.value = ResultPresentationModel(birthDay: birthday,
                                               gender: gender,
                                               currentDay: currentDay,
                                               gifts: gifts)
    }
}
