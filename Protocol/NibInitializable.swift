//
//  NibInitializable.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 10.10.2022.
//

import UIKit

protocol NibInitializable {
    var nibName: String { get set }
}

extension NibInitializable where Self: UIView {
    internal func initiliaze(withNibName nibName: String, _ initiliazeCallback: ((UIView) -> Void)? = nil) {
        guard let view = loadView(fromNibName: nibName) else {
            print("Failed to initialize nib, nibName: \(nibName)")
            self.backgroundColor = .red
            
            return
        }
        
        view.frame = self.bounds
        self.addSubview(view)
        
        initiliazeCallback?(view)
    }
    
    private func loadView(fromNibName nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
