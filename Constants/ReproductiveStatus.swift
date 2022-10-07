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
    case Taze
    case Tohumlanmış
    case Boş
    case Gebelik_Kontrolü
    case Abort
    case Kuruda
    case Kesimlik
    
    var name : String {
        switch self{
        case .yasiKucuk:
            return "Yaşı Küçük"
        case .Taze:
            return "Taze"
        case .Tohumlanmış:
            return "Tohumlanmış"
        case .Boş:
            return "Boş"
        case .Gebelik_Kontrolü:
            return "Gebelik Kontrolü"
        case .Abort:
            return "Abort"
        case .Kuruda:
            return "Kuruda"
        case.Kesimlik:
            return "Kesimlik"
        }
        
    }
    
    
    var reproductiveStatus: String{
        return name
    }
}
