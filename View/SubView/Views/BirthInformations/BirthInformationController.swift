//
//  BirthInformationController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 26.10.2022.
//

import Foundation
import UIKit

protocol getCowBirthInformationProtocol{
    func getCowBirthInformations() -> CowModel
}

class BirthInformationController : UIView , NibInitializable {
    
    
    
    // MARK: - Properties
   
    var nibName: String = "BirthInformationScreen"
    var delegate : getCowBirthInformationProtocol?
    @IBOutlet weak var BirthDateTextField: UITextField!
    @IBOutlet weak var typeOfBirthTextFiedl: UITextField!
    @IBOutlet weak var calfEarTagTextField: UITextField!
    @IBOutlet weak var calfNameTextField: UITextField!
    @IBOutlet weak var twinsSwitch: UISwitch!
    @IBOutlet weak var calfGender: UITextField!
    
    @IBOutlet weak var secondCalfEarTag: UITextField!
    @IBOutlet weak var secondCalfName: UITextField!
    @IBOutlet weak var secondCalfGender: UITextField!
    
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
        
        
    }
    
    
    // MARK: - Actions
    
    @IBAction func giveBirth(_ sender: Any) {
    }
    private func setup(){}
    
    // MARK: - Methods
    
}


    

