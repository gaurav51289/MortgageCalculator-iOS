//
//  PropertyTableViewCell.swift
//  MortgageCalculator
//
//  Created by Ekta Sorathia on 5/9/17.
//  Copyright © 2017 Gaurav Chodwadia. All rights reserved.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var MonthlyPmtValLabel: UILabel!
    @IBOutlet weak var MonthlyPmtLabel: UILabel!
    @IBOutlet weak var DownPmtValLabel: UILabel!
    @IBOutlet weak var DownPmtLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
