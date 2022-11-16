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
    
//    static func pregnancyShowAlert( row : Int,cow : CowModel){
//        var pregnancyDate = UITextField()
//        var pregnancyResult = UITextField()
//        let alert = UIAlertController(title: "Gebelik Muaynesi", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Ekle", style: .default) {(action) in
//
//            if pregnancyDate.text != ""{
//                let pregnancyModel = PregnancyModel()
//
//                cow.inseminations[row].pregnancyList?.inspectionResult = pregnancyResult.text
//                pregnancyModel.inspectionResult = pregnancyResult.text
//                pregnancyModel.inspectionDate = pregnancyDate.text
//
//                LocaleService.shared.addPregnancy(cow: cow, newPregnancy: pregnancyModel)
// //               pregnancyTableView.reloadData()
//
//            }else{
//                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.pregnancyDate)
//            }
//
//        }
//        alert.addAction(action)
//        alert.addTextField {
//            (fieldName) in
//            pregnancyDate = fieldName
//            pregnancyDate.placeholder = "Muayne Tarihi Seçiniz"
//        }
//        alert.addTextField{
//            (fieldBreed) in
//            pregnancyResult = fieldBreed
//            pregnancyResult.placeholder = "Muayne sonucunu giriniz"
//        }
//        present(alert , animated: true ,completion: nil)
//
//    }
    
}

extension UIViewController{
//    static func pregnancyShowAlert( row : Int,cow : CowModel){
//        var pregnancyDate = UITextField()
//        var pregnancyResult = UITextField()
//        let alert = UIAlertController(title: "Gebelik Muaynesi", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Ekle", style: .default) {(action) in
//
//            if pregnancyDate.text != ""{
//                let pregnancyModel = PregnancyModel()
//
//                cow.inseminations[row].pregnancyList?.inspectionResult = pregnancyResult.text
//                pregnancyModel.inspectionResult = pregnancyResult.text
//                pregnancyModel.inspectionDate = pregnancyDate.text
//
//                LocaleService.shared.addPregnancy(cow: cow, newPregnancy: pregnancyModel)
// //               pregnancyTableView.reloadData()
//
//            }else{
//                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.pregnancyDate)
//            }
//
//        }
//        alert.addAction(action)
//        alert.addTextField {
//            (fieldName) in
//            pregnancyDate = fieldName
//            pregnancyDate.placeholder = "Muayne Tarihi Seçiniz"
//        }
//        alert.addTextField{
//            (fieldBreed) in
//            pregnancyResult = fieldBreed
//            pregnancyResult.placeholder = "Muayne sonucunu giriniz"
//        }
//        self.present(alert , animated: true ,completion: nil)
//
//    }
    

}


