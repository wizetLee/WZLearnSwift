//
//  CustomTableViewCell.swift
//  Test
//
//  Created by 李炜钊 on 2017/8/26.
//  Copyright © 2017年 李炜钊. All rights reserved.
//

import UIKit


class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var actionBtn: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBAction func pressUpInside(_ sender: UIButton) {
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
