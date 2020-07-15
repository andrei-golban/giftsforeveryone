//
//  AlertHelper.swift
//  GiftsForEveryone
//
//  Created by Andrei on 7/15/20.
//  Copyright © 2020 Andrei Golban. All rights reserved.
//

import Foundation
import UIKit

final class AlertHelper {
    
    typealias AlertAction = () -> Void
    
    static func showAlert(viewController: UIViewController,
                          title: String? = nil,
                          message: String? = nil,
                          confirmTitle: String? = nil,
                          cancelTitle: String? = nil,
                          confirmAction: AlertAction? = nil,
                          cancelAction: AlertAction? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let confirmTitle = confirmTitle {
            let confirmAlertAction = UIAlertAction(title: confirmTitle, style: .default) { _ in confirmAction?() }
            alertController.addAction(confirmAlertAction)
        }
        
        if let cancelTitle = cancelTitle {
            let cancelAlertAction = UIAlertAction(title: cancelTitle, style: .cancel) { _ in cancelAction?() }
            alertController.addAction(cancelAlertAction)
        }
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}
