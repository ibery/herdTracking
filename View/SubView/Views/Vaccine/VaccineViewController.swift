//
//  VaccineViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 27.10.2022.
//

import Foundation
import UIKit

protocol getCowVaccineProtocol{
    func getCowVaccine() -> CowModel
}

class VaccineViewController : UIView ,NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var vaccineDateTextField: UITextField!
    @IBOutlet weak var vaccineNameTextField: UITextField!
    
    @IBOutlet weak var vaccineTableView: UITableView!
    
    
    var nibName: String = "VaccineScreen"
    var delegate : getCowVaccineProtocol?
    
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
        vaccineTableView.delegate = self
        vaccineTableView.dataSource = self
        
    }
    
    // MARK: - Actions
    @IBAction func vaccineSave(_ sender: Any) {
    }
    
    
    // MARK: - Methods
    
    private func setup(){}
}

extension VaccineViewController : UITableViewDataSource ,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
}
