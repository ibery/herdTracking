//
//  FeedModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 8.12.2022.
//

import UIKit
import RealmSwift

class FeedModel : Object {
    
    @Persisted var feedName : String = ""
    @Persisted var amountReceived : Double = 0.0
    @Persisted var dailyUse : Double = 0.0
    @Persisted var feedDate : String = ""
   
  
}
