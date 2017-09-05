//
//  DeviceHardware.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/4.
//  Copyright © 2017年 wizet. All rights reserved.
//

import Foundation
import UIKit


// MARK: - UIViewController extension
extension UIViewController {
    
    // MARK: - 子类View最底顶部的y位置
    var subViewsOrigionY : CGFloat {
        get {
            return(self.navigationController?.navigationBar.frame.origin.y ?? 0) + (self.navigationController?.navigationBar.frame.size.height ?? 0)
        }
    }
   
    
}
