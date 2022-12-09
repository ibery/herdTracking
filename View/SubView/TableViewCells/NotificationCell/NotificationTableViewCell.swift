//
//  NotificationTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 7.12.2022.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
