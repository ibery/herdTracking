//
//  Storyboards.swift
//  Herd Tracking
//
//  Created by Narkoz on 9.05.2022.
//

import Foundation
import UIKit

enum Storyboard : Int {
    case home
    case myWorks
    case splash
    case addCow
    case notification
    case feed
    case menu
    case card
    case inseminations
    case person
    case bull
    case pregnancyInspection
    
    
    var name : String {
        switch self{
        case .home:
            return "Home"
        case .myWorks:
            return "MyWorks"
        case .splash:
            return "Splash"
        case .addCow:
            return "AddCow"
        case .notification:
            return "Notification"
        case .feed:
            return "Feed"
        case .menu:
            return "MenuTableView"
        case.card:
            return "CowCard"
        case.inseminations:
            return "AddInseminations"
        case.person:
            return "ShowPerson"
        case.bull:
            return "ShowBull"
        case.pregnancyInspection:
            return "PregnancyInspection"
        }
        
    }
    
    var storyboard: UIStoryboard{
        return UIStoryboard(name: "\(self.name)Screen", bundle: nil)
    }
    
    var viewController : UIViewController? {
        return self.storyboard.instantiateInitialViewController()
    }
}
