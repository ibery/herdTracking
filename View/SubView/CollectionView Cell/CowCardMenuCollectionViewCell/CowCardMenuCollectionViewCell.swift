//
//  CowCardMenuCollectionViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 25.10.2022.
//

import UIKit

class CowCardMenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isSelected: Bool {
      didSet {
        //  self.contentView.backgroundColor = isSelected ?.blue : .clear

          self.menuLabel.textColor = isSelected ? .red : .blue
          self.menuCellView.isHidden = isSelected ? false : true
          

      }
        
        
    }
    
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//  let userInterFaaceStyle = traitCollection.userInterfaceStyle
//
//         if userInterFaaceStyle == .dark{
//             self.menuLabel.textColor = isSelected ? .red : .white
//
//         }else{
//             self.menuLabel.textColor = isSelected ? .red : .black
//         }
//    }

}
