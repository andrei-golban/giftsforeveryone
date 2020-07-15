//
//  DateTextField.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/13/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class DateTextField: UITextField {
        
    private let datePicker: DatePicker
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        return formatter
    }()
    
    private let dateFormat: String
    
    var valueChanged: Observable<Date> {
        return datePicker.valueChanged
    }
    
    var value: Date = Date() {
        didSet {
            datePicker.date = value
            text = dateFormatter.string(from: value)
        }
    }
    
    init(datePicker: DatePicker, dateFormat: String) {
        self.datePicker = datePicker
        self.dateFormat = dateFormat
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
        inputView = datePicker
        dateFormatter.dateFormat = dateFormat
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
    }
}
