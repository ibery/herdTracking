//
//  CowModel.swift
//  Herd Tracking
//
//  Created by Narkoz on 10.05.2022.
//

import Foundation
import RealmSwift

class CowModel : Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var earTag : String = ""
    @Persisted var dateOfBirth : String = ""
    @Persisted var leashNumber : String?
    @Persisted var gender : String
    @Persisted var cowName : String?
    @Persisted var groupNo : String?
    @Persisted var cowBreed : String?
    @Persisted var magnet : Bool?
    @Persisted var numberOfLactations : Int?
    @Persisted var lastCalvingDate : Date?
    @Persisted var insurance : Bool?
    @Persisted var dryOffDate : Date?
    @Persisted var reproductiveStatus: ReproductiveStatus?
    @Persisted var inseminations = List<InseminationModel>()
    
   
}

