//
//  ShowPersonViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 19.10.2022.
//

import UIKit

class ShowPersonViewController : BaseViewController {
    
    
    // MARK: - Properties
    @IBOutlet weak var searchPersonTextField: UITextField!
    @IBOutlet weak var showPersonTableView: UITableView!
    
    
    private var addPersonButton = UIBarButtonItem()
    private var personViewModel = PersonViewModel()
    private var inseminationViewModel = InseminationViewModel()
    private var status = false
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showPersonTableView.delegate = self
        showPersonTableView.dataSource = self
        self.showPersonTableView.register(UINib(nibName: Constants.TableView.showPersonTableView, bundle: nil), forCellReuseIdentifier: Constants.TableView.showPersonTableViewCell)
        setupPersonButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    // MARK: - Setup
    
    private func setupPersonButton(){
        addPersonButton = UIBarButtonItem(image: UIImage(systemName: "plus"),  style: .plain, target: self, action: #selector(addPersonButtonTapped))
        navigationItem.rightBarButtonItems = [addPersonButton]
    }
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    @objc func addPersonButtonTapped(){
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Yeni Personel Ekle", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ekle", style: .default) { (action) in
            
            if textField.text != ""{
//                for i in self.personViewModel.fetchPersonViewModel(){
//                    if i.inseminatedPersonName == textField.text{
//                        self.status = true
//                        break
//                    }
//                }
 //               if self.status{
   //                 UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.inseminationsPerson)
                    
  //              }else{
                        
                        let personModel = PersonModel()
                        personModel.inseminatedPersonName = textField.text!
                        self.personViewModel.addPerson(person: personModel)
                        self.showPersonTableView.reloadData()
//                    }
            }else{
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.personTextField)
            }
            
        }
        
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Yeni Tohumlayıcı Ekle"
        }
        
        present(alert, animated: true, completion: nil)
        
        
        
        
    }
}

extension ShowPersonViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //     return personViewModel.fetchPerson().count != 0 ? personViewModel.fetchPerson().count : 0
        print("fetch person : \(personViewModel.fetchPersonViewModel().count)")
        return personViewModel.fetchPersonViewModel().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.showPersonTableViewCell, for: indexPath) as? ShowPersonTableViewCell else {return UITableViewCell()}
        
        cell.inseminationNameLabel.text = personViewModel.fetchPersonViewModel()[indexPath.row].inseminatedPersonName
        
        var successCount = 0
        var failCount : Int  = 0
        
//        for i in inseminationViewModel.fetchInsemination(){
//
//            if i.inseminationsStatus == "Başarılı" && i.inseminatedPerson == personViewModel.fetchPersonViewModel()[indexPath.row].inseminatedPersonName {
//                successCount += 1
//            }
//            if i.inseminationsStatus == "Başarısız" && i.inseminatedPerson == personViewModel.fetchPersonViewModel()[indexPath.row].inseminatedPersonName{
//                failCount += 1
//            }
//        }
        for i in inseminationViewModel.fetchInsemination(){
            if i.inseminatedPerson == personViewModel.fetchPersonViewModel()[indexPath.row] && i.inseminationsStatus == "Başarılı"{
                successCount += 1
            }else if i.inseminatedPerson == personViewModel.fetchPersonViewModel()[indexPath.row] && i.inseminationsStatus == "Başarısız" {

            failCount += 1
        }
    }
        cell.failCountLabel.text = String(failCount)
        cell.successCountLabel.text = String(successCount)
        cell.failCountLabel.text = String(failCount)
        if (failCount + successCount) != 0 {
            cell.successPercentageLabel.text = String(format: "%.2f", (successCount * 100 / (successCount + failCount)))
        }else{
            cell.successPercentageLabel.text = "0"
           
        }
        
        return cell
    }
    
    
}
