//
//  ResultViewModel.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

final class ResultViewModel {
    
    private let gifts: [Gift]
    
    let boxingGifts = Box<[Gift]>()
    
    init(gifts: [Gift]) {
        self.gifts = gifts
    }
    
    func viewDidLoad() {
        boxingGifts.value = gifts
    }
}
