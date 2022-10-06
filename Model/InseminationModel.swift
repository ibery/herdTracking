//
//  InseminationModel.swift
//  Herd Tracking
//
//  Created by Narkoz on 12.05.2022.
//

import UIKit
import RealmSwift

class InseminationModel : Object {
    
    @objc dynamic var cowTag : String = ""
    @objc dynamic var inseminatedPerson : String = ""
    @objc dynamic var bullName : String = ""
    @objc dynamic var inseminationDate : String = ""
    var parentCow = LinkingObjects(fromType: CowModel.self, property: "inseminations")
        
}
