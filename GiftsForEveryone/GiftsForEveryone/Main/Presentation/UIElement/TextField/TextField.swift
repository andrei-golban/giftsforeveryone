//
//  TextField.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/11/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class TextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
    }
}
