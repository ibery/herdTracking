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
    
    func addBull(bull : BullModel){
        var status = false
        for i in fetchBull(){
            if i.bullName == bull.bullName{
                status = true
                break
            }
        }
        if status{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.bull)
        }else{
            LocaleService.shared.addBull(bull: bull)
        }
        
    }
    
    func fetchBull()-> Results<BullModel>{
        let bullArray = LocaleService.shared.fetchBull() 
        return bullArray
    }
}

