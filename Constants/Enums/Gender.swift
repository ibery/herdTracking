//
//  Gender.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 29.10.2022.
//

import Foundation

enum Gender : Int , CaseIterable{
    case female
    case male
    
    var name : String {
        switch self {
        case.female:
            return "Dişi"
        case.male:
            return "Erkek"
        }
    }
    
    var gender : String {
        return name
    }
    
}
