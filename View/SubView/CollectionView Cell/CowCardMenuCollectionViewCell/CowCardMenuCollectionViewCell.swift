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

          self.menuLabel.textColor = isSelected ? .red : .black
          self.menuCellView.isHidden = isSelected ? false : true
         
      }
    }

}
