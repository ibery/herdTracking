//
//  DryOffViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 28.11.2022.
//

import Foundation
import UIKit

class DryOffViewController : UIView , NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var dryOffTableView: UITableView!
    @IBOutlet weak var dryOffDateView: DryOffDateViewController!
    var nibName: String = "DryOffScreen"
    var cowArray = [CowModel]()
    var cowViewModel = CowViewModel()
    
    
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
    
        dryOffTableView.delegate = self
        dryOffTableView.dataSource = self
        dryOffDateView.delegate = self
        self.dryOffTableView.register(UINib(nibName: Constants.TableView.firstPregnancyController, bundle: nil), forCellReuseIdentifier: Constants.TableView.firstPregnancyCell)
    }
    
    // MARK: - Setup
    
    private func setup() {}
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    private func dryOffCows()->[CowModel]{
        cowArray.removeAll()
        for i in cowViewModel.fetchCowViewModel(){
            if i.reproductiveStatus?.name == "Gebe"{
                for a in i.inseminations{
                    if NumberOfDays.dateDayCount(date: a.inseminationDate) > 205 {
                        cowArray.append(i)
                    }
                }
            }
        }
        return cowArray
    }
    
}

extension DryOffViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dryOffCows().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.firstPregnancyCell, for: indexPath) as? FirstPregnancyTableViewCell else {return UITableViewCell()}
        cell.firstPregnancyEarTagLabel.text = dryOffCows()[indexPath.row].earTag
        cell.firstPregnancyNameLabel.text = dryOffCows()[indexPath.row].cowName
        for i in cowArray[indexPath.row].inseminations{
            if i.inseminationsStatus == "Başarılı"{
                cell.firstPregnancyInseminatedDaysLabel.text = String(NumberOfDays.dateDayCount(date: i.inseminationDate))
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dryOffDateView.isHidden = false
        dryOffDateView.layer.borderColor = CGColor(red: 251, green: 37, blue: 118, alpha: 1)
        Constants.dryOffRow = indexPath.row
        
    }
    
}

extension DryOffViewController : BirthProtocol{
    func fetchCow() -> CowModel {
        return dryOffCows()[Constants.dryOffRow]
        
        // kayıttan sonra anasayfaya gidilecek
    }

    func closeBirthInfoView() {
        dryOffDateView.isHidden = true
    }


}
