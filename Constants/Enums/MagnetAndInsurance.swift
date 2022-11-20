//
//  MagnetAndInsurance.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 19.11.2022.
//

import Foundation

enum MagnetAndInsurance : Int , CaseIterable{
    
    case yes
    case no
    
    var name : String{
        switch self {
        case.yes:
            return "Evet"
        case.no:
            return "Hayır"
        }
    }
    
    var status : String{
        return name
    }
    
}


