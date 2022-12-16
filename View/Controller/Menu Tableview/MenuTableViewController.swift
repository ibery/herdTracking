//
//  MenuTableViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 5.10.2022.
//

import UIKit
import ChameleonFramework


class MenuTableViewController : BaseViewController {
    
    
    // MARK: - Properties
    
    @IBOutlet weak var cowSearch: UISearchBar!
    
    @IBOutlet weak var menuTableView: UITableView!
   
    
    var cowViewModel = CowViewModel()
    var searchCowArray = [CowModel]()
    var searchCowStringArray = [String]()
    var earTagArray = [String]()
    var searching = false
    // Burası cowViewModel den çekilecek
  //  var cows = LocaleService.shared.fetchCows()
  
    var filter : String = ""
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        self.menuTableView.register(UINib(nibName: Constants.TableView.menuTableView, bundle: nil), forCellReuseIdentifier: Constants.TableView.menuCell)
//        containerView.backgroundColor = FlatGreen()
        cowSearch.delegate = self
        modelToString()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        menuTableView.reloadData()
        tabBarController?.tabBar.isHidden = true
    }
    
    
    
    // MARK: - Setup
    
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    private func modelToString(){
        for i in cowViewModel.tableViewFilter(filter: filter){
            earTagArray.append(i.earTag)
        }
    }
    
    private func stringToModel()->[CowModel]{
        searchCowArray.removeAll()
        for i in searchCowStringArray{
            for a in cowViewModel.tableViewFilter(filter: filter){
                if i == a.earTag{
                    searchCowArray.append(a)
                }
            }
        }
        return searchCowArray
    }
}

extension MenuTableViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cowViewModel.tableViewFilter(filter: filter).count

        return searching == true ? searchCowStringArray.count : cowViewModel.tableViewFilter(filter: filter).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.menuCell , for: indexPath) as? MenuTableViewCell else {return UITableViewCell()}
     //   cell.ImageCell.image = UIImage(named: cows[indexPath.row])
        if searching{
            cell.cowNameLabel.text = stringToModel()[indexPath.row].cowName
            cell.earTagLabel.text = stringToModel()[indexPath.row].earTag
            if stringToModel()[indexPath.row].gender == "Erkek"{
                cell.reproductiveStatusLabel.text = "Erkek"
            }else{
                cell.reproductiveStatusLabel.text = stringToModel()[indexPath.row].reproductiveStatus?.name
            }
        }else{
            cell.cowNameLabel.text = cowViewModel.tableViewFilter(filter: filter)[indexPath.row].cowName
            cell.earTagLabel.text = cowViewModel.tableViewFilter(filter: filter)[indexPath.row].earTag
            if cowViewModel.tableViewFilter(filter: filter)[indexPath.row].gender == "Erkek"{
                cell.reproductiveStatusLabel.text = "Erkek"
            }else{
                cell.reproductiveStatusLabel.text = cowViewModel.tableViewFilter(filter: filter)[indexPath.row].reproductiveStatus?.name
            }
        }

        
        if let colour = FlatGreen().darken(byPercentage: CGFloat(indexPath.row) / CGFloat(cowViewModel.tableViewFilter(filter: filter).count)) {
            cell.backgroundColor = colour
            
            cell.cowNameLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.earTagLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.reproductiveStatusLabel.textColor = ContrastColorOf(colour, returnFlat: true)
     
        }
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        guard let viewController = self.getViewController(fromStoryboard: .card, type: CowCardViewController.self) else {return}
        
        if searching{
            viewController.cow = searchCowArray[indexPath.row]
        }else{
            viewController.cow = cowViewModel.fetchCowViewModel()[indexPath.row]
        }
        
        self.navigationController?.show(viewController, sender: nil)

    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){
            (contextualAction , view , boolValue) in
            // silme işlemi yapılacak
            print("siliniyor ")
        }
        

        return UISwipeActionsConfiguration(actions: [deleteAction ])
    }
    
    
    
}
 
extension MenuTableViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        if searchText == ""{
            searching = false
        }else{
            searching = true
            searchCowStringArray = earTagArray.filter({$0.lowercased().contains(searchText.lowercased())})

        }
        menuTableView.reloadData()
    }
}


//   return pickerView == breedPickerView ? cowBreedArray.count : genderArray.count
