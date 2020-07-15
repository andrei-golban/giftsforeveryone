//
//  ResultViewModel.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

final class ResultViewModel {
    
    private let _birthday: Date
    
    private let _gender: Gender
    
    private let _currentDay: Date
    
    private let _gifts: [Gift]
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        return dateFormatter
    }()
    
    let birthday = Observable<String>()
    
    let gender = Observable<String>()
    
    let currentDay = Observable<String>()
    
    let gifts = Observable<String>()
    
    init(result: ResultPresentationModel) {
        self._birthday = result.birthDay
        self._gender = result.gender
        self._currentDay = result.currentDay
        self._gifts = result.gifts
    }
    
    func viewDidLoad() {
        let format = Localizable.Global.resultFormat.localized
        birthday.value = String(format: format,
                                Localizable.Global.birthday.localized,
                                dateFormatter.string(from: _birthday))
        gender.value = String(format: format,
                              Localizable.Global.gender.localized,
                              _gender.localizedString)
        currentDay.value = String(format: format,
                                  Localizable.Global.currentDate.localized,
                                  dateFormatter.string(from: _currentDay))
        gifts.value = String(format: format,
                             Localizable.Global.receivedGifts.localized,
                             _gifts.map { $0.localizedString }.joined(separator: ", "))
    }
}
