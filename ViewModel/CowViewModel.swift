//
//  CowViewModel.swift
//  Herd Tracking
//
//  Created by Narkoz on 11.05.2022.
//

import UIKit
import RealmSwift

class CowViewModel {
    lazy var realm = try! Realm()
    //   var cowsResults : Results<CowModel>?
//    var cows = LocaleService.shared.fetchCows()
    var cow = [CowModel]()
    var status = false
    
//    func updateCowViewModel(cow : CowModel){
//        LocaleService.shared.updateCow(cow: cow, group: <#T##String?#>, magnet: <#T##Bool?#>, numberOfLactations: <#T##Int#>, lastCalvingDate: <#T##String?#>, insurance: <#T##Bool?#>, dryOffDate: <#T##String?#>, motherOfEarTag: <#T##String?#>, reproductiveStatus: <#T##ReproductiveStatus#>, leashNumber: <#T##String?#>, name: <#T##String#>, earTag: <#T##String#>, dateOfBirth: <#T##String#>, cowBreed: <#T##String#>, gender: <#T##String#>)
//
//    }
    
//    func updateCowViewModel (cow : CowModel ){
//        LocaleService.shared.updateCow(cow: cow)
//    }
    
    private func cowTextFieldControl(cowTextField : CowModel){
        
        if cowTextField.earTag == ""{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.earRing)
            Constants.cowStatus = true
        }else{
            if cowTextField.dateOfBirth == ""{
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.birthOfDate)
                Constants.cowStatus = true
            }else{
                if cowTextField.gender == "" {
                    UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.gender)
                    Constants.cowStatus = true
                }else{
           //        addCowViewModel(cowAdd : cowTextField)
                    LocaleService.shared.addCow(cow: cowTextField)
                    UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.successful)
                    
                }
            }
        }
    }
    // BURASI LOCALE SERVİCE DEN ÇEKİLECEK
    
    
    func addCowViewModel(cowAdd : CowModel){
        Constants.cowStatus = false
        for i in fetchCowViewModel(){
            if i.earTag == cowAdd.earTag{
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.messageThereIsCow)
                Constants.cowStatus = true
                break
            }else if i.leashNumber == cowAdd.leashNumber && cowAdd.leashNumber != ""{
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.MessageTehereIsCollar)
                Constants.cowStatus = true
                break
            }
        }
        if !Constants.cowStatus{
            cowTextFieldControl(cowTextField: cowAdd)
        }
    }
    
     func fetchCowViewModel()-> Results<CowModel>{
        return LocaleService.shared.fetchCows()
    }
    
    func tableViewFilter(filter : String)-> [CowModel]{
        switch filter {
        case Constants.Arrays.collectionViewItemArray[0]:
            return allCow()
        case Constants.Arrays.collectionViewItemArray[1]:
            return freshCow()
        case Constants.Arrays.collectionViewItemArray[2]:
            return inseminatedCow()
        case Constants.Arrays.collectionViewItemArray[3]:
            return pregnancyControl()
        case Constants.Arrays.collectionViewItemArray[4]:
            return emptyCow()
        case Constants.Arrays.collectionViewItemArray[5]:
            return pregnant()
        case Constants.Arrays.collectionViewItemArray[6]:
            return advancedPregnant()
        case Constants.Arrays.collectionViewItemArray[7]:
            return dryOffCow()
        case Constants.Arrays.collectionViewItemArray[8]:
            return cow // sigortalı
        case Constants.Arrays.collectionViewItemArray[9]:
            return slaughterCow()
        case Constants.Arrays.collectionViewItemArray[10]:
            return zeroThreeMonths()
        case Constants.Arrays.collectionViewItemArray[11]:
            return threeTwelveMonths()
        case Constants.Arrays.collectionViewItemArray[12]:
            return heiferFilter()
        case Constants.Arrays.collectionViewItemArray[13]:
            return males()
            
        default:
            return cow
        }
        
    }
    
    private func insuranceCow() ->[CowModel]{
        cow.removeAll()
        for i in fetchCowViewModel(){
            if i.insurance == "Evet"{
                cow.append(i)
            }
        }
        return cow
    }
    private func allCow()-> [CowModel]{
        cow.removeAll()
        for i in fetchCowViewModel(){
            cow.append(i)
        }
        return cow
    }
    private func males()->[CowModel]{
        cow.removeAll()
        for c in fetchCowViewModel(){
            if c.gender == "Erkek"{
                cow.append(c)
            }
        }
        return cow
    }
    private func heiferFilter()-> [CowModel]{
        return forFilter(status: ReproductiveStatus.duve)
    }
    private func advancedPregnant () -> [CowModel]{
        return forFilter(status: ReproductiveStatus.Yakın_Gebe)
    }
    private func pregnant() -> [CowModel]{
        return forFilter(status: ReproductiveStatus.Gebe)
    }
    private func calf() -> [CowModel]{
        return forFilter(status: ReproductiveStatus.yasiKucuk)
    }
    private func inseminatedCow()-> [CowModel]{
        return forFilter(status: ReproductiveStatus.Tohumlanmıs)
    }
    private func freshCow() -> [CowModel] {
        return forFilter(status: ReproductiveStatus.Taze)
    }
    private func emptyCow() -> [CowModel]{
        return forFilter(status: ReproductiveStatus.Boş)
    }
    private func dryOffCow() -> [CowModel]{
        return forFilter(status: ReproductiveStatus.Kuruda)
    }
    private func slaughterCow() -> [CowModel]{
        return forFilter(status: ReproductiveStatus.Kesimlik)
    }
    private func pregnancyControl() ->[CowModel]{
        cow.removeAll()
        for c in forFilter(status: ReproductiveStatus.Tohumlanmıs){
            for i in c.inseminations {
                if NumberOfDays.dateDayCount(date: i.inseminationDate, format: "dd.MM.yy") > 39 {
                    cow.append(c)
                }
            }
        }
        return cow
    }
    private func zeroThreeMonths()-> [CowModel]{
        cow.removeAll()
        for c in fetchCowViewModel(){
            if NumberOfDays.dateDayCount(date: c.dateOfBirth, format: "dd.MM.yy") < 91{
                cow.append(c)
            }
        }
        return cow
    }
    private func threeTwelveMonths() -> [CowModel]{
        cow.removeAll()
        for c in fetchCowViewModel(){
            if NumberOfDays.dateDayCount(date: c.dateOfBirth, format: "dd.MM.yy") > 90 && NumberOfDays.dateDayCount(date: c.dateOfBirth, format: "dd.MM.yy") < 360{
                cow.append(c)
            }
        }
        return cow
    }
    private func forFilter (status : ReproductiveStatus) -> [CowModel]{
        cow.removeAll()
        for c in fetchCowViewModel(){
            if c.reproductiveStatus == status{
                cow.append(c)
            }
        }
        return cow
    }
    func updateOtherCowInfo(cow : CowModel , updateCow : CowModel){
        LocaleService.shared.updateOtherCow(cow: cow, newCow: updateCow)
    }
    func generalUpdate(cow :CowModel , addCow : CowModel){
        LocaleService.shared.generalUpdateCow(cow: cow, newCow: addCow)
    }
    func dryOffDate(cow:CowModel, date : String){
        LocaleService.shared.dyrOffUpdate(cow: cow , date : date)
    }
    
 
}
