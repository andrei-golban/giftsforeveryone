//
//  UIViewController+Extension.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/14/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func dismissKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
