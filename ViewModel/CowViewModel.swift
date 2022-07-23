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
    var alert = Funcs()
    var cows : Results<CowModel>?
    var status = false

    
    func addCow (cow : CowModel){
        
        if checkIfThereIsCow(earRing: cow.earTag){
            alert.alerts(title: C.title, message: C.messageThereIsCow)
        }else{
            if checkIfThereIsColler(leashNumber: cow.leashNumber){
                alert.alerts(title: C.title, message: C.MessageTehereIsCollar)
            }else{
                do{
                    try realm.write{
                        realm.add(cow)
                    }
                }catch{
                    print("Error saving cow\(error.localizedDescription)")
                    alert.alerts(title: C.title, message: C.filedToRegister)
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
