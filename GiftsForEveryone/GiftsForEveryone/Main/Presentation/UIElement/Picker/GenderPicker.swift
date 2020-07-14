//
//  GenderPicker.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/11/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class GenderPicker: UIPickerView {
    
    typealias Listener = (Gender) -> Void
    
    private var items = [Gender]()
    
    var listener: Listener?
    
    init(items: [Gender]) {
        super.init(frame: .zero)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
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
        listener?(item)
    }
}
