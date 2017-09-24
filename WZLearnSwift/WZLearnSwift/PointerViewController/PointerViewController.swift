//
//  PointerViewController.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/24.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

class PointerViewController: WZBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var test = 10
        //操作指针位置
        test = withUnsafeMutablePointer(to: &test, { (ptr: UnsafeMutablePointer<Int>) -> Int in
            ptr.pointee += 2
            return ptr.pointee
        })
        
        print(test)
        
        //        unsafeBitCast是非常危险的操作，它会将一个指针指向的内存强制按位转换为目标的类型。编译器无法确保得到的类型是否确实正确，你必须明确地知道你在做什么。
        let arr = NSArray(object: "meow")
        let str = unsafeBitCast(CFArrayGetValueAtIndex(arr, 0), to: CFString.self)
        
        
        //关于unsafeBitCast一种更常见的使用场景是不同类型的指针之间进行转换。因为指针本身所占用的的大小是一定的，所以指针的类型进行转换是不会出什么致命问题的。
        
        //有很多C API要求的输入是void *，对应到Swift中为UnsafePointer<Void>
        var count = 100
        
        
        var voidPtr = withUnsafePointer(to: &count, { (a: UnsafePointer<Int>) -> UnsafePointer<Void> in
            return unsafeBitCast(a, to: UnsafePointer<Void>.self)
        })
        // voidPtr 是 UnsafePointer<Void>。相当于 C 中的 void *
        // 转换回 UnsafePointer<Int>
        let intPtr = unsafeBitCast(voidPtr, to: UnsafePointer<Int>.self)
        
        intPtr.pointee  //100
        
        print(intPtr.pointee)
        /**
         总结
         Swift从设计上来说就是以安全作为重要原则的，虽然可能有些啰嗦，但是还是要重申在Swift中直接使用和操作指针应该作为最后的手段，它们始终是无法确保安全的。从传统的C代码和与之无缝配合的Objective-C代码迁移到Swift并不是一件小工程，我们的代码库肯定会时不时出现一些和C协作的地方。我们当然可以选择使用Swift重写部分陈旧代码，但是对于像是安全或者性能至关重要的部分，我们可能除了继续使用C API以外别无选择。如果我们想要继续使用那些API的话，了解一些基本的Swift指针操作和使用的知识会很有帮助。
         
         对于新的代码，尽量避免使用Unsafe开头的类型，意味着可以避免很多不必要的麻烦。Swift给开发者带来的最大好处是可以让我们用更加先进的编程思想，进行更快和更专注的开发。只有在尊重这种思想的前提下，我们才能更好地享受这门新语言带来的种种优势。显然，这种思想是不包括到处使用UnsafePointer的。
         */
        //来自王巍的博客
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
