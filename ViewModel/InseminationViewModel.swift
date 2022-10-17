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
    var cow = CowModel()
    var person = PersonModel()
    var bull = BullModel()
    var inseminationsResults : Results<InseminationModel>?
    
    
    // MARK: - Initializers
    
    // MARK: - Setup
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    func addInsemination(cow : CowModel , newInsemination : InseminationModel){
        LocaleService.shared.addInseminations(cow: cow, newInsemination: inseminationsModel)
    }
    
    func updateInsemination(){
        
    }
    
    func fetchInsemination()-> Results<InseminationModel>{
        return  LocaleService.shared.fetchInseminations()
    }
    
}

