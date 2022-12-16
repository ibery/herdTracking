//
//  InseminatedViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 25.11.2022.
//

import Foundation
import UIKit
import ChameleonFramework

class InseminatedViewController : UIView , NibInitializable {
    
    // MARK: - Properties
    
    @IBOutlet weak var inseminatedTableView: UITableView!
    var delegate : myWorkToCowCard?
    var nibName: String = "InseminatedScreen"
    var cowArray = [CowModel]()

        
    
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
        inseminatedTableView.delegate = self
        inseminatedTableView.dataSource = self
        self.inseminatedTableView.register(UINib(nibName: Constants.TableView.myWorkInseminatedController, bundle: nil), forCellReuseIdentifier: Constants.TableView.myWorkInseminatedCell)
  
    }
    
    // MARK: - Setup
    
    private func setup() {}
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
        private func emptyInseminated()->[CowModel]{
            let cowViewModel = CowViewModel()
            cowArray.removeAll()
            for i in cowViewModel.fetchCowViewModel(){
                if i.reproductiveStatus?.name == "Boş" || i.reproductiveStatus?.name == "Düve"{
                    cowArray.append(i)
                }
            }
            return cowArray
        }
    
}

extension InseminatedViewController  : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emptyInseminated().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.myWorkInseminatedCell, for: indexPath) as? MyWorkInseminatedTableViewCell else {return UITableViewCell()}
        
        cell.myWorkInseminatedEarTagLabel.text = cowArray[indexPath.row].earTag
        cell.myWorkInseminatedNameLabel.text = cowArray[indexPath.row].cowName
        if let lastCalvingDate =  emptyInseminated()[indexPath.row].lastCalvingDate{
            cell.myWorkInseminatedNumberOfMilkedDaysLabel.text = String( NumberOfDays.dateDayCount(date: lastCalvingDate))
        }else{
            cell.myWorkInseminatedNumberOfMilkedDaysLabel.text = ""
        }
        
        if let colour = FlatWhite().darken(byPercentage: CGFloat(indexPath.row) / CGFloat(emptyInseminated().count)) {
            cell.backgroundColor = colour
            cell.myWorkInseminatedEarTagLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.myWorkInseminatedNameLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.myWorkInseminatedNumberOfMilkedDaysLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.earTagTitleLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.nameTitleLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.numberOfMilkTitleLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            
        }
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate else {return}
        let cow = cowArray[indexPath.row]
        delegate.toCowCard(cowModel: cow)
    
    }
    
    
}
