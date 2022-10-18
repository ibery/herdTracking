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
    
    func addSideMenuButton(){
//        let sideMenuButton = UIBarButtonItem(image: Images.sideMenu.image, style: .plain, target: self , action: #selector(sideMenuButtonTapped))
//
//        self.navigationItem.leftBarButtonItem = sideMenuButton
        
        let usersItem = UIAction(title: "Sperma Ekle", image: UIImage(systemName: "person.fill")) { (action) in

                print("Users action was tapped")
           }

           let addUserItem = UIAction(title: "Tohumlayıcı Ekle", image: UIImage(systemName: "person.badge.plus")) { (action) in

               print("Add User action was tapped")
           }

           let removeUserItem = UIAction(title: "Sürüden Çıkan Hayvanlar", image: UIImage(systemName: "person.fill.xmark.rtl")) { (action) in
                print("Remove User action was tapped")
           }

           let menu = UIMenu(title: "Ayarlar", options: .displayInline, children: [usersItem , addUserItem , removeUserItem])

        
        let plusAction = UIAction(title: "plusAction"){ (action) in
            print("Plus Action action was tapped ")
        }
        
        let navItems = [UIBarButtonItem(image:  UIImage(systemName: "plus"),  menu: menu) ]

     

        self.navigationItem.leftBarButtonItems = navItems
        
    }
    
//    @objc func sideMenuButtonTapped(){
//        
//    }
    

}


