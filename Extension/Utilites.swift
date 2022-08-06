//
//  Utilites.swift
//  Herd Tracking
//
//  Created by Narkoz on 6.08.2022.
//

import Foundation
import UIKit

extension UIWindow {
    static func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okButton)

        
        if let presentedController = UIApplication.shared.windows.first?.rootViewController?.presentedViewController {
            presentedController.present(alert, animated: true, completion: nil)
        } else {
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}


