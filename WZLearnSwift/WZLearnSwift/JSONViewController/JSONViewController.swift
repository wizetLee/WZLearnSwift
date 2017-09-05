//
//  JSONViewController.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/5.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

class JSONViewController: UIViewController {
    
    let jsonStr : String = "[{\"name\": \"hangge\", \"age\": 100, \"phones\": [{\"name\": \"公司\",\"number\": \"123456\"}, {\"name\": \"家庭\",\"number\": \"001\"}]}, {\"name\": \"big boss\",\"age\": 1,\"phones\": [{ \"name\": \"公司\",\"number\": \"111111\"}]}]"
    
    var json : JSON = JSON.null
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false;
        
        // JSON str -》 data -》 数组
        if let jsonData = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            
            if let tmpArray = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) {
                //数组（字典）
                if ((tmpArray as? [[String :AnyObject ]]) != nil) {///Dictionary<String , AnyObject>
                    print(String(describing: tmpArray));
                }
            }
            
            if let userArray = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [[String: AnyObject]],
                let phones = userArray?[0]["phones"] as? [[String: AnyObject]],
                let number = phones[0]["number"] as? String {
                // 找到电话号码
                print("第一个联系人的第一个电话号码：",number)
            }
        }
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
