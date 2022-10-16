//
//  AddInseminationsTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 15.10.2022.
//

import UIKit

class AddInseminationsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var inseminationsDate: UILabel!
    @IBOutlet weak var inseminationsBull: UILabel!
    @IBOutlet weak var inseminationsPerson: UILabel!
    @IBOutlet weak var inseminationsResult: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
