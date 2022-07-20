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
    
    
    var name : String {
        switch self{
        case .home:
            return "Home"
        case .myWorks:
            return "MyWorks"
        case .splash:
            return "Splash"
        }
        
    }
    
    var storyboard: UIStoryboard{
        return UIStoryboard(name: "\(self.name)Screen", bundle: nil)
    }
    
    var viewController : UIViewController? {
        return self.storyboard.instantiateInitialViewController()
    }
}
