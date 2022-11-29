//
//  FirstPregnancyViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 25.11.2022.
//

import Foundation
import UIKit

class FirstPregnancyViewController : UIView , NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var firtsPregnancyTableView: UITableView!
    var nibName: String = "FirstPregnancyScreen"
    var cowViewModel = CowViewModel()
    var cowArray = [CowModel]()
    var delegate : myWorkToCowCard?
    
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
        firtsPregnancyTableView.dataSource = self
        firtsPregnancyTableView.delegate = self
        self.firtsPregnancyTableView.register(UINib(nibName: Constants.TableView.firstPregnancyController, bundle: nil), forCellReuseIdentifier: Constants.TableView.firstPregnancyCell)
    }
    
    // MARK: - Setup
    
    private func setup() {}
    
    // MARK: - Actions
    
    
    // MARK: - Methods

    private func firstPregnancy()->[CowModel]{
        cowArray.removeAll()
        for i in cowViewModel.fetchCowViewModel(){
            if i.reproductiveStatus?.name == "Tohumlanmış"{
                for a in i.inseminations{
                    let date = NumberOfDays.dateDayCount(date: a.inseminationDate)
                    if a.inseminationsStatus == "Beklemede" || date > 39{
                        cowArray.append(i)
                    }
                }
            }
        }
        return cowArray
    }
}

extension FirstPregnancyViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstPregnancy().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var date = ""
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.firstPregnancyCell, for: indexPath) as? FirstPregnancyTableViewCell else {return UITableViewCell()}
        cell.firstPregnancyEarTagLabel.text = cowArray[indexPath.row].earTag
        cell.firstPregnancyNameLabel.text = cowArray[indexPath.row].cowName
        for i in cowArray[indexPath.row].inseminations{
            if i.inseminationsStatus == "Beklemede"{
                date = i.inseminationDate
            }
        }
        cell.firstPregnancyInseminatedDaysLabel.text = String( NumberOfDays.dateDayCount(date: date))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate else {return}
        delegate.toCowCard(cowModel: cowArray[indexPath.row])
    }
    
    
}
