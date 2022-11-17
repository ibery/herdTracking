//
//  GetCowProtocol.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 27.10.2022.
//

import Foundation
import UIKit

protocol GetCowAndViewProtocol {
    func getCow() -> CowModel
    func toPage(cow: CowModel,row :Int)
}

protocol CloseInseminationViewProtocol{
    func addInseminationsDelegate() -> CowModel
    func closeInseminationView()
}

protocol CowCardEditingProtocol{
    func cowCardEditinCow ()-> CowModel
    func closeCowCardEditingView()
}

protocol BirthProtocol{
    func fetchCow()->CowModel
    func closeBirthInfoView()
}

protocol VaccineProtocol{
    func vaccineCow() -> CowModel
    func toHome()
}




