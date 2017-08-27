//
//  ViewController.swift
//  WZLearnSwift
//
//  Created by wizet on 2017/6/19.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewVCBtn: UIButton!
    
    var clickCount:Int = 0;//clickCount 并没有声明为int
    
    override func viewDidLoad() {
        super.viewDidLoad()//是基类其中有的 必须写个keyword
        self.automaticallyAdjustsScrollViewInsets = false;
        
        let sel : Selector = #selector(clickMe(sender:))
        tableViewVCBtn .addTarget(self, action: sel, for: UIControlEvents.touchUpInside);
        tableViewVCBtn.layer.borderColor = UIColor.black.cgColor;
        tableViewVCBtn.layer.borderWidth = 1.0;
        
        
        
    }
    
    
    //定义一个点击事件的函数
    func clickMe(sender:UIButton) {
        clickCount += 1;
  
        self.navigationController?.pushViewController(TableViewVC(), animated: true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    enum Rank: Int {
        case Ace = 2
        case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King
        func simpleDescription() -> String {
            switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                return String(self.rawValue)//rawValue 原始值
            }
        }
    }
    let ace = Rank.Ace
//    let aceRawValue = ace.rawValue//playground 是可以的。。。
    
    
    
    class Person {
        let name: String
        init(name: String) {
            self.name = name
            print("\(name) is being initialized")
        }
        deinit {
            print("\(name) is being deinitialized")
            
        }
    }
}


