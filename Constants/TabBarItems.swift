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
    
    var viewController : UINavigationController{
        let viewController : UIViewController
        
        switch self {
        case .home:
            guard let homeViewcontroller = Storyboard.home.viewController else {return UINavigationController()}
            viewController = homeViewcontroller
            
        case .myWorks:
            guard let myWorksViewController = Storyboard.myWorks.viewController else {return UINavigationController()}
            viewController = myWorksViewController
        case .addCow:
            guard let addCowViewController = Storyboard.addCow.viewController else {return UINavigationController()}
            viewController = addCowViewController
        case .notification:
            guard let notificationViewController = Storyboard.notification.viewController else {return UINavigationController()}
            viewController = notificationViewController
        case .feed:
            guard let feedViewController = Storyboard.feed.viewController else {return UINavigationController()}
            viewController = feedViewController
        }
        
        let navigationController = UINavigationController(rootViewController:viewController)
        navigationController.tabBarItem = self.tabBarItem
        
        return navigationController
    }
    
}
