//
//  StockCell.swift
//  stockbaba
//
//  Created by Diana Yau on 6/8/16.
//  Copyright © 2016 hello. All rights reserved.
//

import UIKit

class StockCell: UITableViewCell {
    
    
    @IBOutlet weak var titleStock: UILabel!
    
    @IBOutlet weak var openPrice: UILabel!
    
    @IBOutlet weak var closePrice: UILabel!
    
    @IBOutlet weak var subtraction: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
