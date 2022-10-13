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
        }
        
    }
    
    var storyboard: UIStoryboard{
        return UIStoryboard(name: "\(self.name)Screen", bundle: nil)
    }
    
    var viewController : UIViewController? {
        return self.storyboard.instantiateInitialViewController()
    }
}
