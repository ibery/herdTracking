//
//  MyWork.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 22.11.2022.
//

import Foundation


enum MyWork : Int , CaseIterable {
    case inseminated
    case firstPregnancy
    case secondPregnancy
    case dryOff
    case nearBirth
    case weaning
   
    var name : String{
        switch self{
        case .inseminated:
            return "Tohumlanabilirler"
        case.firstPregnancy:
            return "Gebelik Kontrolü"
        case .secondPregnancy:
            return "İkinci Gebelik Kontrolü"
        case .dryOff:
            return "Kuruya Çıkarma"
        case.nearBirth:
            return "Doğumu Yakın"
        case.weaning:
            return "Sütten Kesilecek Buzağılar"
          }
    }
    
    var views : String{
        return name
    }
}
