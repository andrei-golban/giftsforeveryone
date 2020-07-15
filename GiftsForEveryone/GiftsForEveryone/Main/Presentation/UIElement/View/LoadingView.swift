//
//  LoadingView.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/15/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation
import UIKit

final class LoadingView: UIView {
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.color = .black
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicatorView)
        
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func show(on view: UIView) {
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        indicatorView.startAnimating()
    }
    
    func hide() {
        indicatorView.stopAnimating()
        removeFromSuperview()
    }
}
