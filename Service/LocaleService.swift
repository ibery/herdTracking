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
    var inseminationsResults : Results<InseminationModel>?
    var cow  = CowModel()
    var inseminations = InseminationModel()
    func fetchCows ()-> Results<CowModel>{
        let cows = realm.objects(CowModel.self)
        return cows
    }
    
    func updateCow(cow : CowModel , name : String , earTag : String , dateOfBirth : String ,cowBreed : String , gender : String){
        do{
            try realm.write{
                cow.cowName = name
                cow.earTag = earTag
                cow.dateOfBirth = dateOfBirth
                cow.cowBreed = cowBreed
                cow.gender = gender
            }
        }catch{
            print(error)
        }
    }
    
    func fetchInseminations()-> Results<InseminationModel>{
        let inseminations = realm.objects(InseminationModel.self)
        return inseminations
    }
    
    func addInseminations(cow: CowModel , newInsemination : InseminationModel){
      
            try! realm.write{
                cow.inseminations.append(newInsemination)
            }
        
    }
    
    func updateInseminations(cow : CowModel, inseminatedPerson : String , bullName : String , inseminationDate : String ){
        
    }
    
}
