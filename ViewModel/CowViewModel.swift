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
    var cows = LocaleService.shared.fetchCows()
    var cow = [CowModel]()
    var status = false
    
    
    func checkIfThereIsCow (cowCheck : CowModel)  {
        status = false
        
        for c in cows {
            if c.earTag == cowCheck.earTag {
                status = true
                break
            }
        }
        
        if status{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.messageThereIsCow)
        }else{
            checkIfThereIsColler(cowColler: cowCheck)
        }
    }
    
    
    private func checkIfThereIsColler ( cowColler : CowModel)  {
        status = false
        
        if cowColler.leashNumber != "" {
            for c in cows{
                if c.leashNumber == cowColler.leashNumber {
                    status = true
                    break
                }
            }
        }
        if status{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.MessageTehereIsCollar)
        }else{
            cowTextFieldControl(cowTextField : cowColler)
        }
    }
    
    private func cowTextFieldControl(cowTextField : CowModel){
        
        if cowTextField.earTag == ""{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.earRing)
        }else{
            if cowTextField.dateOfBirth == ""{
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.birthOfDate)
            }else{
                if cowTextField.gender == "" {
                    UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.gender)
                }else{
                    addCow(cowAdd : cowTextField)
                }
            }
        }
    }
    
    private func addCow(cowAdd : CowModel){
        do{
            try realm.write{
                realm.add(cowAdd)
                
                UIWindow.showAlert(title: Constants.Alert.successTitle, message: Constants.Alert.successful)
            }
        }catch{
            print("Error saving cow\(error.localizedDescription)")
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.filedToRegister)
        }
    }
    
    func tableViewFilter(filter : String)-> [CowModel]{
        switch filter {
        case Constants.Arrays.collectionViewItemArray[0]:
            return cow
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
    
    func males()->[CowModel]{
        cow.removeAll()
        for c in cows{
            if c.gender == "Erkek"{
                cow.append(c)
            }
        }
        return cow
    }
    
    func heiferFilter()-> [CowModel]{
        return forFilter(status: ReproductiveStatus.duve)
    }
    
    func advancedPregnant () -> [CowModel]{
        return forFilter(status: ReproductiveStatus.Yakın_Gebe)
    }
    
    func pregnant() -> [CowModel]{
        return forFilter(status: ReproductiveStatus.Gebe)
    }
    
    func calf() -> [CowModel]{
        return forFilter(status: ReproductiveStatus.yasiKucuk)
    }
    
    func inseminatedCow()-> [CowModel]{
        return forFilter(status: ReproductiveStatus.Tohumlanmıs)
    }
    
    func freshCow() -> [CowModel] {
        return forFilter(status: ReproductiveStatus.Taze)
    }
    
    func emptyCow() -> [CowModel]{
        return forFilter(status: ReproductiveStatus.Boş)
    }
    
    func dryOffCow() -> [CowModel]{
        return forFilter(status: ReproductiveStatus.Kuruda)
    }
    
    func slaughterCow() -> [CowModel]{
        return forFilter(status: ReproductiveStatus.Kesimlik)
    }
    
    func pregnancyControl() ->[CowModel]{
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
    
    func zeroThreeMonths()-> [CowModel]{
        cow.removeAll()
        for c in cows{
            if NumberOfDays.dateDayCount(date: c.dateOfBirth, format: "dd.MM.yy") < 91{
                cow.append(c)
            }
        }
        return cow
    }
    
    func threeTwelveMonths() -> [CowModel]{
        cow.removeAll()
        for c in cows{
            if NumberOfDays.dateDayCount(date: c.dateOfBirth, format: "dd.MM.yy") > 90 && NumberOfDays.dateDayCount(date: c.dateOfBirth, format: "dd.MM.yy") < 360{
                cow.append(c)
            }
        }
        return cow
    }
    
    
    func forFilter (status : ReproductiveStatus) -> [CowModel]{
        cow.removeAll()
        for c in cows{
            if c.reproductiveStatus == status{
                cow.append(c)
               
            }
        }
        return cow
    }
    
    
    

    
}
