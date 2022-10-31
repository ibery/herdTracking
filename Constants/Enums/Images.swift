//
//  Images.swift
//  Herd Tracking
//
//  Created by Narkoz on 9.05.2022.
//

import UIKit

enum Images: Int{
    case cow
    case barn
    case myWorks
    case cowAdd
    case notification
    case feed
    case sideMenu
    case sperms
    case erkekler
    
    var imageName: String {
        switch self {
        case .cow:
            return "cow"
        case .barn:
            return "barn"
        case .myWorks:
            return "myWorks"
        case .cowAdd:
            return "plus"
        case .notification:
            return "notification"
        case .feed:
            return "feed"
        case.sideMenu:
            return "sideMenu"
        case.sperms:
            return "Sperms"
        case.erkekler:
            return "erkekler"
        
        }
    }
    var image: UIImage? {
        return UIImage(named: self.imageName)
    }
}

