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
    
    private lazy var birthdayTxtField: DateTextField = {
        let picker = DatePicker()
        let textField = DateTextField(datePicker: picker, dateFormat: "MM/dd/yyyy")
        textField.placeholder = NSLocalizedString("birthday", comment: "")
        return textField
    }()
    
    private lazy var genderTxtField: GenderTextField = {
        let picker = GenderPicker(items: Gender.allCases)
        let textField = GenderTextField(genderPicker: picker)
        textField.inputView = picker
        return textField
    }()
    
    private lazy var currentDateTxtField: DateTextField = {
        let picker = DatePicker()
        let textField = DateTextField(datePicker: picker, dateFormat: "MM/dd/yyyy")
        textField.placeholder = NSLocalizedString("current.date", comment: "")
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
        observeViewModel()
    }
    
    private func setupUI() {
        view.addSubview(containerView)
        [birthdayTxtField, genderTxtField, currentDateTxtField, randomizeInputBtn, receiveBtn].forEach { containerView.addSubview($0) }
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            birthdayTxtField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            birthdayTxtField.topAnchor.constraint(equalTo: containerView.topAnchor),
            birthdayTxtField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            birthdayTxtField.heightAnchor.constraint(equalToConstant: 35),
            
            genderTxtField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            genderTxtField.topAnchor.constraint(equalTo: birthdayTxtField.bottomAnchor, constant: 20),
            genderTxtField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            genderTxtField.heightAnchor.constraint(equalToConstant: 35),
            
            currentDateTxtField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            currentDateTxtField.topAnchor.constraint(equalTo: genderTxtField.bottomAnchor, constant: 20),
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
        title = NSLocalizedString("input.title", comment: "")
    }
    
    private func observeViewModel() {
        viewModel.birthday.bind { [weak self] birthday in
            guard let self = self,
                let birthday = birthday else { return }
        }
        viewModel.gender.bind { [weak self] gender in
            guard let self = self,
                let gender = gender else { return }
            
        }
        viewModel.gifts.bind { [weak self] gifts in
            guard let self = self,
                let gifts = gifts else { return }
        }
    }
    
    @objc private func randomizeInputBtnPressed(_ button: UIButton) {
        viewModel.randomizeInput()
    }
    
    @objc private func receiveBtnPressed(_ button: UIButton) {
        let user = UserDomainModel(birthday: birthdayTxtField.inputValue, gender: genderTxtField.inputValue ?? .male)
        viewModel.getGifts(user: user, date: currentDateTxtField.inputValue)
    }
}
