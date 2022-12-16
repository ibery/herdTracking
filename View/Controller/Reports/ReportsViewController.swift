//
//  ReportsViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 13.12.2022.
//

import UIKit
import ChameleonFramework

class ReportsViewController : BaseViewController {
    
    
    // MARK: - Properties
    @IBOutlet weak var reportsTableView: UITableView!
    private let cowViewModel = CowViewModel()
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        reportsTableView.delegate = self
        reportsTableView.dataSource = self
        self.reportsTableView.register(UINib(nibName: Constants.TableView.reportsController, bundle: nil), forCellReuseIdentifier: Constants.TableView.reportsCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reportsTableView.reloadData()
        
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

extension ReportsViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cowViewModel.fetchCowViewModel().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.reportsCell, for: indexPath) as? ReportsTableViewCell else {return UITableViewCell()}
        cell.earTagLabel.text = cowViewModel.fetchCowViewModel()[indexPath.row].earTag
        cell.nameLabel.text = cowViewModel.fetchCowViewModel()[indexPath.row].cowName
        
        if cowViewModel.fetchCowViewModel()[indexPath.row].gender == "Erkek"{
            cell.reproductiveStatusLabel.text = "-"
            cell.numberOfMilkedDaysLabel.text = "-"
            cell.dayOfBirthLabel.text = "-"
        }else{
            cell.reproductiveStatusLabel.text = cowViewModel.fetchCowViewModel()[indexPath.row].reproductiveStatus?.name
            
            if cowViewModel.fetchCowViewModel()[indexPath.row].lastCalvingDate == nil {
                cell.numberOfMilkedDaysLabel.text = "-"
            }else{
                guard let day = cowViewModel.fetchCowViewModel()[indexPath.row].lastCalvingDate else {return UITableViewCell( )}
                
                cell.numberOfMilkedDaysLabel.text = String(NumberOfDays.dateDayCount(date: day))
            }
            if cowViewModel.fetchCowViewModel()[indexPath.row].reproductiveStatus?.name == "Gebe" || cowViewModel.fetchCowViewModel()[indexPath.row].reproductiveStatus?.name == "Kuruda" || cowViewModel.fetchCowViewModel()[indexPath.row].reproductiveStatus?.name == "Yakın Gebe"{
                var date = ""
                for i in cowViewModel.fetchCowViewModel()[indexPath.row].inseminations{
                    if i.inseminationsStatus == "Başarılı"{
                        date = i.inseminationDate
                        break
                    }
                }
                cell.dayOfBirthLabel.text = String(283 - NumberOfDays.dateDayCount(date: date))
                cell.dayOfBirthLabel.textColor = .red
            }else{
                cell.dayOfBirthLabel.text = "-"
            }
            
        }
        if let colour = FlatBlue().darken(byPercentage: CGFloat(indexPath.row) / CGFloat(cowViewModel.fetchCowViewModel().count)) {
            cell.backgroundColor = colour
            cell.earTagLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.nameLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.reproductiveStatusLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.numberOfMilkedDaysLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.dayOfBirthLabel.textColor = ContrastColorOf(colour, returnFlat: true)
        }
        
        return cell
    }
    
    
}
