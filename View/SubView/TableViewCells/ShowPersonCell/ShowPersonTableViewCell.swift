//
//  ShowPersonTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 19.10.2022.
//

import UIKit

class ShowPersonTableViewCell: UITableViewCell {

    // MARK : Properties
    
    @IBOutlet weak var successPercentageLabel: UILabel!
    @IBOutlet weak var failCountLabel: UILabel!
    @IBOutlet weak var successCountLabel: UILabel!
    @IBOutlet weak var inseminationNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
