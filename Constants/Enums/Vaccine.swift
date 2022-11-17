//
//  Vaccine.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 17.11.2022.
//

import Foundation
import RealmSwift

enum Vaccine : Int , PersistableEnum {
    case sap
    case brucella
    case sarbon
    case kuduz
    case septisemiAntiSerum
    case clostridial
    case ibrBvd
    case ecoliRotaCorona
    case mastitis
    case leptospiro
    case lsd
    case pastorella
    case sigirVebasi
    case trikofiti
   
    
    var name : String {
        switch self{
        case .sap:
            return "Şap Aşısı"
        case.brucella :
            return "Brucella Aşısı"
        case .sarbon:
            return "Şarbon Aşısı"
        case .kuduz:
            return "Kuduz Aşısı"
        case .septisemiAntiSerum:
            return "Buzağı Septi Serumu"
        case .clostridial:
            return "Clostridial Karma Aşı"
        case.ibrBvd:
            return "IBR BVD Karma Aşı"
        case.ecoliRotaCorona:
            return "Rota Corona Aşısı"
        case.mastitis:
            return "Mastit Aşısı"
        case.leptospiro:
            return "Leptospiro Aşısı"
        case.lsd:
            return "Çiçek Aşısı"
        case.pastorella:
            return "Pastorella Aşısı"
        case.sigirVebasi:
            return "Sığır Vebası Aşısı"
        case.trikofiti:
            return "Mantar Aşısı"
            
        }
        
    }
    
    var reproductiveStatus: String{
        return name
    }
}
