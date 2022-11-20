//
//  FormOfCalving.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 29.10.2022.
//

import Foundation

enum FormOfCalving : Int , CaseIterable{
    case lives
    case dead
    case abortion
    case earlyBirth
    
    var name : String {
        
        switch self{
        case .lives:
            return "Yaşıyor"
        case.dead :
            return "Ölü Doğum"
        case.abortion:
            return "Abort"
        case .earlyBirth:
            return "Erken Doğum"
        }
    }
    
    var formOfCalving : String {
        return name
    }
    
}


