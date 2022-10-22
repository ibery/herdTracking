//
//  AddInseminationsViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 15.10.2022.
//

import UIKit

class AddInseminationsViewController : BaseViewController {
    
    
    // MARK: - Properties
    
    @IBOutlet weak var inseminationsTableView: UITableView!
    private var addButton = UIBarButtonItem()
    @IBOutlet weak var inseminationsAddView: InseminationsAddController!
 //   var inseminationViewModel = InseminationViewModel()
    
    
    var cow = CowModel()
//    lazy var inseminations = inseminationViewModel.fetchInsemination()
 //   var inseminationsAddController = InseminationsAddController()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Constants.tableView = inseminationsTableView
        inseminationsTableView.delegate = self
        inseminationsTableView.dataSource = self
        inseminationsAddView.delegate = self
        inseminationsAddView.isHidden = true
        self.inseminationsTableView.register(UINib(nibName: Constants.TableView.inseminationsTableView, bundle: nil), forCellReuseIdentifier: Constants.TableView.inseminationsCell)
        setupButton()
        print(cow.cowName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    
    
    // MARK: - Setup
    func setupButton(){

        addButton = UIBarButtonItem(image: UIImage(systemName: "plus"),  style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItems = [addButton]
    }
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    @objc func addButtonTapped(){
        inseminationsAddView.isHidden = false
    }
    
}

extension AddInseminationsViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("bir")
        print("\(cow.inseminations.count)")
     //   return cow.inseminations.count != 0  ? cow.inseminations.count : 1
        return cow.inseminations.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.inseminationsCell , for : indexPath) as? AddInseminationsTableViewCell else {return UITableViewCell()}
        
        cell.inseminationsDate.text = cow.inseminations[indexPath.row].inseminationDate
        cell.inseminationsBull.text = "\(cow.inseminations[indexPath.row].inseminationsBullName?.bullName)"
        cell.inseminationsPerson.text = "\(cow.inseminations[indexPath.row].inseminatedPerson?.inseminatedPersonName)"
        cell.inseminationsResult.text = cow.inseminations[indexPath.row].inseminationsStatus
   //     cell.cellView.layer.borderWidth = 2
        return cell
    }
      
}

extension AddInseminationsViewController : CloseInseminationViewProtocol{
    func addInseminationsDelegate() -> CowModel {
        
        return self.cow
    }
    
    func closeInseminationView() {
        inseminationsAddView.isHidden = true
    }
    
    
    
    
}
