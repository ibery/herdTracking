//
//  InseminationStatus.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 16.10.2022.
//

import Foundation
import RealmSwift

enum InseminationStatus: Int , PersistableEnum {
    case success
    case fail
    case contineu
    case completed
    case abort

    var name : String {
        switch self{
        case .success:
            return "Başarılı"
        case.fail :
            return "Başarısız"
        case.contineu:
            return "Beklemede"
        case.completed:
            return "Doğurdu"
        case.abort:
            return "Yavru Atma"
        }
        
    }
    
    
    var inseminationsStatus: String{
        return name
    }
}

