//
//  FeedTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 8.12.2022.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var feedNameLabel: UILabel!
    @IBOutlet weak var theAmountOffStockLabel: UILabel!
    @IBOutlet weak var dailyUseLabel: UILabel!
    @IBOutlet weak var numberOfDaysRemainingLabel: UILabel!
    @IBOutlet weak var feedNameTitle: UILabel!
    @IBOutlet weak var amountTitle: UILabel!
    @IBOutlet weak var dailyTitle: UILabel!
    @IBOutlet weak var numberOfDayTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
