//
//  InseminationViewModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 17.10.2022.
//

import Foundation
import RealmSwift

class InseminationViewModel {
    
    // MARK: - Properties
    var inseminationsModel = InseminationModel()
 //   var cow = CowModel()
    var cowViewModel = CowViewModel()
    var person = PersonModel()
    var bull = BullModel()
    var inseminationsResults : Results<InseminationModel>?
    
    
    
    // MARK: - Initializers
    
    // MARK: - Setup
    
    // MARK: - Actions
    
    
    // MARK: - Methods

    
    func updateInsemination(cow : CowModel, insemination : InseminationModel , row : Int){
        LocaleService.shared.updateInseminations(cow: cow, insemination: inseminationsModel, row: row)
    }
    
    func fetchInsemination()-> Results<InseminationModel>{
        return  LocaleService.shared.fetchInseminations()
    }

    
    func addInseminationViewModel(cow : CowModel , newInsemination : InseminationModel , inseminationDateTextField : UITextField){
        inseminationTextFieldEmpty(cow: cow, inseminationDateText: inseminationDateTextField , newInsemination : newInsemination)
    }

    private func inseminationTextFieldEmpty(cow : CowModel  , inseminationDateText : UITextField ,newInsemination : InseminationModel ){
        if inseminationDateText.text == ""{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.inseminationDate)
        }else{
            lessThanAYearOld(cow: cow, newInsemination: newInsemination)
        }
    }

    private func lessThanAYearOld(cow : CowModel , newInsemination : InseminationModel){
        if NumberOfDays.dateDayCount(date: cow.dateOfBirth) < 365 {
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.lessthanAge)
        }else{
            postpartumDay(cow: cow , newInsemination : newInsemination)
        }
    }

    private func postpartumDay(cow : CowModel, newInsemination : InseminationModel){
        if let postpartumDate = cow.lastCalvingDate{
            if cow.lastCalvingDate != ""{
                if NumberOfDays.dateDayCount(date: postpartumDate) < 20 {
                    UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.postpartumOfDay)
                }else{
                    itIsPragnent(cow: cow, newInsemination : newInsemination)
                }
            }
        }else{
            itIsPragnent(cow: cow, newInsemination : newInsemination)
        }

    }

    private func itIsPragnent(cow : CowModel, newInsemination : InseminationModel){
        if cow.reproductiveStatus?.name == "Gebe" || cow.reproductiveStatus?.name == "Yakın Gebe" || cow.reproductiveStatus?.name == "Kuruda"{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.pragnent)
        }else{
            addInseminationAndCowUpdate(cow: cow , newInsemination : newInsemination)
        }
    }

//    private func doHaveInsemination(cow : CowModel , newInsemination : InseminationModel){
//        if cow.inseminations.count == 0{
//            addInseminationAndCowUpdate(cow: cow, newInsemination : newInsemination)
//        }else{
//            var status = false
//            var count = 0
//            for i in cow.inseminations{
//                if i.inseminationsStatus == "Beklemede" {
//                    status = true
//                    break
//                }
//                count += 1
//            }
//            if status{
//                Constants.inseminationCount = count
//                addInseminationAndCowUpdate(cow: cow , newInsemination : newInsemination)
//            }else{
//                Constants.inseminationCount = count
//                addInseminationAndCowUpdate(cow: cow , newInsemination : newInsemination)
//            }
//
//        }
//    }

    private func addInseminationAndCowUpdate(cow : CowModel, newInsemination : InseminationModel){
        LocaleService.shared.addInseminations(cow: cow, newInsemination: newInsemination)
        UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.successful)

  
    }
}

