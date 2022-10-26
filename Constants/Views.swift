//
//  Views.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 26.10.2022.
//

import Foundation

enum Views : Int , CaseIterable {
    case general
    case inseminations
    case birth
    case pregnancyControl
    case vaccine
    case note
    case other
    
    
    var name : String{
        switch self{
        case .general:
            return "Genel Bilgiler"
        case .inseminations:
            return "Tohumlama Bilgileri"
        case .birth:
            return "Doğum Bilgileri"
        case.pregnancyControl:
            return "Gebelik Kontrolü"
        case .vaccine:
            return "Aşı Bilgileri"
        case .note:
            return "Not Bilgileri"
        case .other:
            return "Diğer Bilgiler"
        }
    }
    
    var views : String{
        return name
    }
}







