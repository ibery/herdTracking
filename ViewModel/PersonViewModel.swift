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
    
    func addPerson(){
        // daha önce kayıt edip edilmediği kontrol edilecek sonra kayıt edilecek
        LocaleService.shared.addInseminationsPerson(person: person)
    }
    
    func fetchPerson()-> Results<PersonModel>{
        return LocaleService.shared.fetchPerson()
    }

}

