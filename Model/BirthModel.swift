//
//  BirthModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 28.10.2022.
//

import RealmSwift

class BirthModel : Object {
    
    @Persisted var birthDate : Date?
    @Persisted var calfOneEarTag : String?
    @Persisted var calfTwoEarTag : String?
   
}
