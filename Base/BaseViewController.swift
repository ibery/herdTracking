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

        
        let addBullButton = UIAction(title: "Sperma Ekle (Boğa)", image: UIImage(named: Images.erkekler.imageName)) { (action) in
            
            guard let viewController = Storyboard.bull.viewController else {return}
            self.navigationController?.show(viewController, sender: nil)
            print("Users action was tapped")
        }
        
        let addInseminationPersonButton = UIAction(title: "Tohumlayıcı Ekle", image: UIImage(systemName: "person.fill.badge.plus")) { (action) in
        
            guard let viewController = Storyboard.person.viewController else {return }
            self.navigationController?.show(viewController, sender: nil)
        }
        
        let removeCowButton = UIAction(title: "Sürüden Çıkan Hayvanlar", image: UIImage(systemName: "person.fill.xmark.rtl")) { (action) in
            print("Remove User action was tapped")
        }
        
        let createFilter = UIAction(title : "Filitre Yap" , image: UIImage(systemName: "magnifyingglass")) { (action) in
            print(" Filitre yap basıldı ")
        }
        
        
        let menu = UIMenu(title: "Ayarlar", options: .displayInline, children: [addBullButton , addInseminationPersonButton , removeCowButton,createFilter])
        
        
        //        let plusAction = UIAction(title: "plusAction"){ (action) in
        //            print("Plus Action action was tapped ")
        //        }
        
        let navItems = [UIBarButtonItem(image:  UIImage(systemName: "plus"),  menu: menu) ]
        
        
        
        self.navigationItem.leftBarButtonItems = navItems
        
    }
    
    
    
    //    @objc func sideMenuButtonTapped(){
    //
    //    }
    
    
}


