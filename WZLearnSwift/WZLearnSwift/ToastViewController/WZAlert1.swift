//
//  WZAlert1.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/2.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit



class WZAlert1: WZBaseAlert {

    override func alertContent() {
        super.alertContent()
        let view = UIView(frame: CGRect(x: 110, y: 110, width: 110, height: 110))
        self.addSubview(view)
        view.backgroundColor = UIColor.blue
        let label : UILabel = UILabel(frame:view.bounds);
        label.text = "测试alert"
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        view.addSubview(label);
    }
}
