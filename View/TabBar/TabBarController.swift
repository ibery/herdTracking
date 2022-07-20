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
        
        guard let homeViewController  = Storyboard.home.viewController else {return}
        homeViewController.tabBarItem = TabBarItems.home.tabBarItem
        
        guard let myWorksViewController = Storyboard.myWorks.viewController else {return}
        myWorksViewController.tabBarItem = TabBarItems.myWorks.tabBarItem
        
        self.setViewControllers([homeViewController , myWorksViewController], animated: false)
    }
    
    // MARK: - Setup
    
    
    //MARK: - Actions
    
    
    //MARK: - Methods
}
