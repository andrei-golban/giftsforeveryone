//
//  RepositoryTask.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation

final class RepositoryTask: Cancelable {
    
    var task: Cancelable? = nil
    
    var isCanceled: Bool = false
    
    func cancel() {
        task?.cancel()
        isCanceled = true
    }
}
