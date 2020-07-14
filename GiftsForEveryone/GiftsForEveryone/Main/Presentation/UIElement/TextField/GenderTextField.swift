//
//  GenderTextField.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/13/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class GenderTextField: UITextField {
    
    private let genderPicker: GenderPicker
    
    var inputValue: Gender? {
        get { return Gender(rawValue: genderPicker.selectedRow(inComponent: 0)) }
        set { genderPicker.selectedRow(inComponent: 0) }
    }
    
    init(genderPicker: GenderPicker) {
        self.genderPicker = genderPicker
        super.init(frame: .zero)
        setupUI()
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
    private func setupUI() {
        genderPicker.bind { [weak self] item in
            guard let self = self else { return }
            
            self.text = item.localizedString
            self.endEditing(true)
        }
        inputView = genderPicker
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
    }
}
