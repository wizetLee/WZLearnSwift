//
//  ViewController.swift
//  WZLearnSwift
//
//  Created by wizet on 2017/6/19.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, MyRenamedProtocol {
    
    @IBOutlet weak var tableViewVCBtn: UIButton!
    @IBOutlet weak var toastVCBtn: UIButton!
    @IBOutlet weak var JSONBtn: UIButton!
    
    lazy var table : UITableView = {
        return UITableView(frame: CGRect(x: 0.0, y: self.subViewsOrigionY, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - self.subViewsOrigionY));
    }();
    
    //可以改为再映射的模式
    lazy var datas : [Dictionary<String, AnyClass>] = {
        //有命名空间！！！！！！
        return [
            ["title" : TableViewVC.classForCoder()],
            ["title" : ToastViewController.classForCoder()],
            ["title" : JSONViewController.classForCoder()],
            ["title" : ClosureViewController.classForCoder()],
                ];
        }();
    
    var clickCount:Int = 0;//clickCount 并没有声明为int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false;
        self.view.addSubview(self.table)
        self.table.delegate = self
        self.table.dataSource = self
        self.table.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: String(describing: UITableViewCell.self))
        
        let sel : Selector = #selector(clickMe(sender : ))
        tableViewVCBtn .addTarget(self, action: sel, for: UIControlEvents.touchUpInside);
        tableViewVCBtn.layer.borderColor = UIColor.black.cgColor;
        tableViewVCBtn.layer.borderWidth = 1.0;
        
        toastVCBtn.addTarget(self, action: sel, for: .touchUpInside)
        toastVCBtn.layer.borderColor = UIColor.black.cgColor;
        toastVCBtn.layer.borderWidth = 1.0;
        
        JSONBtn.addTarget(self, action: sel, for: .touchUpInside)
        JSONBtn.layer.borderColor = UIColor.black.cgColor;
        JSONBtn.layer.borderWidth = 1.0;
        
        var Array : Array<String> = ["ss", "ee"];
        var eee : Array<Array<String>> = [["ss", "ee"], ["aa", "bb"],  ["aa", "bb"]];
    }
    
    // MARK: - delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = table.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))
        if cell == nil {
           cell = UITableViewCell(style: .default, reuseIdentifier: String(describing: UITableViewCell.self))
        }
        cell?.selectionStyle = .none
        cell?.textLabel?.text = String(describing: self.datas[indexPath.row]["title"]!)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str : AnyClass  =  self.datas[indexPath.row]["title"]!
        print(str.description())
        guard  ((str as? UIViewController.Type) != nil) else {
            return
        }
   
        /**
         如果万不得已一定要用字符
         那么这样做
         根据命名空间传来的字符串先转换成anyClass
         不太建议这样做 因为可能以后会有这样的接口，也可能会修改 Bundle.main.infoDictionary的键值对
         var clsName = "UIViewController"
         let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"]as! String
         clsName = namespace + "." + clsName
         let cls = NSClassFromString(clsName)as! UIViewController.Type
         let vc = cls.init()
         */
        if ((str as? UIViewController.Type) != nil)  {
            self.navigationController?.pushViewController((str as! UIViewController.Type).init(), animated: true)
        }
    }
    
    
    //定义一个点击事件的函数
    @objc func clickMe(sender:UIButton) {
        clickCount += 1;
        if sender == self.tableViewVCBtn {
           self.navigationController?.pushViewController(TableViewVC(), animated: true);
        } else if (sender == self.toastVCBtn) {
            self.navigationController?.pushViewController(ToastViewController(), animated: true);
        } else if (sender == self.JSONBtn) {
            self.navigationController?.pushViewController(JSONViewController(), animated: true);
        }
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


/**
 renamed 参数用来提供文本信息，用以表示被重命名的声明的新名字。当使用声明的旧名字时，编译器会报错提示新名字。格式如下：
 renamed=新名字
 新名字由一个字符串构成。
 你可以将renamed 参数和 unavailable 参数以及类型别名声明组合使用，以此向用户表示某个声明已经被重命名。当某个声明的名字在一个框架或者库的不同发布版本间发生变化时，这会相当有用。
 */

//// 首发版本
//protocol MyProtocol {
//    // 这里是协议定义
//}
// 后续版本重命名了 MyProtocol
protocol MyRenamedProtocol {
    // 这里是协议定义
}
// MARK: -  不可重命名 "MyRenamedProtocol"  因此 别名的定义无效!!!!
@available(*, unavailable, renamed:"MyRenamedProtocol")
typealias MyProtocol = MyRenamedProtocol   //别名

