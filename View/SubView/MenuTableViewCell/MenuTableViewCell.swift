//
//  MenuTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 5.10.2022.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageCell: UIImageView!
    @IBOutlet weak var earTagLabel: UILabel!
    @IBOutlet weak var cowNameLabel: UILabel!
    @IBOutlet weak var reproductiveStatusLabel: UILabel!
    @IBOutlet weak var dayCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
