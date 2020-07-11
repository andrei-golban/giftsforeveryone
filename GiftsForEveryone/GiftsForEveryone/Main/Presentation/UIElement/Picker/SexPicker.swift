//
//  SexPicker.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/11/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class SexPicker: UIPickerView {
    
    var items = [String]()
    
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        items = ["male", "female"].map { NSLocalizedString($0, comment: "") }
        dataSource = self
        delegate = self
    }
}

extension SexPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
}

extension SexPicker: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
