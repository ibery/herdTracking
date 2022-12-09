//
//  PregnancyControlViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 27.10.2022.
//

import Foundation
import UIKit



class PregnancyControlViewController : UIView ,NibInitializable {
    
    // MARK: - Properties
   
    @IBOutlet weak var pregnancyTableView: UITableView!
    
    
    var nibName: String = "PregnancyControlScreen"
    var delegate : GetCowAndViewProtocol?
    
    // MARK: - Initializers
    
    required init?(coder : NSCoder){
        super.init(coder: coder)
        self.initiliaze(withNibName: self.nibName,self.postInitialize)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initiliaze(withNibName: self.nibName, self.postInitialize)
        
    }
    
    private func postInitialize(_ view: UIView) {}
    
    
    // MARK: - Setup
    
    override func layoutSubviews() {
        pregnancyTableView.delegate = self
        pregnancyTableView.dataSource = self
        self.pregnancyTableView.register(UINib(nibName: Constants.TableView.pregnancyController, bundle: nil), forCellReuseIdentifier: Constants.TableView.pregnancyCell)
    }
    

    
    // MARK: - Actions
    

    
    // MARK: - Methods
    
 
    
    private func setup(){}
}

extension PregnancyControlViewController : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let delegate = delegate else{return 0}
        return delegate.getCow().pregnancyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.pregnancyCell, for: indexPath) as? PregnancyTableViewCell else {return UITableViewCell()}
        guard let delegate = delegate else {return UITableViewCell()}
        cell.inspectionDateLabel.text = delegate.getCow().pregnancyList[indexPath.row].inspectionDate
        cell.inspectionResultLabel.text = delegate.getCow().pregnancyList[indexPath.row].inspectionResult
    
        return cell
        
    }
    
    
}


