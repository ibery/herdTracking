//
//  PersonViewModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 17.10.2022.
//


import Foundation
import RealmSwift


class PersonViewModel{
    
    // MARK: - Properties
    
    var person = PersonModel()
    
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func addPerson(person : PersonModel){
        // daha önce kayıt edip edilmediği kontrol edilecek sonra kayıt edilecek
        var status = false
        
        for i in fetchPersonViewModel(){
            if i.inseminatedPersonName == person.inseminatedPersonName{
                print("\(i.inseminatedPersonName ) : \(person.inseminatedPersonName)")
                status = true
                break
            }
        }
        if status{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.inseminationsPerson)
        }else{
            LocaleService.shared.addInseminationsPerson(person: person)
        }
    }
    
    func fetchPersonViewModel()-> Results<PersonModel>{
        return LocaleService.shared.fetchPerson()
    }
    
    func updatePerson(){
        
    }

}

