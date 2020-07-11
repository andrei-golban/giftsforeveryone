//
//  InputViewController.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/10/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class InputViewController: UIViewController {
    
    weak var coordinator: InputCoordinator?
    
    private let viewModel: InputViewModel
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var birthdayDateTxtField: TextField = {
        let textField = TextField()
        textField.placeholder = NSLocalizedString("birthday", comment: "")
        textField.inputAccessoryView = DatePicker()
        return textField
    }()
    
    private lazy var sexTxtField: TextField = {
        let textField = TextField()
        textField.inputAccessoryView = SexPicker()
        return textField
    }()
    
    private lazy var currentDateTxtField: TextField = {
        let textField = TextField()
        textField.placeholder = NSLocalizedString("current.date", comment: "")
        textField.inputAccessoryView = DatePicker()
        return textField
    }()
    
    private lazy var randomizeInputBtn: Button = {
        let button = Button()
        let title = NSLocalizedString("randomize.input", comment: "")
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(randomizeInputBtnPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var receiveBtn: Button = {
        let button = Button()
        let title = NSLocalizedString("receive", comment: "")
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(receiveBtnPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: InputViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
    }
    
    private func setupUI() {
        view.addSubview(containerView)
        [birthdayDateTxtField, sexTxtField, currentDateTxtField, randomizeInputBtn, receiveBtn].forEach { containerView.addSubview($0) }
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            birthdayDateTxtField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            birthdayDateTxtField.topAnchor.constraint(equalTo: containerView.topAnchor),
            birthdayDateTxtField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            birthdayDateTxtField.heightAnchor.constraint(equalToConstant: 35),
            
            sexTxtField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sexTxtField.topAnchor.constraint(equalTo: birthdayDateTxtField.bottomAnchor, constant: 20),
            sexTxtField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sexTxtField.heightAnchor.constraint(equalToConstant: 35),
            
            currentDateTxtField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            currentDateTxtField.topAnchor.constraint(equalTo: sexTxtField.bottomAnchor, constant: 20),
            currentDateTxtField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            currentDateTxtField.heightAnchor.constraint(equalToConstant: 35),
            
            randomizeInputBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            randomizeInputBtn.topAnchor.constraint(equalTo: currentDateTxtField.bottomAnchor, constant: 5),
            randomizeInputBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            randomizeInputBtn.heightAnchor.constraint(equalToConstant: 40),
            
            receiveBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            receiveBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            receiveBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            receiveBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    @objc private func randomizeInputBtnPressed(_ button: UIButton) {
        viewModel.randomizeInput()
    }
    
    @objc private func receiveBtnPressed(_ button: UIButton) {
        coordinator?.showResultScreen()
    }
}
