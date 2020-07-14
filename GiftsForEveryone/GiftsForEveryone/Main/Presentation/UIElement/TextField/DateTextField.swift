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
    
    private let dateFormatter = DateFormatter()
    
    var dateFormat: String
    
    var inputValue: Date {
        get { return datePicker.date }
        set { datePicker.date = newValue }
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
        datePicker.addTarget(self, action: #selector(valueChanged(datePicker:)), for: .valueChanged)
        dateFormatter.dateFormat = dateFormat
        inputView = datePicker
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
    }
    
    @objc private func valueChanged(datePicker: DatePicker) {
        text = dateFormatter.string(from: datePicker.date)
    }
}
