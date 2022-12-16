//
//  ReproductiveStatus.swift
//  Herd Tracking
//
//  Created by Narkoz on 10.08.2022.
//

import Foundation
import RealmSwift

enum ReproductiveStatus: Int , PersistableEnum {
    case yasiKucuk
    case duve
    case Taze
    case Tohumlanmıs
    case Boş
    case Kuruda
    case Gebe
    case Yakın_Gebe
    case Kesimlik
    case Boga
    
    var name : String {
        switch self{
        case .yasiKucuk:
            return "Buzağı-Dana"
        case.duve :
            return "Düve"
        case .Taze:
            return "Taze"
        case .Tohumlanmıs:
            return "Tohumlanmış"
        case .Boş:
            return "Boş"
        case .Kuruda:
            return "Kuruda"
        case.Gebe:
            return "Gebe"
        case.Yakın_Gebe:
            return "Yakın Gebe"
        case.Kesimlik:
            return "Kesimlik"
        case.Boga:
            return "Boğa"
            
        }
        
    }
    
    var reproductiveStatus: String{
        return name
    }
}

