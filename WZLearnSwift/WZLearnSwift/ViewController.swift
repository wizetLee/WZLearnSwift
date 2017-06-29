//
//  ViewController.swift
//  WZLearnSwift
//
//  Created by wizet on 2017/6/19.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.view.backgroundColor = .orange;
//        let view = UIView();
//        view.backgroundColor = .yellow;
//        view.frame = CGRect(x:0,y:100,width:320,height:44);
//        
//        self.view.addSubview(view);
//        
//        
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        
//    }
    var clickCount:Int = 0;//clickCount 并没有声明为int
    var myLabel:UILabel? //申明一个全局变量？表示初始值为空
    override func viewDidLoad() {
        super.viewDidLoad()//是基类其中有的 必须写个keyword
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
        myButton.addTarget(self, action:Selector("clickMe:"), for:UIControlEvents.touchUpInside);
        self.view.addSubview(myButton);
        
        var layer = CALayer();
        var path = UIBezierPath();
        
        
        
    }
    //定义一个点击事件的函数
    
    func clickMe(sender:UIButton){
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

    

}

