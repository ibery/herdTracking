//
//  FirstPregnancyTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 24.11.2022.
//

import UIKit

class FirstPregnancyTableViewCell: UITableViewCell {

    @IBOutlet weak var firstPregnancyInseminatedDaysLabel: UILabel!
    @IBOutlet weak var firstPregnancyNameLabel: UILabel!
    @IBOutlet weak var firstPregnancyEarTagLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
