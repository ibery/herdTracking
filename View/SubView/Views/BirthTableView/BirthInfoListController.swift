//
//  BirthInfoListController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 29.10.2022.
//

import Foundation
import UIKit

class BirthInfoListController : UIView , NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var birthInfoListTableView: UITableView!
    @IBOutlet weak var addBirthView: BirthInfoController!
    
    var nibName : String = "BirthInfoListScreen"
    
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
        birthInfoListTableView.dataSource = self
        birthInfoListTableView.delegate = self
       
    }
    
    // MARK: - Actions
    
    @IBAction func birthSave(_ sender: Any) {
    }
    
    // MARK: - Methods
    
    private func setup(){}
}


extension BirthInfoListController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
