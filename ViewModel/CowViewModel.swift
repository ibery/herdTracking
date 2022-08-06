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

    
    func addCow (cow : CowModel){
        
        if checkIfThereIsCow(earRing: cow.earTag){
            UIWindow.showAlert(title: Constants.title, message: Constants.messageThereIsCow)
        }else{
            if checkIfThereIsColler(leashNumber: cow.leashNumber){
                UIWindow.showAlert(title: Constants.title, message: Constants.MessageTehereIsCollar)
            }else{
                do{
                    try realm.write{
                        realm.add(cow)
                    }
                }catch{
                    print("Error saving cow\(error.localizedDescription)")
                    UIWindow.showAlert(title: Constants.title, message: Constants.filedToRegister)
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
   
        for c in cow{
            if c.leashNumber == leashNumber {
                status = true
                break
            } 
        }
        return status
    }
}
