//
//  PregnancyTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 17.11.2022.
//

import UIKit

class PregnancyTableViewCell: UITableViewCell {

    @IBOutlet weak var inspectionResultLabel: UILabel!
    @IBOutlet weak var inspectionDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
