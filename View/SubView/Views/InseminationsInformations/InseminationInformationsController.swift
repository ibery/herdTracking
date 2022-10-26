//
//  InseminationInformationsController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 26.10.2022.
//

import Foundation
import UIKit

protocol getCowInseminationInformationProtocol{
    func getCowInseminationInformation() -> CowModel
}

class InseminationInformationsController : UIView ,NibInitializable {
    
    
    // MARK: - Properties
    
    
    @IBOutlet weak var inseminationInformationsTableView: UITableView!
    var nibName: String = "InseminationInformaitonsScreen"
    var delegate : getCowInseminationInformationProtocol?
    private let cowModel = CowModel()
   
    
    
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
        
    }
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    private func setup(){}
}

extension InseminationInformationsController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let delegate = delegate{
            return delegate.getCowInseminationInformation().inseminations.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.inseminationsCell, for: indexPath) as? AddInseminationsTableViewCell else {return UITableViewCell()}
        if let delegate = delegate{
            cell.inseminationsBull.text = delegate.getCowInseminationInformation().inseminations[indexPath.row].inseminationsBullName?.bullName
            cell.inseminationsDate.text = delegate.getCowInseminationInformation().inseminations[indexPath.row].inseminationDate
            cell.inseminationsPerson.text = delegate.getCowInseminationInformation().inseminations[indexPath.row].inseminatedPerson?.inseminatedPersonName
            cell.inseminationsResult.text = delegate.getCowInseminationInformation().inseminations[indexPath.row].inseminationsStatus
        }
       return cell
    }
    
    
}

