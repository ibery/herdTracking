//
//  NoteTableViewCell.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 18.11.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var noteLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
