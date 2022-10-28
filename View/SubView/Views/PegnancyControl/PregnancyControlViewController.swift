//
//  PregnancyControlViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 27.10.2022.
//

import Foundation
import UIKit

protocol getCowPregnancyControlProtocol{
    func getCowPregnancyControl() -> CowModel
}

class PregnancyControlViewController : UIView ,NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var inspectionDateTextField: UITextField!
    @IBOutlet weak var inspectionResultTextField: UITextField!
    @IBOutlet weak var pregnancyTableView: UITableView!
    
    
    var nibName: String = "PregnancyControlScreen"
    var delegate : getCowPregnancyControlProtocol?
    
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
        
    }
    
    // MARK: - Actions
    
    @IBAction func pregnancySave(_ sender: Any) {
    }
    
    // MARK: - Methods
    
    private func setup(){}
}

extension PregnancyControlViewController : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
