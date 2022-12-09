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
    
    
    func addCow(cow : CowModel){
            try! realm.write{
                realm.add(cow)
            }
    }
    
    func fetchCows ()-> Results<CowModel>{
        let cows = realm.objects(CowModel.self)
        return cows
    }
    
    func updateOtherCow(cow : CowModel , newCow : CowModel){
        try! realm.write{
            cow.magnet = newCow.magnet
            cow.insurance = newCow.insurance
            cow.numberOfLactations = newCow.numberOfLactations
            cow.lastCalvingDate = newCow.lastCalvingDate
            cow.motherEarTag = newCow.motherEarTag
            cow.fatherName = newCow.fatherName
        }
    }
    
    func generalUpdateCow(cow : CowModel , newCow : CowModel){
        try! realm.write{
            cow.earTag = newCow.earTag
            cow.cowName = newCow.cowName
            cow.dateOfBirth = newCow.dateOfBirth
            cow.cowBreed = newCow.cowBreed
            cow.gender = newCow.gender
            cow.groupNo = newCow.groupNo
        }
    }
    func birthUpdateCow(cow : CowModel){
        
        try! realm.write {
            cow.reproductiveStatus = Constants.birthCow.reproductiveStatus
            cow.lastCalvingDate = Constants.birthCow.lastCalvingDate
            cow.numberOfLactations = Constants.birthCow.numberOfLactations
            cow.secondPregnancyControl = false
            cow.dryOffDate = nil
            
            if Constants.formOfCalving == FormOfCalving(rawValue: 2)?.name{
                guard let status = InseminationStatus(rawValue: 4)?.name else {return}
                cow.inseminations[Constants.inseminationCount].inseminationsStatus = status
            }else{
                guard let status = InseminationStatus(rawValue: 3)?.name else {return}
                cow.inseminations[Constants.inseminationCount].inseminationsStatus = status
            }
            
        }


    }
    func dyrOffUpdate(cow:CowModel, date : String){
        try! realm.write{
            cow.reproductiveStatus = ReproductiveStatus(rawValue: 5)
            cow.dryOffDate = date
        }
    }
    
    
    
    func addInseminations(cow: CowModel , newInsemination : InseminationModel){
        try! realm.write{
            var status = false
            var sayac = 0
            if cow.inseminations.count == 0 {
                cow.reproductiveStatus = ReproductiveStatus(rawValue: 3)
                cow.inseminations.append(newInsemination)
            }else{
                for i in cow.inseminations{
                    if i.inseminationsStatus == "Beklemede"{
                        status = true
                        break
                    }
                    sayac += 1
                }
                if status{
                    guard let iStatus = InseminationStatus(rawValue: 1)?.name else {return}
                    cow.inseminations[sayac].inseminationsStatus = iStatus
                    cow.reproductiveStatus = ReproductiveStatus(rawValue: 3)
                    cow.inseminations.append(newInsemination)
                }else{
                    cow.reproductiveStatus = ReproductiveStatus(rawValue: 3)
                    cow.inseminations.append(newInsemination)
                }
                
            }

        }

        
    }

    
 
    
    func fetchInseminations()-> Results<InseminationModel>{
        let inseminations = realm.objects(InseminationModel.self)
        return inseminations
    }
    
    func updateInseminations(cow : CowModel, insemination : InseminationModel , row : Int){
        try! realm.write{
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
        if cow.reproductiveStatus?.name == "Gebe"{
            try! realm.write{
                cow.secondPregnancyControl = true
            }
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
        }
    }
    
    func addNote(cow: CowModel, newNote: NoteModel){
        try! realm.write{
            cow.noteList.append(newNote)
        }
    }
    
    func addNotification(notification : NotificationModel){
            try! realm.write{
                realm.add(notification)
            }
    }
    
    func fetchNotification()-> Results<NotificationModel>{
        let notification = realm.objects(NotificationModel.self)
        return notification
    }
    
    func addFeed(feed : FeedModel){
            try! realm.write{
                realm.add(feed)
            }
    }
    
    func fetchFeed()-> Results<FeedModel>{
        let feed = realm.objects(FeedModel.self)
        return feed
    }
    
}


