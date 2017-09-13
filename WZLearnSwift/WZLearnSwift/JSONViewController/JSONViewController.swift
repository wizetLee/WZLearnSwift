//
//  JSONViewController.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/5.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

struct XiaoMing : Decodable, Encodable {
    var name : String?
    var age : Int?
    var weight : Float?
     var school: School?
    
    ///自定义键名字
    enum CustomKeys : String, CodingKey {
        case name
        case abv = "a_field"
        case brewery = "another_field"
        case style
    }
}

struct School: Decodable, Encodable {
    var name: String?
    var address: String?
}

//想要把枚举归档 需要 表明其原始值的类型 如：String
enum WorkTime : String, Decodable, Encodable  {
    case learn
    case work
    case rest
}

class JSONViewController: WZBaseViewController {
    let jsonString =
            """
            {
                "name": "小明",
                "age": 12,
                "weight": 43.2,
                "school": {
                    "name": "市第一中学",
                    "address": "XX市人民中路 66 号"
                }
            }
            """
    let jsonStr : String = "[{\"name\": \"hangge\", \"age\": 100, \"phones\": [{\"name\": \"公司\",\"number\": \"123456\"}, {\"name\": \"家庭\",\"number\": \"001\"}]}, {\"name\": \"big boss\",\"age\": 1,\"phones\": [{ \"name\": \"公司\",\"number\": \"111111\"}]}]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false;
       
        // JSON str -》 data -》 数组
      
        if let jsonData = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            
             // MARK: - 系统方法
            if let tmpArray = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) {
                //数组（字典）
                if ((tmpArray as? [[String :AnyObject /*字符或者数组*/]]) != nil) {///Dictionary<String , AnyObject>
                    print(String(describing: tmpArray));
                }
            }
            ///http://www.cocoachina.com/ios/20170630/19691.html
            do {
                let jd : JSONDecoder = JSONDecoder()
                jd.outputFormatting = .prettyPrinted
                let xiaoming = try jd.decode(XiaoMing.self, from: jsonString.data(using: .utf8)!)
                
                print(xiaoming)
                // MARK: - 归档
                let data = try JSONEncoder().encode(xiaoming)
                let json = String(data: data, encoding: .utf8)
                /*
                 compact
                 默认的 compact 风格会移除 JSON 数据中的所有格式信息，比如换行、空格和缩紧等，以减小 JSON 数据所占的空间。如果导出的 JSON 数据用户程序间的通讯，对阅读要求不高时，推荐使用这个设置。
                 prettyPrinted
                 如果输出的 JSON 数据是用来阅读查看的，那么可以选择 prettyPrinted，这时候输出的 JSON 会自动进行格式化，添加换行、空格和缩进，以便于阅读。类似于上面文中使用的 JSON 排版风格。
                 */
                print(data)
                print(json ?? "失败")
            } catch {
                print(error);
            }
           
            ///解析数组
            do {
                let xiaomings = try JSONDecoder().decode([XiaoMing].self, from: jsonString.data(using: .utf8)!)
                 print(xiaomings)
            } catch {
                // 异常处理
                print(error);
            }
            
            
            let a = true
            let IntA = 190
            let pi = Float.pi
           
            
            
        // MARK: - 使用的是swiftJSON 第三方的库
        do {
            let json = try JSON(data: jsonData)   //JSON(data: jsonData)
            if let number = json[0]["phones"][0]["number"].string {
                // 找到电话号码
                print(number)
            }
            
            if let number = json[10000].int {
                print(number)
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
           let ErrorUnsupportedType = 1
            
            
            
            
            
        }
    }
}
