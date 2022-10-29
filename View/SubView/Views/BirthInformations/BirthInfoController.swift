//
//  BirthInfoController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 29.10.2022.
//

import Foundation
import UIKit

class BirthInfoController : UIView , NibInitializable {
    
    // MARK: - Properties
    var nibName: String = "BirthInfoScreen"
    
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
    
    
    // MARK: - Methods
    
    private func setup(){}
}

