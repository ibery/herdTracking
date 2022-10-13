//
//  CowViewModel.swift
//  Herd Tracking
//
//  Created by Narkoz on 11.05.2022.
//

import UIKit
import RealmSwift

class CowViewModel {
    lazy var realm = try! Realm()
 //   var cowsResults : Results<CowModel>?
    var cows = LocaleService.shared.fetchCows()
    
    var status = false
    
    
    func checkIfThereIsCow (cowCheck : CowModel)  {
        status = false
        
        for c in cows {
            if c.earTag == cowCheck.earTag {
                status = true
                break
            }
        }
        
        if status{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.messageThereIsCow)
        }else{
            checkIfThereIsColler(cowColler: cowCheck)
        }
    }
    
    
    private func checkIfThereIsColler ( cowColler : CowModel)  {
        status = false
        
        if cowColler.leashNumber != "" {
            for c in cows{
                if c.leashNumber == cowColler.leashNumber {
                    status = true
                    break
                }
            }
        }
        if status{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.MessageTehereIsCollar)
        }else{
            cowTextFieldControl(cowTextField : cowColler)
        }
    }
    
    private func cowTextFieldControl(cowTextField : CowModel){
        
        if cowTextField.earTag == ""{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.earRing)
        }else{
            if cowTextField.dateOfBirth == ""{
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.birthOfDate)
            }else{
                if cowTextField.gender == "" {
                    UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.gender)
                }else{
                    addCow(cowAdd : cowTextField)
                }
            }
        }
    }
    
    private func addCow(cowAdd : CowModel){
        do{
            try realm.write{
                realm.add(cowAdd)
            }
        }catch{
            print("Error saving cow\(error.localizedDescription)")
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.filedToRegister)
        }
    }
    
    func tableViewFilter(){
        
    }
    
}
