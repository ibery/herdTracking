//
//  VaccineTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 17.11.2022.
//

import UIKit

class VaccineTableViewCell: UITableViewCell {
    @IBOutlet weak var vaccineNameLabel: UILabel!
    
    @IBOutlet weak var vaccineDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
