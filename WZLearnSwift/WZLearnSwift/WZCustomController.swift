//
//  WZCustomController.swift
//  WZLearnSwift
//
//  Created by admin on 1/8/17.
//  Copyright © 2017年 wizet. All rights reserved.
//

import Foundation
import UIKit


class WZCustomController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;//类方法
        self.view.backgroundColor = UIColor(colorLiteralRed: 0.2, green: 0.2, blue: 0.2, alpha: 1.0);
        self.automaticallyAdjustsScrollViewInsets = false;
        
//        let flowLayout = 
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
    }
}
