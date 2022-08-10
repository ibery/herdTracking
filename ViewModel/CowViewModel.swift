//
//  CowViewModel.swift
//  Herd Tracking
//
//  Created by Narkoz on 11.05.2022.
//

import UIKit
import RealmSwift

class CowViewModel {
    let realm = try! Realm()
    var cows : Results<CowModel>?
    var status = false
    
    
    func addCowControl (cow : CowModel){
        
        if checkIfThereIsCow(earRing: cow.earTag){
            UIWindow.showAlert(title: Constants.title, message: Constants.messageThereIsCow)
        }else{
            if let checkIfTehereIsLeashNumber = cow.leashNumber {
                if checkIfThereIsColler(leashNumber: checkIfTehereIsLeashNumber){
                    UIWindow.showAlert(title: Constants.title, message: Constants.MessageTehereIsCollar)
                }else{
                    cowTextFieldControl(cow: cow)
                    
                }
            }else{
                cowTextFieldControl(cow: cow)
            }
            
        }
    }
    
    func addCow(cow : CowModel){
        do{
            try realm.write{
                realm.add(cow)
            }
        }catch{
            print("Error saving cow\(error.localizedDescription)")
            UIWindow.showAlert(title: Constants.title, message: Constants.filedToRegister)
        }
    }
    
    func cowTextFieldControl(cow : CowModel){
        
        if cow.earTag == nil{
            UIWindow.showAlert(title: Constants.title, message: Constants.earRing)
        }else{
            if cow.dateOfBirth == nil{
                UIWindow.showAlert(title: Constants.title, message: Constants.birthOfDate)
            }else{
                if cow.gender == nil {
                    UIWindow.showAlert(title: Constants.title, message: Constants.gender)
                }else{
                    addCow(cow: cow)
                }
            }
        }
        
    }
    
    func checkIfThereIsCow ( earRing : String) -> Bool {
        
        let cow = realm.objects(CowModel.self)
        status = false
        
        for c in cow {
            if c.earTag == earRing {
                status = true
                break
            }
        }
        return status
    }
    
    func checkIfThereIsColler ( leashNumber : Int) -> Bool {
        let cow = realm.objects(CowModel.self)
        status = false
        
        if leashNumber != nil{
            for c in cow{
                if c.leashNumber == leashNumber {
                    status = true
                    break
                }
            }
        }
        return status
    }
}
