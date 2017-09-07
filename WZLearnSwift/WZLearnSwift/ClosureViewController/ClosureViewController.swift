//
//  ClosureViewController.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/6.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

typealias blankClosure = (() -> Void)

class ClosureViewController: WZBaseViewController {

    var ten = 10
    
    var instanceClosure: blankClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        
        func backward(_ s1: String, _ s2: String) -> Bool {
            return s1 > s2
        }
        // MARK: -  backward  函数指针
        names = names.sorted(by: backward)
        print(names)
        
        /*
         { (parameters) -> returnType in
         statements
         }
         */
        
       names = names.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        
        names = names.sorted(by: { (s1, s2) -> Bool in
            return s1 > s2
        })
        
        names = names.sorted(by: { (s1, s2) in
            return s1 > s2
        })
        
        names = names.sorted(by: { (s1, s2) in
             s1 > s2
        })
        
        names = names.sorted(by: { $0 > $1 })
        
        names = names.sorted(by: > )
        
        
        // MARK: - 尾随闭包 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
        func someFunctuinWithColsure(closure : (() -> String)) -> String {
            let tmpStr = closure()
            print(tmpStr)
            return tmpStr + self.description;
        }
        
        ////内联闭包形式，不使用尾随闭包
       let tmpStr =  someFunctuinWithColsure(closure: {
            print("this is a colsure")
            return "wizet"
        })
        
        print(tmpStr)
        var a = 10
        var b = 2
        func doubleCustomSum(closure : ((Int , Int) -> Int) ) -> Int {
            //没有捕获值啊
            return closure(a , b) * 2
        }
        var sum = doubleCustomSum(closure: { $0 + $1 })
        print(a)
        print(b)
        print(sum)
        a = 30
        b = 100
        sum = doubleCustomSum(closure: { $0 + $1 })
        print(sum)
        
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        
        let func1 = makeIncrementer(forIncrement: 9)
        print(func1())
        print(func1())
        
        var callBackUTFStrCount: ((String) -> Int)?
        callBackUTFStrCount = {(x:String) in return x.utf8.count}
        if callBackUTFStrCount != nil {
            print("-------------------------------------------")
            print(callBackUTFStrCount!("❤️"))
            print(callBackUTFStrCount!(" "))
            print(callBackUTFStrCount!("(ˇˍˇ) ～"))
            print(callBackUTFStrCount!("("))
            print(callBackUTFStrCount!("ˇ"))
            print(callBackUTFStrCount!("ˍ"))
            print(callBackUTFStrCount!("ˇ"))
            print(callBackUTFStrCount!(")"))
            print(callBackUTFStrCount!(" "))
            print(callBackUTFStrCount!("～"))
            print("-------------------------------------------")
        }
        
        // MARK: - 闭包在函数调用之后才执行的成为逃逸闭包。参数名之前标注 @escaping，指明这个闭包是允许“逃逸”出这个函数、
        
        var closures : [(() -> Void)] = [];//闭包鼠数组
        
        //接受一个闭包作为参数
        func sumOfColsure( aColsure :  @escaping ()->Void )  {
            closures.append(aColsure)
            //            self.instanceClosure = aColsure
            self.instanceClosure = aColsure
        }
        
        func normalClosure (normal : () -> Void) {
            normal()
        }
        print(ten);
        normalClosure {
            ten = 20;
        }
        
        sumOfColsure(aColsure: {  self.ten = 100 });
        print(ten);
        //        closures.first?()
        self.instanceClosure?()
        print(ten);
        
        
        //自动闭包 不带任何参数的闭包  @autoclosure
        
        //逃逸闭包通常不带返回值
        //自动闭包通常包含返回值
        //想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性

        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
