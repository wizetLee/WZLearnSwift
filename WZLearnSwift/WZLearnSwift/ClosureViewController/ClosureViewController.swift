//
//  ClosureViewController.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/6.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

class ClosureViewController: WZBaseViewController {

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
