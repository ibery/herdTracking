//
//  LocaleService.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 7.10.2022.
//


import RealmSwift


class LocaleService {
    
    static let shared = LocaleService()
    
    lazy var realm = try! Realm()
    var cowsResults : Results<CowModel>?
    
    func fetchCows ()-> Results<CowModel>{
        let cows = realm.objects(CowModel.self)
        return cows
    }
    
}
