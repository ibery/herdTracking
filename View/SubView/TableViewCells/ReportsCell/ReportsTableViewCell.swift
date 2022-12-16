//
//  ReportsTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 13.12.2022.
//

import UIKit

class ReportsTableViewCell: UITableViewCell {

    @IBOutlet weak var earTagLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var reproductiveStatusLabel: UILabel!
    @IBOutlet weak var numberOfMilkedDaysLabel: UILabel!
    @IBOutlet weak var dayOfBirthLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
