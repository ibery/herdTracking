//
//  LocaleService.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 7.10.2022.
//


import RealmSwift


class LocaleService {
    
    // MARK: - Properties
    
    static let shared = LocaleService()
    
    lazy var realm = try! Realm()
    var cowsResults : Results<CowModel>?
    var bullResults : Results<BullModel>?
    var inseminationsResults : Results<InseminationModel>?
    var cow  = CowModel()
    var inseminations = InseminationModel()
    
    
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    
    func addCow(cow : CowModel){
        do{
            try realm.write{
                realm.add(cow)
                
                UIWindow.showAlert(title: Constants.Alert.successTitle, message: Constants.Alert.successful)
            }
        }catch{
            print("Error saving cow\(error.localizedDescription)")
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.filedToRegister)
        }
        
    }
    
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
    
    func addInseminations(cow: CowModel , newInsemination : InseminationModel){
        try! realm.write{
            cow.inseminations.append(newInsemination)
        }
    }
    
    func fetchInseminations()-> Results<InseminationModel>{
        let inseminations = realm.objects(InseminationModel.self)
        return inseminations
    }
    
    func updateInseminations(cow : CowModel, inseminatedPerson : String , bullName : String , inseminationDate : String ){
        
    }
    
    func addInseminationsPerson(person : PersonModel){
        do{
            try realm.write{
                realm.add(person)
            }
        }catch{
            // bu alert değişecek
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.inseminationsPerson)
        }
    }
    
    
    func fetchPerson()-> Results<PersonModel>{
        let person = realm.objects(PersonModel.self)
        return person
    }
    
    func updatePerson(){
        
    }
    
    func addBull(bull : BullModel){
        do{
            try realm.write{
                realm.add(bull)
            }
        }catch{
            // bu alert değişecek
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.bull)
        }
    }
    
    func fetchBull()-> Results<BullModel>{
        let bulls = realm.objects(BullModel.self)
        return bulls
    }
    
    func updateBull(){
        
    }
    
    
    
}



