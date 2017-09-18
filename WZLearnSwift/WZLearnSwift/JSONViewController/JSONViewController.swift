//
//  JSONViewController.swift
//  WZLearnSwift
//
//  Created by 李炜钊 on 2017/9/5.
//  Copyright © 2017年 wizet. All rights reserved.
//

import UIKit

///自定义键名字
private enum Sex : String , CodingKey, Codable {
    case secret = "secret"
    case female = "female"
    case male = "male"
}

private struct XiaoMing : Decodable, Encodable {
    var name : String?
    var weightStr : String?
    var age : Int?
    var weight : Float?
    var school: School?
    var sex : Sex?///自定义键名字
    var date: Date?///时间格式 一般是直接使用字符串类型的时间戳 转 时间的
//    init(from decoder: Decoder) throws {
//        let value = try decoder.singleValueContainer()
//        try name = value.decode(String.self)
//        try age = value.decode(Int.self)
//        try weight = value.decode(Float.self)
//        try school = value.decode(School.self)
//        try sex = value.decode(Sex.self)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer();
//        try container.encode(name)
//        try container.encode(age)
//        try container.encode(weight)
//        try container.encode(school)
//        try container.encode(sex)
//    }
}

private struct XiaoHong : Codable {
    var newAge : UInt?
    var newName : String?
    var weight : Float?
    
    //枚举  重写属性名和字段的关系
    enum CCCCCCCC: String, CodingKey {
        case newName = "name"
        case newAge = "age"
        case weight  //如果不重写属性名也要在这个枚举中写上需要的属性名，因为底层似乎是通过此枚举映射值到属性上的，也就是此枚举需要写上所有的属性名!!!!
    }
    
    enum BBBBBB: String, CodingKey {
        case a  = "sadd"
    }
    
    //自定义编码
    //覆盖原有的 encode 方法 也要把所有的属性都要写上不然 JSON转字符串的时候就会出现缺失的情况
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CCCCCCCC.self)
        
        try container.encode(newAge, forKey: XiaoHong.CCCCCCCC.newAge)//实现赋值
        try container.encode(newName, forKey: XiaoHong.CCCCCCCC.newName)
        try container.encode(weight, forKey: XiaoHong.CCCCCCCC.weight)
    }
 
    //自定义解码
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CCCCCCCC.self)
        newName = try container.decode(String.self, forKey: XiaoHong.CCCCCCCC.newName)
        newAge = try container.decode(UInt.self, forKey: XiaoHong.CCCCCCCC.newAge)
        weight = try container.decode(Float.self, forKey: XiaoHong.CCCCCCCC.weight)
    }
    
    ///PS:
    /**
     在进行任何编码之前，我们都需要获取一个 container 对象，而该对象又有三种类型：
         Keyed Container：            键值对字典类型
         Unkeyed Container：         数值类型
         Single Value Container：    仅仅输出 raw value
     **/
}

private struct School : Codable {
    var name: String?
    var address: String?
}

class A: Codable {
    var name : String?
}

class B : A {
    var age : UInt?
}


class JSONViewController: WZBaseViewController {
    private let jsonStr1 =
            """
            {
                "name": "小明",
                "age": 24,
                "weight": 57.0,
                "weightStr" : "57.0",
                "sex": "secret",
                "school": {
                    "name": "XX市培英中学",
                    "address": "XX市白鹤洞啊"
                },
                "date" : 519751611.12542897,
            }
            """
    private let jsonStr2 : String = "[{\"name\": \"hangge\", \"age\": 100, \"phones\": [{\"name\": \"公司\",\"number\": \"123456\"}, {\"name\": \"家庭\",\"number\": \"001\"}]}, {\"name\": \"big boss\",\"age\": 1,\"phones\": [{ \"name\": \"公司\",\"number\": \"111111\"}]}]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false;
        JSONAnalysis()
        
        ///对象的编解码  直接用模型去编解码更方便 对象还要考虑继承的关系
        let b : B = B()
        b.name = "wizet"
        b.age = 24
        ///对对象的编码
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .secondsSince1970
        
        let data = try! encoder.encode(b)
        print(String(data: data, encoding: .utf8)!)
        
        let jsonDic = ["name":"wizet","age":24] as [String : Any]
        let jsonData = try! JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
        let decode = JSONDecoder()
        do {
            let employee = try decode.decode(B.self, from: jsonData)
            print("解析成功:\(employee)")//只解析了A的类型 需要在对象中自定义实现对象的编码  解码方法
        } catch  {
            print("解析失败:\(error)")
        }
    }
    
    private func JSONAnalysis() {
        JSONAnalysisWithSystemAPI()
        //使用系统的方法 貌似只有一个字段上的类型不匹配都会返回错误。要求后台数据匹配比较精准，用起来也算是方便
        
        JSONAnalysisWithThirdPartyAPI()
        //这个第三方的兼容性比较强吧，但是总是需要自己做类型检查，繁琐，简直了
    }
    
    // MARK: - 系统自带的解析JSON方式 JSON转自定义数据类型、自定义数据类型转为JSON
    private func JSONAnalysisWithSystemAPI() {
        //需要遵守Codable归解档协议
        //注意自定义类型上的键要与JSON上的键保持一致，也可以通过枚举遵守CodingKey完成自定义的键名
        //
        do {
            let jd  = JSONDecoder()
            ///处理浮点类型 正无穷 负无穷 和 nan 类型的策略
            jd.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "infinity", negativeInfinity: "-infinity", nan: "nan")///暂时没出现效果
            
            //缺点  如果有一个类型匹配错误的化就直接抛出错误
            let xiaoming = try jd.decode(XiaoMing.self, from: jsonStr1.data(using: .utf8)!)
            let xiaohong = try jd.decode(XiaoHong.self, from: jsonStr1.data(using: .utf8)!)
            
            print(Float(xiaoming.weightStr!)!)
            //XiaoMing的归档解档都不用自己写了.........😆
            //            print(xiaoming)
            
            // MARK: -  数据转JSON 常用于本地化
            let je = JSONEncoder()
            je.outputFormatting = .prettyPrinted
            let data = try je.encode(xiaohong)
            let json = String(data: data, encoding: .utf8)
            
            /* JSON 输出格式的
             compact //紧凑的类型  默认的类型
             prettyPrinted//优雅的类型
             */
            if json != nil {
                print(json!)
            }
            
          
            if xiaoming.date != nil {
                let dateFormatter = DateFormatter.init()
                dateFormatter.dateFormat = "MM/dd/yyyy"///http://nsdateformatter.com/ 一个查询时间格式的网站
                print(dateFormatter.string(from: xiaoming.date!))
            }
            
        } catch {
//            error.localizedDescription
            print(error);
            
        }
    }
    
    
    // MARK: - 使用的是 swiftJSON 第三方的库
    // JSON str -》 data -》 数组
    private func JSONAnalysisWithThirdPartyAPI() {
        if let jsonData = jsonStr2.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            ///旧的传统的 JSON解析方法， 得到的只能是字典或者是数组  需要不断地进行数据判断
            if let tmpArray = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) {
                //数组（字典）
                if ((tmpArray as? [[String :AnyObject /*字符或者数组*/]]) != nil) {///Dictionary<String , AnyObject>
                    print(String(describing: tmpArray));
                }
            }
            
            do {
                let json = try JSON(data: jsonData)   //JSON(data: jsonData)
                if let number = json[0]["phones"][0]["number"].string {
                    print(number)
                }
                if let number = json[10000].int {
                    print(number)
                }
            } catch {
                print(error)
            }
        }
    }
}



