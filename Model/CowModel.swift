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
    @objc dynamic var earTag : String = ""
    @objc dynamic var dateOfBirth : String = ""
    @objc dynamic var leashNumber : String?
    @objc dynamic var gender : String = ""
    @objc dynamic var cowName : String?
    @objc dynamic var groupNo : String?
    @objc dynamic var cowBreed : String = ""
    @objc dynamic var magnet : Bool = false
    @objc dynamic var numberOfLactations : Int = 0
    @objc dynamic var lastCalvingDate : Date?
    @objc dynamic var insurance : Bool = false
    @objc dynamic var dryOffDate : Date?
    @Persisted var reproductiveStatus: ReproductiveStatus?
    var inseminations = List<InseminationModel>()
    
   
}

