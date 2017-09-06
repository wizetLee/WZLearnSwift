//
//  JSONViewController.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/5.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

class JSONViewController: WZBaseViewController {
    
    let jsonStr : String = "[{\"name\": \"hangge\", \"age\": 100, \"phones\": [{\"name\": \"公司\",\"number\": \"123456\"}, {\"name\": \"家庭\",\"number\": \"001\"}]}, {\"name\": \"big boss\",\"age\": 1,\"phones\": [{ \"name\": \"公司\",\"number\": \"111111\"}]}]"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false;
        
        // JSON str -》 data -》 数组
        if let jsonData = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            
            if let tmpArray = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) {
                //数组（字典）
                if ((tmpArray as? [[String :AnyObject /*字符或者数组*/]]) != nil) {///Dictionary<String , AnyObject>
                    print(String(describing: tmpArray));
                }
            }
            
            
            // MARK: - 使用的是swiftJSON 第三方的库
            do {
                let json = try JSON(data: jsonData)   //JSON(data: jsonData)
                if let number = json[0]["phones"][0]["number"].string {
                    // 找到电话号码
                    print("第一个联系人的第一个电话号码：",number)
                }
            } catch {
                print(error)
            }
//            或者直接 在try后面加个可选性 question mark ：?  就不用补抓异常了
//            let json = try? JSON(data: jsonData)   //JSON(data: jsonData)
//            if let number = json[0]["phones"][0]["number"].string {
//                // 找到电话号码
//                print("第一个联系人的第一个电话号码：",number)
//            }
           
        }
        
       
        
        
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
