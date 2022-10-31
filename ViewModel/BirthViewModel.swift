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
    
    private var cow = CowModel()
    private var cowViewModel = CowViewModel()
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func giveBirth(cow : CowModel , calfEarTagTextField : UITextField, calfNameTextField : UITextField , calfGenderTextField : UITextField ,formOfCalvingTextFiedl : UITextField , birthDateTextFiedl : UITextField ,twinsSwitch : UISwitch ,secondCalfEarTagTextFiedl : UITextField ,secondCalfNameTextField : UITextField , secondGenderTextField : UITextField ,calfCow : CowModel , calfingDate : UITextField , secondCalfCow : CowModel){
        
        if birthReproductiveStatus(){
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.notPregnancy)
        }else{
            if formOfCalvingTextFiedl.text == FormOfCalving(rawValue: 1)!.name{
                
                birthTextFieldHiddenAndReproductiveNumber(calfEarTagTextField: calfEarTagTextField, calfNameTextField: calfNameTextField, calfGenderTextField: calfGenderTextField,reproductiveNumber: 2)
                lactacionAndLastCalvingDate(birthDateTextFiedl: birthDateTextFiedl)
                
            }else if formOfCalvingTextFiedl.text == FormOfCalving(rawValue: 2)?.name{
                birthTextFieldHiddenAndReproductiveNumber(calfEarTagTextField: calfEarTagTextField, calfNameTextField: calfNameTextField, calfGenderTextField: calfGenderTextField, reproductiveNumber: 4)
            }else if formOfCalvingTextFiedl.text == FormOfCalving(rawValue: 0)?.name || formOfCalvingTextFiedl.text == FormOfCalving(rawValue: 3)?.name{
                
                calfEarTagTextField.isHidden = false
                calfNameTextField.isHidden = false
                calfGenderTextField.isHidden = false
                
                if twinsSwitch.isOn{
                    // textfield ler boş mu kontrol edilecek
                    firstAndSecondCalfBirth(firstCalf: calfCow, calfEarTagTextField: calfEarTagTextField, calfNameTextField: calfNameTextField, calfGenderTextField: calfGenderTextField, calfingDate: birthDateTextFiedl)
                    
                    firstAndSecondCalfBirth(firstCalf: secondCalfCow, calfEarTagTextField: secondCalfNameTextField, calfNameTextField: secondCalfNameTextField, calfGenderTextField: secondGenderTextField, calfingDate: birthDateTextFiedl)
                    
                    UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.successCalfing)
                }else{
                    firstAndSecondCalfBirth(firstCalf: calfCow, calfEarTagTextField: calfEarTagTextField, calfNameTextField: calfNameTextField, calfGenderTextField: calfGenderTextField, calfingDate: birthDateTextFiedl)
                }
                cow.reproductiveStatus = ReproductiveStatus(rawValue: 2)
                for i in cow.inseminations{
                    if i.inseminationsStatus == InseminationStatus(rawValue: 0)?.name{
                        i.inseminationsStatus = InseminationStatus(rawValue: 3)!.name
                    }
                }
                lactacionAndLastCalvingDate(birthDateTextFiedl: birthDateTextFiedl)
                cowViewModel.updateCowViewModel(cow: cow)
            }
            
        }
    }
    
    private func birthReproductiveStatus() -> Bool{
        if cow.reproductiveStatus?.name != "Gebe" || cow.reproductiveStatus?.name != "Kuruda" || cow.reproductiveStatus?.name != "Yakın Gebe"{
            return true
        }else{
            return false
        }
    }
    
    private func birthTextFieldHiddenAndReproductiveNumber(calfEarTagTextField : UITextField , calfNameTextField : UITextField , calfGenderTextField : UITextField , reproductiveNumber : Int){
        calfEarTagTextField.isHidden = true
        calfNameTextField.isHidden = true
        calfGenderTextField.isHidden = true
        cow.reproductiveStatus = ReproductiveStatus(rawValue: reproductiveNumber)
    }
    
    private func lactacionAndLastCalvingDate(birthDateTextFiedl : UITextField){
        if cow.numberOfLactations == nil{
            cow.numberOfLactations = 1
        }else{
            cow.numberOfLactations! += 1
        }
        cow.lastCalvingDate = birthDateTextFiedl.text
    }
    
    private func firstAndSecondCalfBirth(firstCalf : CowModel , calfEarTagTextField :UITextField,calfNameTextField : UITextField , calfGenderTextField : UITextField ,calfingDate: UITextField){
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
        cowViewModel.addCowViewModel(cowAdd: firstCalf)
    }
    
//    private func secondCalfBirth(secondCalfEarTagTextFiedl : UITextField,secondCalfNameTextField : UITextField, secondGenderTextField : UITextField, calfingDate : UITextField , secondCalf : CowModel ){
//        if let secondCalfEarTag = secondCalfEarTagTextFiedl.text{
//            secondCalf.earTag = secondCalfEarTag
//        }else{
//            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.messageThereIsCow)
//        }
//        if let secondCalfname = secondCalfNameTextField.text{
//            secondCalf.cowName = secondCalfname
//        }
//        if let secondGender = secondGenderTextField.text{
//            secondCalf.gender = secondGender
//        }
//
//        if let secondBirthDate = calfingDate.text{
//            secondCalf.dateOfBirth = secondBirthDate
//        }
//        secondCalf.cowBreed = cow.cowBreed
//        secondCalf.motherEarTag = cow.earTag
//        cowViewModel.addCowViewModel(cowAdd: secondCalf)
//    }
    
}



