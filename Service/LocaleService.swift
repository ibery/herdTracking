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
//    var cowsResults : Results<CowModel>?
//    var bullResults : Results<BullModel>?
//    var inseminationsResults : Results<InseminationModel>?
//    var cow  = CowModel()
//    var inseminations = InseminationModel()
    
    
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
  
    
    //    func addCow(cow : CowModel){
    //        do{
    //            try realm.write{
    //                realm.add(cow)
    //
    //                UIWindow.showAlert(title: Constants.Alert.successTitle, message: Constants.Alert.successful)
    //
    //            }
    //        }catch{
    //            print("Error saving cow\(error.localizedDescription)")
    //            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.filedToRegister)
    //        }
    //
    //    }
    
    func addCow(cow : CowModel){
            try! realm.write{
                realm.add(cow)
            }
    }
    
    func fetchCows ()-> Results<CowModel>{
        let cows = realm.objects(CowModel.self)
        return cows
    }
    
    func birthUpdateCow(cow : CowModel){
        
        try! realm.write {
            cow.reproductiveStatus = Constants.birthCow.reproductiveStatus
            cow.lastCalvingDate = Constants.birthCow.lastCalvingDate
            cow.numberOfLactations = Constants.birthCow.numberOfLactations
            
            if Constants.formOfCalving == FormOfCalving(rawValue: 2)?.name{
                guard let status = InseminationStatus(rawValue: 4)?.name else {return}
                cow.inseminations[Constants.inseminationCount].inseminationsStatus = status
            }else{
                guard let status = InseminationStatus(rawValue: 3)?.name else {return}
                cow.inseminations[Constants.inseminationCount].inseminationsStatus = status
            }
            
        }


    }
    
    func addInseminations(cow: CowModel , newInsemination : InseminationModel){
        try! realm.write{
            if cow.inseminations.count != 0 {
                cow.inseminations[Constants.inseminationCount].inseminationsStatus = "Başarısız"
            }
            cow.reproductiveStatus = ReproductiveStatus(rawValue: 3)
            cow.inseminations.append(newInsemination)
        }
    }
    
    func fetchInseminations()-> Results<InseminationModel>{
        let inseminations = realm.objects(InseminationModel.self)
        return inseminations
    }
    
    func updateInseminations(cow : CowModel, insemination : InseminationModel , row : Int){
        try! realm.write{
            print("locale \(insemination.inseminationsStatus)")
            cow.inseminations[row].inseminationsStatus = insemination.inseminationsStatus
            
        }
    }
    
    func addInseminationsPerson(person : PersonModel){
        do{
            try realm.write{
                realm.add(person)
            }
        }catch{
            // bu alert değişecek
            print(error)
        }
    }
    
    
    func fetchPerson()-> Results<PersonModel>{
        let person = realm.objects(PersonModel.self)
        return person
    }
    
//    func updatePerson(person : PersonModel , personName : String){
//        do{
//            try realm.write{
//                person.inseminatedPersonName = personName
//            }
//        }catch{
//            print(error)
//        }
//    }
    
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
    
    func addBirth(cow: CowModel , newBirth : BirthModel){
        try! realm.write{
            cow.birthList.append(newBirth)
        }
    }
    
    func addPregnancy(cow: CowModel , newPregnancy : PregnancyModel, row: Int){
        
            try! realm.write{
                cow.pregnancyList.append(newPregnancy)
            }
        if newPregnancy.inspectionResult == "Başarılı"{
            try! realm.write{
                cow.reproductiveStatus = ReproductiveStatus(rawValue: 6)
                guard let status = InseminationStatus(rawValue: 0)?.name else {return}
                cow.inseminations[row].inseminationsStatus = status
            }
        }else if newPregnancy.inspectionResult == "Başarısız"{
            try! realm.write{
                cow.reproductiveStatus = ReproductiveStatus(rawValue: 4)
                guard let status = InseminationStatus(rawValue: 1)?.name else {return}
                cow.inseminations[row].inseminationsStatus = status
            }
        }else if newPregnancy.inspectionResult == "Yavru Atma"{
            try! realm.write{
                cow.reproductiveStatus = ReproductiveStatus(rawValue: 4)
                guard let status = InseminationStatus(rawValue: 4)?.name else {return}
                cow.inseminations[row].inseminationsStatus = status
            }
        }else if newPregnancy.inspectionResult == "Beklemede"{
            try! realm.write{
                cow.reproductiveStatus = ReproductiveStatus(rawValue: 3)
                guard let status = InseminationStatus(rawValue: 2)?.name else {return}
                cow.inseminations[row].inseminationsStatus = status
            }
        }
    }
    
    func addVaccine(cow: CowModel , newVaccine : VaccineModel){
        try! realm.write{
            cow.vaccineList.append(newVaccine)
            print("add vaccine çağırıldı")
        }
    }
    
}


