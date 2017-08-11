//
//  ViewController.swift
//  WZLearnSwift
//
//  Created by wizet on 2017/6/19.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var clickCount:Int = 0;//clickCount 并没有声明为int
    var myLabel:UILabel? //申明一个全局变量？表示初始值为空
    override func viewDidLoad() {
        super.viewDidLoad()//是基类其中有的 必须写个keyword
        
        
        
        self.automaticallyAdjustsScrollViewInsets = false;
        var  arr : Array<String> = [];
        arr = ["1", "2", "3"];
        let a = arr.count;
        print("%ld", a);
        

        //元组
        var tuple  = ["1", "2", "3", UIColor()] as [Any];
        tuple.isEmpty;
        
        
        
        let color = UIColor.red;//创建一个红色对象
        //color 是一个常量
        let color1 = UIColor.gray;
        self.view.backgroundColor = color1;
        
        //super 表示父类
        //3.创建一个Controller
        
        //把背静颜色改为红色
        // Do any additional setup after loading the view, typically from a nib.
        
        //在界面上加个UILabel
        //CGRect 相当于之前的CGRectMake
        //frame 在父视图中的区间坐标
        //这里是标签内容，将oc 中的标签来拿使用
        let rect = CGRect(x:0,y:100,width:320,height:44);
        
        myLabel = UILabel(frame: rect);
        myLabel!.text = "百度";//表示为空也能够去创建
        //把myLabel 对象添加到self.view 对象上
        self.view.addSubview(myLabel!);
        myLabel!.backgroundColor = UIColor.red;
        
        
        //创建一个UIButton
        var myButton = UIButton(frame: CGRect(x:100,y:200,width:100,height:44));
        
        myButton.backgroundColor = UIColor.purple;
        //给button 设置文字
        //settitle 第一个參数不须要跟标签，第二个參数forstate 是标签
        myButton.setTitle("点击我", for:UIControlState.normal);
        //给button 设置一个文字
        
        
        
        //给mybuttom 添加点击事件
        myButton.addTarget(self, action:#selector(clickMe), for:UIControlEvents.touchUpInside);
        self.view.addSubview(myButton);
        
        var layer = CALayer();
        var path = UIBezierPath();
        
        
        print(layer, path, separator: "lalalaa", terminator: "end");
        var myInt = Int.max;
        myInt = 9;
        var yourInt = myInt + 1;
    }
    
    func greet (person: String) -> Void {
        print("hello world!")
    }
    
    //定义一个点击事件的函数
    
    func clickMe(sender:UIButton) {
        clickCount += 1;
        /**
         *  \(这里放变量或者表达式)
         */
        print("click \(clickCount)");
        myLabel!.text = "百度\(clickCount)";
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


