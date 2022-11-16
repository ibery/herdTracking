//
//  BirthModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 28.10.2022.
//

import RealmSwift

class BirthModel : Object {
    
    @Persisted var birthDate : String?
    @Persisted var calfOneEarTag : String?
    @Persisted var calfTwoEarTag : String?
    @Persisted var oneCalfGender : String?
    @Persisted var twoCalfGender : String?
   
}


