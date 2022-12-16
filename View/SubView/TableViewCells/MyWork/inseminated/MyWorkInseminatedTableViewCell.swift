//
//  MyWorkInseminatedTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 24.11.2022.
//

import UIKit

class MyWorkInseminatedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myWorkInseminatedNumberOfMilkedDaysLabel: UILabel!
    @IBOutlet weak var myWorkInseminatedNameLabel: UILabel!
    @IBOutlet weak var myWorkInseminatedEarTagLabel: UILabel!
    
    @IBOutlet weak var earTagTitleLabel: UILabel!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var numberOfMilkTitleLabel: UILabel!
    
//    @IBOutlet weak var myWorkInseminatedEarTagLabel: UILabel!
//    @IBOutlet weak var myWorkInseminatedNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
