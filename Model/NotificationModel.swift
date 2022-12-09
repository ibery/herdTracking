//
//  NotificationModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 7.12.2022.
//

import UIKit
import RealmSwift

class NotificationModel : Object {
    
    @Persisted var title : String = ""
    @Persisted var subTitle : String = ""
    @Persisted var body : String = ""
    @Persisted var earTag : String = ""
  
}
