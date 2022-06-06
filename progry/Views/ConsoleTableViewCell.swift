//
//  ConsoleTableViewCell.swift
//  progry
//
//  Created by Kevin Duenas on 28/05/22.
//

import UIKit

class ConsoleTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
