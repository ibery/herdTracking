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
    var nibName: String = "GeneralInformationsScreen"
    var delegate : GetCowAndViewProtocol?
    private let cowModel = CowModel()
    
    
    
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
        if let delegate = delegate {
            earTagLabel.text = delegate.getCow().earTag
            reproductiveStatusLabel.text = delegate.getCow().reproductiveStatus?.name
            nameLabel.text = delegate.getCow().cowName
            leashNumberLabel.text = delegate.getCow().leashNumber
            groupLabel.text = delegate.getCow().groupNo ?? "-"
            ageLabel.text = String( "\(NumberOfDays.dateDayCount(date: delegate.getCow().dateOfBirth, format: "dd.MM.yy")) Gün")
            cowBreedLabel.text = delegate.getCow().cowBreed
           
        }
    }
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    private func setup(){}
    
}
