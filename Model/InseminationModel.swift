//
//  InseminationModel.swift
//  Herd Tracking
//
//  Created by Narkoz on 12.05.2022.
//

import UIKit
import RealmSwift

class InseminationModel : Object {
    
    @Persisted var inseminationEarTag : String = ""
    @Persisted var inseminatedPerson : PersonModel?
    @Persisted var inseminationsBullName : BullModel?
    @Persisted var inseminationDate : String = ""
    @Persisted var inseminationsStatus : String = ""
  //  var parentCow = LinkingObjects(fromType: CowModel.self , property: "inseminations")
  
    
}
