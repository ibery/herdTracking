//
//  CowViewModel.swift
//  Herd Tracking
//
//  Created by Narkoz on 11.05.2022.
//

import UIKit
import RealmSwift

struct CowViewModel {
    let realm = try! Realm()
    var cows = Results<CowModel>?.self

    
    func addCow (cow : CowModel){
        do{
            try realm.write{
                realm.add(cow)
            }
        }catch{
            print("Error saving cow\(error.localizedDescription)")
            // alert message eklenecek
        }
    }
    
    mutating func checkIfThereIsCow ( earRing : String) -> Bool {
        
        let cow = realm.objects(CowModel.self)
        
        
        return true
    }
}
