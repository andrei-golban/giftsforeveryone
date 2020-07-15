//
//  ResultViewController.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/12/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import UIKit

final class ResultViewController: UIViewController {
    
    weak var coordinator: InputCoordinator?
    
    private let viewModel: ResultViewModel
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var birthdayLbl: Label = {
        let label = Label()
        return label
    }()
    
    private lazy var genderLbl: Label = {
        let label = Label()
        return label
    }()
    
    private lazy var currentDateLbl: Label = {
        let label = Label()
        return label
    }()
    
    private lazy var giftLbl: Label = {
        let label = Label()
        return label
    }()
    
    init(viewModel: ResultViewModel) {
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
        viewModel.viewDidLoad()
    }
    
    private func setupUI() {
        view.addSubview(containerView)
        [birthdayLbl, genderLbl, currentDateLbl, giftLbl].forEach { containerView.addSubview($0) }
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            birthdayLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            birthdayLbl.topAnchor.constraint(equalTo: containerView.topAnchor),
            birthdayLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            genderLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            genderLbl.topAnchor.constraint(equalTo: birthdayLbl.bottomAnchor),
            genderLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            currentDateLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            currentDateLbl.topAnchor.constraint(equalTo: genderLbl.bottomAnchor),
            currentDateLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            giftLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            giftLbl.topAnchor.constraint(equalTo: currentDateLbl.bottomAnchor),
            giftLbl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        title = Localizable.ResultScreen.resultTitle.localized
    }
    
    private func observeViewModel() {
        viewModel.birthday.observe { [weak self] birthday in
            guard let self = self else { return }
            
            self.birthdayLbl.text = birthday
        }
        viewModel.gender.observe { [weak self] gender in
            guard let self = self else { return }
            
            self.genderLbl.text = gender
        }
        viewModel.currentDay.observe { [weak self] currentDay in
            guard let self = self else { return }
            
            self.currentDateLbl.text = currentDay
        }
        viewModel.gifts.observe { [weak self] gifts in
            guard let self = self else { return }
            
            self.giftLbl.text = gifts
        }
    }
}
