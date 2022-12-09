//
//  NearBirthViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 29.11.2022.
//

import Foundation
import UIKit

class NearBirthViewController : UIView , NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var nearBirthTableView: UITableView!
    var nibName: String = "NearBirthScreen"
    private var cowArray = [CowModel]()
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
        nearBirthTableView.delegate = self
        nearBirthTableView.dataSource = self
        self.nearBirthTableView.register(UINib(nibName: Constants.TableView.nearBirthController, bundle: nil), forCellReuseIdentifier: Constants.TableView.nearBirthCell)
        
    }
    
    // MARK: - Setup
    
    private func setup() {}
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    private func nearBirthCows()->[CowModel]{
        cowArray.removeAll()
        let cowViewModel = CowViewModel()
        
        for i in cowViewModel.fetchCowViewModel(){
            if i.reproductiveStatus?.name == "Gebe" || i.reproductiveStatus?.name == "Kuruda" || i.reproductiveStatus?.name == "Yakın Gebe"{
                for a in i.inseminations{
                    if a.inseminationsStatus == "Başarılı" && NumberOfDays.dateDayCount(date: a.inseminationDate) > 273 {
                        cowArray.append(i)
                        
                    }
                }
            }
        }
        return cowArray
    }
    
}

extension NearBirthViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nearBirthCows().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.nearBirthCell, for: indexPath) as? NearBirthTableViewCell else {return UITableViewCell()}
        cell.cowEarTagLabel.text = cowArray[indexPath.row].earTag
        cell.cowNameLabel.text = cowArray[indexPath.row].cowName
        var day = 0
        for i in cowArray[indexPath.row].inseminations{
            if i.inseminationsStatus == "Başarılı"{
                day = NumberOfDays.dateDayCount(date: i.inseminationDate)
            }
        }
        cell.nearBirthDayLabel.text = String(283 - day)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = delegate else {return}
        delegate.toCowCard(cowModel: cowArray[indexPath.row])
    }
}
