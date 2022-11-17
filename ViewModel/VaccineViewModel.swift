//
//  VaccineViewModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 17.11.2022.
//

import Foundation
import UIKit

class VaccineViewModel {
    
    // MARK: - Properties
    
    
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func addVaccineViewModel(cow : CowModel, vaccineModel : VaccineModel){
            LocaleService.shared.addVaccine(cow: cow, newVaccine: vaccineModel)
        UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.successful)
        
    }
}

