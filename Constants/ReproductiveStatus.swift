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
    
}
