//
//  GeneralInformationsController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 26.10.2022.
//

import Foundation
import UIKit



class GeneralInformationsController : UIView , NibInitializable {
   
    
    
    // MARK: - Properties
    @IBOutlet weak var earTagLabel: UILabel!
    @IBOutlet weak var reproductiveStatusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var leashNumberLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var cowBreedLabel: UILabel!
    @IBOutlet weak var dryOffLabel: UILabel!
    @IBOutlet weak var dryOffCountLabel: UILabel!
    
    @IBOutlet weak var progressBarView: ProgressBar!
    
   
    var nibName: String = "GeneralInformationsScreen"
    var delegate : GetCowAndViewProtocol?
    private let cowModel = CowModel()
    var countFired: CGFloat = 0
    

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
        var date = 0.0
        var doubleDate = ""
        guard let dlgt = delegate else {return}
        Constants.progressCow = dlgt.getCow()
        if dlgt.getCow().reproductiveStatus?.name == "Gebe" || dlgt.getCow().reproductiveStatus?.name == "Kuruda" || dlgt.getCow().reproductiveStatus?.name == "Yakın Gebe"{
            progressBarView.isHidden = false
            for i in dlgt.getCow().inseminations{
                if i.inseminationsStatus == "Başarılı"{
                    date =  Double(NumberOfDays.dateDayCount(date: i.inseminationDate))
                    break
                }
            }
             doubleDate = String(format: "%.1f", date / 280)
            if date > 280 {
                self.progressBarView.progress = min(CGFloat(0.04 * self.countFired), 1)

                self.progressBarView.progress = 1
            }else{
                self.progressBarView.progress = min(CGFloat(0.04 * self.countFired), 1)

                self.progressBarView.progress = Double(doubleDate)!
            }

        }else{
            progressBarView.isHidden = true
        }
        
        
       
  
        
        if let delegate = delegate {
            earTagLabel.text = delegate.getCow().earTag
            reproductiveStatusLabel.text = delegate.getCow().reproductiveStatus?.name
            nameLabel.text = delegate.getCow().cowName
            leashNumberLabel.text = delegate.getCow().leashNumber
            groupLabel.text = delegate.getCow().groupNo ?? "-"
            ageLabel.text = String( "\(NumberOfDays.dateDayCount(date: delegate.getCow().dateOfBirth, format: "dd.MM.yy")) Gün")
            cowBreedLabel.text = delegate.getCow().cowBreed
            
            if delegate.getCow().reproductiveStatus?.name == "Gebe"{
                dryOffLabel.isHidden = false
                dryOffCountLabel.isHidden = false
                for i in delegate.getCow().inseminations{
                    if  i.inseminationsStatus == "Başarılı"{
                        dryOffCountLabel.text = String(210 - NumberOfDays.dateDayCount(date: i.inseminationDate))
                    }
                }
            }else if delegate.getCow().reproductiveStatus?.name == "Kuruda"{
                dryOffLabel.isHidden = false
                dryOffCountLabel.isHidden = false
                guard let dlgt = delegate.getCow().dryOffDate else {return}
                dryOffCountLabel.text = "\(dlgt) tarihinde kuruya çıkmış"
            }
            
        }
    }
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    private func setup(){}
    

    


}

