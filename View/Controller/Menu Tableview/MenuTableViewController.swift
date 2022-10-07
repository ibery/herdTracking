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
    
    var cows = LocaleService.shared.fetchCows()
    var filter : String = ""
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        self.menuTableView.register(UINib(nibName: Constants.TableView.menuTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.menuTableViewCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

extension MenuTableViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell.menuTableViewCell , for: indexPath) as? MenuTableViewCell else {return UITableViewCell()}
     //   cell.ImageCell.image = UIImage(named: cows[indexPath.row])
        cell.cowNameLabel.text = cows[indexPath.row].cowName
        cell.earTagLabel.text = cows[indexPath.row].earTag
        cell.reproductiveStatusLabel.text = cows[indexPath.row].reproductiveStatus?.name
        cell.dayCountLabel.text = ""
        return cell 
    }
    
    
    
    
}
