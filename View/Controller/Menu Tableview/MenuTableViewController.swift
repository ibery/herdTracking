//
//  MenuTableViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 5.10.2022.
//

import UIKit

class MenuTableViewController : BaseViewController {
    
    
    // MARK: - Properties
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var menuTableView: UITableView!
    
    var cowViewModel = CowViewModel()
    
    // Burası cowViewModel den çekilecek
  //  var cows = LocaleService.shared.fetchCows()
  
    var filter : String = ""
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        self.menuTableView.register(UINib(nibName: Constants.TableView.menuTableView, bundle: nil), forCellReuseIdentifier: Constants.TableView.menuCell)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        menuTableView.reloadData()
    }
    
    
    
    // MARK: - Setup
    
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

extension MenuTableViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cowViewModel.fetchCowViewModel().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.menuCell , for: indexPath) as? MenuTableViewCell else {return UITableViewCell()}
     //   cell.ImageCell.image = UIImage(named: cows[indexPath.row])
        cell.cowNameLabel.text = cowViewModel.fetchCowViewModel()[indexPath.row].cowName
        cell.earTagLabel.text = cowViewModel.fetchCowViewModel()[indexPath.row].earTag
        cell.reproductiveStatusLabel.text = cowViewModel.fetchCowViewModel()[indexPath.row].reproductiveStatus?.name
        cell.dayCountLabel.text = ""
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let viewController = self.getViewController(fromStoryboard: .card, type: CowCardViewController.self) else {return}
        viewController.cow = cowViewModel.fetchCowViewModel()[indexPath.row]
        self.navigationController?.show(viewController, sender: nil)
       
//        guard let viewController = self.getViewController(fromStoryboard: .card, type: CowCardViewController.self) else {return}
//        self.navigationController?.show(viewController, sender: nil)
    }
    
    
    
    
}
