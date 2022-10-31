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
        birthInfoListTableView.dataSource = self
        birthInfoListTableView.delegate = self
        addBirthView.delegate = self
       
    }
    
    // MARK: - Actions
    
    @IBAction func birthSave(_ sender: Any) {
        addBirthView.isHidden = false
    }
    
    // MARK: - Methods
    
    private func setup(){}
}


extension BirthInfoListController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let delegate = delegate else {return 0}
        return delegate.getCow().birthList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.birthListTableViewcell, for: indexPath) as? BirthListTableViewCell else {return UITableViewCell()}
        
        if let delegate = delegate{
            cell.birthDateLabel.text = delegate.getCow().birthList[indexPath.row].birthDate
            cell.firstCalfEarTagLabel.text = delegate.getCow().birthList[indexPath.row].calfOneEarTag
            cell.secondCalfEarTagLabel.text = delegate.getCow().birthList[indexPath.row].calfTwoEarTag
            cell.firstCalfGenderLabel.text = delegate.getCow().birthList[indexPath.row].oneCalfGender
            cell.secondCalfGenderLabel.text = delegate.getCow().birthList[indexPath.row].twoCalfGender  
        }
        
        return cell
    }
    
    
}

extension BirthInfoListController : BirthProtocol{
    func fetchCow() -> CowModel {
        guard let delegate = delegate?.getCow() else {return CowModel()}
        return delegate
    }
    
    func closeBirthInfoView() {
        addBirthView.isHidden = true
    }
    
    
    
    
}
