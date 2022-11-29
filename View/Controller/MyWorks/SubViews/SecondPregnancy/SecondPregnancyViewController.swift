//
//  SecondPregnancyViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 25.11.2022.
//

import Foundation
import UIKit

class SecondPregnancyViewController : UIView , NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var secondPregnancyTableView: UITableView!
    var nibName: String = "SecondPregnancyScreen"
    var cowViewModel = CowViewModel()
    var cowArray = [CowModel]()
    var delegate: myWorkToCowCard?
    
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
        
        secondPregnancyTableView.delegate = self
        secondPregnancyTableView.dataSource = self
        self.secondPregnancyTableView.register(UINib(nibName: Constants.TableView.firstPregnancyController, bundle: nil), forCellReuseIdentifier: Constants.TableView.firstPregnancyCell)
    }
    
    // MARK: - Setup
    
    private func setup() {}
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    private func secondPregnancy()->[CowModel]{
        cowArray.removeAll()
        for i in cowViewModel.fetchCowViewModel(){
            if i.reproductiveStatus?.name == "Gebe" || i.secondPregnancyControl == false{
                for a in i.inseminations{
                    if a.inseminationsStatus == "Başarılı"{
                        cowArray.append(i)
                    }
                }
            }
        }
        return cowArray
    }
    
}

extension SecondPregnancyViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondPregnancy().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var date = ""
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.firstPregnancyCell, for: indexPath) as? FirstPregnancyTableViewCell else {return UITableViewCell()}
        cell.firstPregnancyEarTagLabel.text = secondPregnancy()[indexPath.row].earTag
        cell.firstPregnancyNameLabel.text = secondPregnancy()[indexPath.row].cowName
        for i in cowArray[indexPath.row].inseminations{
            if i.inseminationsStatus == "Başarılı"{
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
