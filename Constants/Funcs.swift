//
//  Funcs.swift
//  Herd Tracking
//
//  Created by Narkoz on 21.07.2022.
//
import UIKit

class Funcs : BaseViewController{
   
    func alerts(title : String , message : String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .default, handler:nil )
              
                alert.addAction(okButton)
             
        self.present(alert, animated: true)
    }
    
}
