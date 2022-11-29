//
//  NearBirthTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 29.11.2022.
//

import UIKit

class NearBirthTableViewCell: UITableViewCell {

    @IBOutlet weak var cowEarTagLabel: UILabel!
    @IBOutlet weak var cowNameLabel: UILabel!
    @IBOutlet weak var nearBirthDayLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
