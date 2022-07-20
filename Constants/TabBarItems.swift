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
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .myWorks:
            return "My Works"
        }
    }
    
    var image : UIImage? {
        switch self {
        case .home:
            return Images.barn.image
        case .myWorks:
            return Images.myWorks.image
        }
    }
    
    var tag : Int{
        return rawValue
    }
    
    var tabBarItem: UITabBarItem {
        return UITabBarItem(title: title, image: image, tag: tag)
    }
    
}
