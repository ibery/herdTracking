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
    var cow  = CowModel()
    
    func fetchCows ()-> Results<CowModel>{
        let cows = realm.objects(CowModel.self)
        return cows
    }
    
//    func updateCow (id : ObjectId , earTag : String , cowName : String , dateOfbirth : String ,cowBreed : String , gender : String){
//        try! realm.write {
//            // Use .modified to only update the provided values.
//            // Note that the "name" property will remain the same
//            // for the person with primary key "id" 123.
//            realm.create(CowModel.self,
//                         value: ["_id": cow._id, "earTag": earTag , "cowName" : cowName ,"dateOfBirth" : dateOfbirth , "cowBreed" : cowBreed , "gender" : gender ],
//                         update: .modified)
//        }
//    }
    
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
    
}
