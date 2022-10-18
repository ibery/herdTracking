//
//  TabBarController.swift
//  Herd Tracking
//
//  Created by Narkoz on 9.05.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController  = TabBarItems.home.viewController 
   //     homeViewController.tabBarItem = TabBarItems.home.tabBarItem
        
         let myWorksViewController = TabBarItems.myWorks.viewController
   //     myWorksViewController.tabBarItem = TabBarItems.myWorks.tabBarItem
        
        let addCowViewController = TabBarItems.addCow.viewController
     //   addCowViewController.tabBarItem = TabBarItems.addCow.tabBarItem
        
        let notificationViewController = TabBarItems.notification.viewController
    //    notificationViewController.tabBarItem = TabBarItems.notification.tabBarItem
        
         let feedViewController = TabBarItems.feed.viewController 
    //    feedViewController.tabBarItem = TabBarItems.feed.tabBarItem
        
        self.setViewControllers([homeViewController , myWorksViewController , addCowViewController , notificationViewController , feedViewController], animated: false)
    }
    
    // MARK: - Setup
    
    
    //MARK: - Actions
    
    
    //MARK: - Methods
}
