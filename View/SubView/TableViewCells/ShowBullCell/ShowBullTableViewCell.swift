//
//  ShowBullTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 19.10.2022.
//

import UIKit

class ShowBullTableViewCell: UITableViewCell {

    @IBOutlet weak var bullBreed: UILabel!
    @IBOutlet weak var bullName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
