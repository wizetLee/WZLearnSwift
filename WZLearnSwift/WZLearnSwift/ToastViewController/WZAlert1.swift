//
//  WZAlert1.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/2.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

protocol WZAlert1Protocol {
    func alertHasBeenClicked(alert:WZAlert1);
}

class WZAlert1: WZBaseAlert {

    var delegate : WZAlert1Protocol? = nil
    
    override func alertContent() {
        super.alertContent()
        let view = UIView(frame: CGRect(x: 110, y: 110, width: 110, height: 110))
        self.addSubview(view)
        view.backgroundColor = UIColor.blue
        let label : UILabel = UILabel(frame:view.bounds);
        label.text = "测试alert"
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        view.addSubview(label);
        self.clickedBackgroundToDismiss = false;
        let button : UIButton = UIButton(frame: CGRect(x: 0.0, y: 20.0, width: 200, height: 44.0))
        self.addSubview(button)
        button .setTitle("title fo button", for: .normal)
        button.backgroundColor = UIColor.orange
        button .addTarget(self, action: #selector(clickBtn(sender:)), for: .touchUpInside)
    }
    
    @objc func clickBtn(sender: UIButton) {
        delegate?.alertHasBeenClicked(alert: self);
    }
}
