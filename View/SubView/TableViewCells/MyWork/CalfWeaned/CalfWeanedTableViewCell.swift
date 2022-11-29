//
//  CalfWeanedTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 29.11.2022.
//

import UIKit

class CalfWeanedTableViewCell: UITableViewCell {
    @IBOutlet weak var calfEarTagLabel: UILabel!
    
    @IBOutlet weak var calfAgeLabel: UILabel!
    @IBOutlet weak var calfNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
