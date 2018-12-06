//
//  CustomTableViewCell.swift
//  Trip_Assistant_V01
//
//  Created by ios e on 4/29/18.
//  Copyright © 2018 ios-e. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var tripLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
