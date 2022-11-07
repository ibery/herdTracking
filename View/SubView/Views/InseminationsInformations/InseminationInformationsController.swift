//
//  InseminationInformationsController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 26.10.2022.
//

import Foundation
import UIKit

class InseminationInformationsController : UIView ,NibInitializable {
    
    
    // MARK: - Properties
    
    
    @IBOutlet weak var addInseminationView: InseminationsAddController!
    @IBOutlet weak var inseminationInformationsTableView: UITableView!
    var nibName: String = "InseminationInformaitonsScreen"
    var delegate : GetCowAndViewProtocol?
//    var delegateView : showViewProtocol?
    //  private let cowModel = CowModel()
    
    
    
    // MARK: - Initializers
    
    
    required init?(coder: NSCoder ) {
        
        super.init(coder: coder)
        self.initiliaze(withNibName: self.nibName, self.postInitialize)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initiliaze(withNibName: self.nibName, self.postInitialize)
        
    }
    
    private func postInitialize(_ view: UIView) {}
    
    // MARK: - Setup
    
    override func layoutSubviews() {
        inseminationInformationsTableView.delegate = self
        inseminationInformationsTableView.dataSource = self
        addInseminationView.delegate = self
        self.inseminationInformationsTableView.register(UINib(nibName: Constants.TableView.inseminationsTableView, bundle: nil), forCellReuseIdentifier: Constants.TableView.inseminationsCell)
        
    }
    
    
    // MARK: - Actions
    @IBAction func addInsemination(_ sender: UIButton) {
      
        addInseminationView.isHidden = false
    
    }
    
    // MARK: - Methods
    
    private func setup(){}
}

extension InseminationInformationsController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let delegate = delegate{
            return delegate.getCow().inseminations.count
        }else{
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.inseminationsCell, for: indexPath) as? AddInseminationsTableViewCell else {return UITableViewCell()}
        if let delegate = delegate{
            cell.inseminationsBull.text = delegate.getCow().inseminations[indexPath.row].inseminationsBullName?.bullName
            cell.inseminationsDate.text = delegate.getCow().inseminations[indexPath.row].inseminationDate
            cell.inseminationsPerson.text = delegate.getCow().inseminations[indexPath.row].inseminatedPerson?.inseminatedPersonName
            cell.inseminationsResult.text = delegate.getCow().inseminations[indexPath.row].inseminationsStatus
            
        }
        return cell
    }
 
}

extension InseminationInformationsController : CloseInseminationViewProtocol{
    func addInseminationsDelegate() -> CowModel {
        guard let delegate = delegate?.getCow() else {return CowModel()}
        return delegate
    }
    
    func closeInseminationView() {
        addInseminationView.isHidden = true
        inseminationInformationsTableView.reloadData()
    }
    

    
}
