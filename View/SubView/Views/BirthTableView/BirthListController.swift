//
//  BirthListController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 28.10.2022.
//

import Foundation
import UIKit

class BirthListController : UIView ,NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var birthTableView: UITableView!
    @IBOutlet weak var birthInformationView: BirthInformationController!
    var nibName: String = "BirthListScreen"
    var delegate : GetCowAndViewProtocol?
    
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
        birthTableView.delegate = self
        birthTableView.dataSource = self

    }
    
    // MARK: - Actions
    @IBAction func addBirth(_ sender: Any) {
        birthInformationView.isHidden = false
    }
    
    
    
    // MARK: - Methods
    
    private func setup(){}
    
}

extension BirthListController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let count = delegate?.getCow().birthList.count else {return 0}
//        return count
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
