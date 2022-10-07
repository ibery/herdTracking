//
//  LocalService.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 7.10.2022.
//

import RealmSwift


class LocalService  {
    
    static let sharedInstance = LocalService()
    lazy var realm = try! Realm()
    var cows : Results<CowModel>?
    
    func fetchCows (cows : CowModel) -> CowModel {
        let cows = realm.objects(CowModel.self)
        
    }
    
    

    
    
    
}

