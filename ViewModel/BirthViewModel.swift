//
//  BirthViewModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 31.10.2022.
//


import Foundation
import UIKit


class BirthViewModel {
    
    // MARK: - Properties
    
    //    private var cow = CowModel()
    private var cowViewModel = CowViewModel()
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func giveBirth(cow : CowModel , calfEarTagTextField : UITextField, calfNameTextField : UITextField , calfGenderTextField : UITextField ,formOfCalvingTextFiedl : UITextField , birthDateTextFiedl : UITextField ,twinsSwitch : UISwitch ,secondCalfEarTagTextFiedl : UITextField ,secondCalfNameTextField : UITextField , secondGenderTextField : UITextField ,calfCow : CowModel , calfingDate : UITextField , secondCalfCow : CowModel ,newBirth : BirthModel){
        if birthReproductiveStatus(cow: cow){ // başında ünlem olacak
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.notPregnancy)
        }else{
            guard let formCalvingType = FormOfCalving(rawValue: 1)?.name else {return}
            if formOfCalvingTextFiedl.text == formCalvingType{
                if birthDateTextFiedl.text == ""{
                    UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.calfingBirthDate)
                }else{
                    Constants.birthCow.reproductiveStatus = ReproductiveStatus(rawValue: 2)
                    Constants.birthCow.numberOfLactations = lactacionAndLastCalvingDate(cow: cow)
                    
                    inseminationNumber(cow: cow)
                    if cow.inseminations.count > 1 {
                        for i in cow.inseminations{
                            Constants.inseminationCount += 1
                            if i.inseminationsStatus == InseminationStatus(rawValue: 0)?.name{
                                
                                break
                            }
                        }
                        
                    }else{
                        
                        Constants.inseminationCount = 0
                    }
                    Constants.birthCow.lastCalvingDate = birthDateTextFiedl.text
                    LocaleService.shared.birthUpdateCow(cow: cow)
                }
            }else if formOfCalvingTextFiedl.text == FormOfCalving(rawValue: 2)?.name{
                if birthDateTextFiedl.text == ""{
                    UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.calfingBirthDate)
                }else{
                    Constants.birthCow.reproductiveStatus = ReproductiveStatus(rawValue: 4)
                    LocaleService.shared.birthUpdateCow(cow: cow)
                    guard let formCalving = FormOfCalving(rawValue: 2)?.name else {return}
                    Constants.formOfCalving = formCalving
                    if cow.inseminations.count > 1 {
                        for i in cow.inseminations{
                            Constants.inseminationCount += 1
                            if i.inseminationsStatus == InseminationStatus(rawValue: 0)?.name{
                                
                                break
                            }
                        }
                    }else{
                        Constants.inseminationCount = 0
                    }
                    
                }
            }else if formOfCalvingTextFiedl.text == FormOfCalving(rawValue: 0)?.name || formOfCalvingTextFiedl.text == FormOfCalving(rawValue: 3)?.name{
                
                if twinsSwitch.isOn{
                    if birthDateTextFiedl.text == "" || calfEarTagTextField.text == "" || secondCalfEarTagTextFiedl.text == "" {
                        UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.earTagAndDate)
                    }else{
                        firstAndSecondCalfBirth(firstCalf: calfCow, calfEarTagTextField: calfEarTagTextField, calfNameTextField: calfNameTextField, calfGenderTextField: calfGenderTextField, calfingDate: birthDateTextFiedl, cow : cow)
                        
                        firstAndSecondCalfBirth(firstCalf: secondCalfCow, calfEarTagTextField: secondCalfNameTextField, calfNameTextField: secondCalfNameTextField, calfGenderTextField: secondGenderTextField, calfingDate: birthDateTextFiedl, cow :cow)
                        UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.successCalfing)
                        newBirth.birthDate = birthDateTextFiedl.text
                        newBirth.calfOneEarTag = calfEarTagTextField.text
                        newBirth.oneCalfGender = calfGenderTextField.text
                        newBirth.calfTwoEarTag = secondCalfEarTagTextFiedl.text
                        newBirth.twoCalfGender = secondGenderTextField.text
                    }
                }else{
                    if birthDateTextFiedl.text == "" || calfEarTagTextField.text == ""{
                        UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.earTagAndDate)
                    }else{
                        firstAndSecondCalfBirth(firstCalf: calfCow, calfEarTagTextField: calfEarTagTextField, calfNameTextField: calfNameTextField, calfGenderTextField: calfGenderTextField, calfingDate: birthDateTextFiedl , cow :cow)
                        newBirth.birthDate = birthDateTextFiedl.text
                        newBirth.calfOneEarTag = calfEarTagTextField.text
                        newBirth.oneCalfGender = calfGenderTextField.text
                    }
                }
                Constants.birthCow.reproductiveStatus = ReproductiveStatus(rawValue: 2)
                Constants.birthCow.lastCalvingDate = birthDateTextFiedl.text
                
                if cow.inseminations.count > 1 {
                    for i in cow.inseminations{
                        Constants.inseminationCount += 1
                        if i.inseminationsStatus == InseminationStatus(rawValue: 0)?.name{
                            i.inseminationsStatus = InseminationStatus(rawValue: 3)!.name
                            break
                        }
                    }
                }else{
                    Constants.inseminationCount = 0
                }
                Constants.birthCow.numberOfLactations = lactacionAndLastCalvingDate(cow: cow)
                LocaleService.shared.birthUpdateCow(cow: cow)
                LocaleService.shared.addBirth(cow: cow, newBirth: newBirth)
            }
            
        }
        
    }
    
    private func birthReproductiveStatus(cow : CowModel) -> Bool{
        if cow.reproductiveStatus?.name != "Gebe" || cow.reproductiveStatus?.name != "Kuruda" || cow.reproductiveStatus?.name != "Yakın Gebe"{
            return false
        }else{
            return true
        }
    }
    
    private func birthTextFieldHiddenAndReproductiveNumber(calfEarTagTextField : UITextField , calfNameTextField : UITextField , calfGenderTextField : UITextField , reproductiveNumber : Int){
        calfEarTagTextField.isHidden = true
        calfNameTextField.isHidden = true
        calfGenderTextField.isHidden = true
        
    }
    
    private func lactacionAndLastCalvingDate(cow : CowModel )-> Int{
        var count = 0
        if cow.numberOfLactations == nil{
            count = 1
            return count
        }else{
            guard let number = cow.numberOfLactations else {return 0}
            count = number + 1
            return count
        }
        
    }
    
    private func firstAndSecondCalfBirth(firstCalf : CowModel , calfEarTagTextField :UITextField,calfNameTextField : UITextField , calfGenderTextField : UITextField ,calfingDate: UITextField , cow :CowModel){
        if let calfEarTag = calfEarTagTextField.text{
            firstCalf.earTag = calfEarTag
        }else{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.messageThereIsCow)
        }
        
        if let calfName = calfNameTextField.text{
            firstCalf.cowName = calfName
        }
        if let gender = calfGenderTextField.text {
            firstCalf.gender = gender
        }
        if let birthDate = calfingDate.text{
            firstCalf.dateOfBirth = birthDate
        }
        firstCalf.cowBreed = cow.cowBreed
        firstCalf.motherEarTag = cow.earTag
        firstCalf.leashNumber = ""
        cowViewModel.addCowViewModel(cowAdd: firstCalf)
         
    }
    
    private func inseminationNumber(cow : CowModel){
        if cow.inseminations.count > 1 {
            for i in cow.inseminations{
                Constants.inseminationCount += 1
                if i.inseminationsStatus == InseminationStatus(rawValue: 0)?.name{
                    i.inseminationsStatus = InseminationStatus(rawValue: 3)!.name
                    break
                }
            }
        }else{
            Constants.inseminationCount = 0
        }
        guard let formCalving = FormOfCalving(rawValue: 0)?.name else {return}
        Constants.formOfCalving = formCalving
    }
    
}



