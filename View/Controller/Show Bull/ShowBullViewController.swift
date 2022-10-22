//
//  ShowBullViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 19.10.2022.
//

import UIKit

class ShowBullViewController : BaseViewController {
    
    
    // MARK: - Properties
    @IBOutlet weak var searchBullTextField: UITextField!
    @IBOutlet weak var showBullTableView: UITableView!
    
     private var addBullButton = UIBarButtonItem()
     var bullViewModel = BullViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showBullTableView.delegate = self
        showBullTableView.dataSource = self
        setupBullButton()
        self.showBullTableView.register(UINib(nibName: Constants.TableView.showBullTableView, bundle: nil), forCellReuseIdentifier: Constants.TableView.showBullTableViewCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    // MARK: - Setup
    
    private func setupBullButton(){
        addBullButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain , target: self , action: #selector(addBullButtonTapped))
        navigationItem.rightBarButtonItems = [addBullButton]
    }
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    @objc func addBullButtonTapped(){
        var bullNameTextField = UITextField()
        var bullBreedTextField = UITextField()
        let alert = UIAlertController(title: "Yeni Boğa Ekle", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ekle", style: .default) {(action) in
            
            if bullNameTextField.text != ""{
                let bullModel = BullModel()
                bullModel.bullName = bullNameTextField.text!
                bullModel.bullBreed = bullBreedTextField.text!
                self.bullViewModel.addBull(bull: bullModel)
                self.showBullTableView.reloadData()
            }else{
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.bullTextField)
            }
            
        }
        alert.addAction(action)
        alert.addTextField {
            (fieldName) in
            bullNameTextField = fieldName
            bullNameTextField.placeholder = "Yeni Boğa Ekle"
        }
        alert.addTextField{
            (fieldBreed) in
            bullBreedTextField = fieldBreed
            bullBreedTextField.placeholder = "Boğa Irkı Seçiniz"
        }
        present(alert , animated: true ,completion: nil)
    }
}

extension ShowBullViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bullViewModel.fetchBull().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.showBullTableViewCell, for: indexPath) as? ShowBullTableViewCell else {return UITableViewCell()}
        cell.bullName.text = bullViewModel.fetchBull()[indexPath.row].bullName
        cell.bullBreed.text  = bullViewModel.fetchBull()[indexPath.row].bullBreed
        return cell
    }
    
    
}
