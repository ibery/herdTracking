//
//  BirthListTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 29.10.2022.
//

import UIKit

class BirthListTableViewCell: UITableViewCell {

    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var firstCalfEarTagLabel: UILabel!
    @IBOutlet weak var secondCalfEarTagLabel: UILabel! 
    @IBOutlet weak var secondEarTag: UILabel!
    @IBOutlet weak var firstCalfGenderLabel: UILabel!
    @IBOutlet weak var secondCalfGenderLabel: UILabel!
    @IBOutlet weak var secondGenderlabel: UILabel!
    
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
