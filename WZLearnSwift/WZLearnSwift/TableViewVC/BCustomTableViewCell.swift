//
//  BCustomTableViewCell.swift
//  Test
//
//  Created by 李炜钊 on 2017/8/26.
//  Copyright © 2017年 李炜钊. All rights reserved.
//

import UIKit

class BCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
