//
//  GenderPicker.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/11/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class GenderPicker: UIPickerView {
    
    var items: [Gender]
    
    let valueChanged = Observable<Gender>()
    
    init(items: [Gender]) {
        self.items = items
        super.init(frame: .zero)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        dataSource = self
        delegate = self
    }
}

extension GenderPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
}

extension GenderPicker: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row].localizedString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = items[row]
        valueChanged.value = item
    }
}
