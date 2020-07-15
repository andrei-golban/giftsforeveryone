//
//  DatePicker.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/10/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class DatePicker: UIDatePicker {
    
    let valueChanged = Observable<Date>()
    
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
        datePickerMode = .date
        addTarget(self, action: #selector(valueChanged(datePicker:)), for: .valueChanged)
    }
    
    @objc private func valueChanged(datePicker: DatePicker) {
        valueChanged.value = datePicker.date
    }
}
