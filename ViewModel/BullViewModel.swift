//
//  BullViewModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 17.10.2022.
//

import Foundation
import RealmSwift

class BullViewModel {
    
    // MARK: - Properties
    
    var bull = BullModel()
    
    
    
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func addBull(){
        // daha önce eklenip eklenmediği kontrol edilecek sonra kayıt edilecek
        LocaleService.shared.addBull(bull: bull)
    }
    
    func fetchBull()-> Results<BullModel>{
        let bullArray = LocaleService.shared.fetchBull() 
        return bullArray
    }
}

