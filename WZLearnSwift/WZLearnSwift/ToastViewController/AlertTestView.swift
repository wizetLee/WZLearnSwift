//
//  AlertTestView.swift
//  WZLearnSwift
//
//  Created by admin on 11/9/17.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

protocol AlertTestViewProtocol {
    
    func sureAction();
    func cancelAction();
}

class AlertTestView: UIView {
    
    @IBOutlet weak var headlineLabel: UILabel!
    
    var delegate : AlertTestViewProtocol? = nil
    
    
    @IBAction func sureAction(_ sender: UIButton) {
        delegate?.sureAction()
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        delegate?.cancelAction()
        
    }
}
