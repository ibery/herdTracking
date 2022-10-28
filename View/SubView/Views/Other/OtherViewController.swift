//
//  OtherViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 27.10.2022.
//

import UIKit

class OtherViewController : UIView ,NibInitializable {
    
    // MARK: - Properties
    var nibName: String = "OtherScreen"
//    var delegate : getCowInseminationInformationProtocol?
    
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
