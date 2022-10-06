//
//  BaseViewController.swift
//  Herd Tracking
//
//  Created by Narkoz on 8.05.2022.
//

import UIKit

class BaseViewController : UIViewController  {
    
    
    // MARK: - Properties
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.viewDidLayoutSubviews()
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    func getViewController<T>(fromStoryboard storyboard: Storyboard, type t: T.Type) -> T? {
        guard let viewController = storyboard.storyboard.instantiateInitialViewController() as? T  else { return nil }
        
        return viewController
    }
    
}
