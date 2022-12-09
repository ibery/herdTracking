//
//  CalfToBeWeaned.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 25.11.2022.
//

import Foundation
import UIKit

class CalfToBeWeaned : UIView , NibInitializable {
    
    // MARK: - Properties
    
    @IBOutlet weak var weanedTableView: UITableView!
    var nibName: String = "CalfToBeWeanedScreen"
    private var cowViewModel = CowViewModel()
    private  var cowArray = [CowModel]()
    
    // MARK: - Initializers
    
    required init?(coder : NSCoder){
        super.init(coder: coder)
        self.initiliaze(withNibName: self.nibName , self.postInitialize)
        setup()
    }
    
    override init (frame: CGRect){
        super.init(frame: frame)
        self.initiliaze(withNibName: self.nibName , self.postInitialize)
    }
    
    private func postInitialize(_ view: UIView){}
    
    override func layoutSubviews() {
        weanedTableView.delegate = self
        weanedTableView.dataSource = self
        self.weanedTableView.register(UINib(nibName: Constants.TableView.calfWeanedController, bundle: nil), forCellReuseIdentifier: Constants.TableView.calfWeanedCell)
    }
    
    // MARK: - Setup
    
    private func setup() {}
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
        private func calfToBeWeaned()->[CowModel]{
            cowArray.removeAll()
            for i in cowViewModel.fetchCowViewModel(){
                if NumberOfDays.dateDayCount(date: i.dateOfBirth) > 75 && NumberOfDays.dateDayCount(date: i.dateOfBirth) < 85{
                    cowArray.append(i)
                }
            }
            return cowArray
        }
}

extension CalfToBeWeaned : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calfToBeWeaned().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.calfWeanedCell, for: indexPath) as? CalfWeanedTableViewCell else {return UITableViewCell()}
        cell.calfEarTagLabel.text = calfToBeWeaned()[indexPath.row].earTag
        cell.calfNameLabel.text = calfToBeWeaned()[indexPath.row].cowName
        let age = calfToBeWeaned()[indexPath.row].dateOfBirth
        cell.calfAgeLabel.text = "\(NumberOfDays.dateDayCount(date: age)) gün"
        return cell
        
    }
}
