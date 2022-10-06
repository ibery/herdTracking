//
//  TabBarItems.swift
//  Herd Tracking
//
//  Created by Narkoz on 9.05.2022.
//

import UIKit

enum TabBarItems: Int {
    case home
    case myWorks
    case addCow
    case notification
    case feed
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .myWorks:
            return "My Works"
        case .addCow:
            return "Add Cow"
        case .notification:
            return "Notifications"
        case .feed:
            return "Feed"
        }
    }
    
    var image : UIImage? {
        switch self {
        case .home:
            return Images.barn.image
        case .myWorks:
            return Images.myWorks.image
        case .addCow:
            return Images.cowAdd.image
        case .notification:
            return Images.notification.image
        case .feed:
            return Images.feed.image
        }
    }
    
    var tag : Int{
        return rawValue
    }
    
    var tabBarItem: UITabBarItem {
        return UITabBarItem(title: title, image: image, tag: tag)
    }
    
}
