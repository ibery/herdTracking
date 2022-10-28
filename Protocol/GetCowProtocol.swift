//
//  GetCowProtocol.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 27.10.2022.
//

import Foundation

protocol GetCowAndViewProtocol {
    func getCow() -> CowModel
}

protocol CloseInseminationViewProtocol{
    func addInseminationsDelegate() -> CowModel
    func closeInseminationView()
}

protocol CowCardEditingProtocol{
    func cowCardEditinCow ()-> CowModel
    func closeCowCardEditingView()
}
