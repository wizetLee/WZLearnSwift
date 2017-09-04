//
//  ToastViewController.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/1.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

class ToastViewController: WZBaseViewController, WZAlert1Protocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenW = UIScreen.main.bounds.size.width
        _ = UIScreen.main.bounds.size.height
        
        let btnH : CGFloat = 44.0;
        for number in 0..<10 {
            let rect = CGRect(x: 0.0, y: self.subViewsOrigionY + btnH * CGFloat(number), width: screenW, height: btnH)
            let btn : UIButton = UIButton(frame: rect)
            btn.setTitle("\(number)", for: .normal)
            btn.setTitleColor(UIColor.blue, for: .normal)
            btn.tag = number
            self.view.addSubview(btn)
            btn.addTarget(self, action: #selector(clickedBtn(sender : )), for: .touchUpInside);
            if number == 0 {
                btn.setTitle("测试alert", for: .normal)
            }
        }
    }

    
    ///denegate
    func alertHasBeenClicked(alert: WZAlert1) {
        alert.alertDismiss(animation: true)
    }
    @objc func clickedBtn(sender : UIButton){
        switch sender.tag {
            case 0:
                let alert : WZAlert1 = WZAlert1()
                alert.delegate = self
                alert.alertShow()
                break
            case 1:print("\(sender.tag)")
            WZToast.toastWithContent(content: "\(sender.tag)11111111111111111111111111111111111111111111111111111111111111")
                break
            case 2:print("\(sender.tag)")
            WZToast.toastWithContent(content: "\(sender.tag)22222222222222222222222222222222222222222222")
                break
            case 3:print("\(sender.tag)")
            WZToast.toastWithContent(content: "\(sender.tag)3333333333333333333333333333333333333333333333333333333333333333333333333")
                break
            case 4:print("\(sender.tag)")
            WZToast.toastWithContent(content: "\(sender.tag)4444444444444444444444444444444444444444444444")
                break
            case 5:print("\(sender.tag)")
            WZToast.toastWithContent(content: "\(sender.tag)55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555")
                break
            case 6:print("\(sender.tag)")
            WZToast.toastWithContent(content: "\(sender.tag)")
                break
            case 7:print("\(sender.tag)")
            WZToast.toastWithContent(content: "\(sender.tag)")
                break
            case 8:print("\(sender.tag)")
            WZToast.toastWithContent(content: "\(sender.tag)")
                break
            case 9:print("\(sender.tag)")
            
                break
            default:break
        }
    }
    
}
