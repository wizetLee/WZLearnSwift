//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
let galaxy = "milky way 🐂";

let name = "wizet";
let price = 2;
let number = 3;
let age = 25;
let cookiePrice = "\(number) cookies: $\(price * number)"

let greeting = "greeting";
let longGreeting = greeting + "we are the world";
print(longGreeting);
let cafe1 = "Cafe\u{301}"
var cafe2 = "Café"
print(cafe1 == cafe2)

print(cafe1.characters.count);//字符串字符数目
print(Array(cafe1.characters));//字符串化为字符数组
print(cafe1.unicodeScalars.count);//区分unicode
print(cafe1.unicodeScalars.map{$0.value});

print(cafe1.utf8.count);
print(cafe1.utf16.count);
print(Array(cafe1.utf8));//C: 67， a:97 AC unicode transformation format 万国码、 序列
print(Array(cafe1.utf16));
print(cafe1);

let nscafe:NSString = cafe1 as NSString;
print(nscafe.length);
print("dsadasd", "dsadasd", "dsadasd", separator: ",", terminator: "dddd");
print(nscafe.character(at: nscafe.length - 1));//utf16

let cLenght = strlen(name);
print(cLenght);

let capitalA = "A"
print(capitalA.characters.count)
print(capitalA.unicodeScalars.count)
print(capitalA.utf16.count)
print(capitalA.utf8.count)
let flag = "🇵🇷"
print(flag.characters.count)
print(flag.unicodeScalars.count)
print(flag.utf16.count)
print(flag.utf8.count)
let flag2 = "";
flag2.isEmpty;//判断字符串是否为空
flag2.characters.count;
var sString:String;
sString = "dasd";
sString.append("ASDFGHJKL");
sString.lowercased();
sString.uppercased();

for c in sString.characters {
    print(c)
}

let newsString = sString.characters.index(of: "A");
let firsrSpace = sString.characters.index(after: newsString!)

 var strr = "All this happened, more or less."
 let afterSpace = strr.withMutableCharacters { chars -> String.CharacterView in
     if let i = chars.index(of: " ") {
         let result = chars.suffix(from: chars.index(after: i))
        chars.removeSubrange(i..<chars.endIndex)
         return result
     }
     return String.CharacterView()
 }

let boolean1 = strr.hasPrefix("A");
let boolean2 = strr.hasSuffix("A");
let booleanAAA = String("sadsadsa");




var responseMessages:Dictionary<Int, String> = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]

responseMessages.keys;
responseMessages.values;
responseMessages[200];
responseMessages[111] = "asdasddas";
responseMessages.isEmpty;
responseMessages.dropLast();
responseMessages.dropFirst();
responseMessages;
responseMessages.enumerated();
responseMessages = Dictionary();

var nearestStarNames = ["Proxima Centauri", "Alpha Centauri A", "Alpha Centauri B", "Barnard's Star", "Wolf 359"]
var nearestStarDistances = [4.24, 4.37, 4.37, 5.96, 7.78]

nearestStarNames.count
nearestStarNames[0]
nearestStarNames.first
nearestStarNames.last

nearestStarNames.append("sdasd");
nearestStarDistances.append(3.144);

String(describing: booleanAAA)

let width = 19;
let widthStr = "\(width)";

var shoppingList : Array<String> = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var emptyDictionary: Dictionary<String,Float> = [String: Float]()
emptyDictionary = [:]

var emptyArray : Array<String> = [String]()
emptyArray = []


for score in emptyArray {
    print("%@", score);
}


let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
    

}
print(teamScore)


var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
optionalName = nil
var greeting2 = "eeeeeHello!"
if let nameqqqq = optionalName {
    greeting2 = "Hello, \(nameqqqq)"
}

let nickName: String? = nil
let fullName: String? = nil
let fullName2 : String! = "wizet"
let informalGreeting = "Hi \((nickName ?? fullName) ?? fullName2)"

let interestingNumbers: Dictionary! = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var currentKind : String! = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            currentKind = kind
        }
    }
}

while 1 < 0 {
    print("1 < 0")
}

repeat {
    print("i < 0")
} while (1 < 0)

var total1 = 0
for i in 0..<4 {
    total1 += i//0 + 1 + 2 + 3
}
print(total1)


func greet(自定义标签 person: String!,_ day: String!) -> String {
    return "Hello \(person), today is \(day)."
}
var str4 : String! = "Sunday"
greet(自定义标签:"Bob", str4)


//计算sam

/// 计算数组和
///
/// - Parameter scores: 数组
/// - Returns: 元组 最大值 最小值 和
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9, 99])
print(statistics.sum)
print(statistics.1);



func sumOf(numbers: Int...) -> Int {
    var sum = 0
    
    func sumSub(_ tmp :Int ,_ arr :Array<Int> ) {
        
    }
    
    sumSub( 1, numbers)
    
    for tmp in numbers {
        sum += tmp
    }
    return sum
}

//sumOf()
//sumOf(numbers: 42, 597, 12)

var numbers = [20, 19, 7, 12]
let mappedNumbers0 = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(mappedNumbers0)

//如果清楚类型的化可以 闭包简写
let mappedNumbers = numbers.map({ number in 3 * number })

print(mappedNumbers)



//let sortedNumbers = numbers.sort { $0 > $1 }
//print(sortedNumbers)
//创建类的时候并不需要一个标准的根类，所以你可以忽略父类。
class WizetClass  {
    
    let  age : Int = 24;
    func speak() -> () {
        print("Hello World");
    }
    let sex : String! = "male";
    
    func speakSomething(_ something : String!) -> () {
        if something != nil {
            print("\(something)");
        } else {
            print("nothing to say")
        }
    }
    var somethingToSay : String?;
   
    
    //自定义构造函数
    init() {
        
    }
    
    init(STS : String?) {
        somethingToSay = STS;
    }
    
    deinit {
        
        //在删除对象之前做一些清理工作
    }
    
}

class WizetClass2 : WizetClass {
    override init() {
        super.init()
        print("我是 WizetClass2");
    }
    var name : String! = "wizet"
   
    
    //settter 和 getter 方法
    var perimeter: Double {
        get {
            return 3.0 * self.perimeter
        }
        //默认的setter参数名是newValue
//        set {
//            self.perimeter = newValue / 3.0
//        }
        //自定义setter函数的参数名
        set(value) {
            self.perimeter = value / 3.0
        }
        
//        willSet {
//            
//        }
//        
//        didSet {
//            
//        }
    }
    
}


let wizetInstance : WizetClass = WizetClass2.init();
WizetClass().speak();
wizetInstance.speakSomething("I had to say something")
wizetInstance.age
wizetInstance.sex



enum Rank: Int {
    case Ace = 1
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
let aceRawValue = ace.rawValue
/*
    rawValue属性来访问一个枚举成员的原始值。
 */


enum ServerResponse {
    case Result(String, String)//Result（） 和Failure（）并非函数  而只是一个类类型。。。。
    case Failure(String)
    
    func aaaaaa(enumParameter : ServerResponse , parameter1 : String!, parameter2 : String!) -> String {
        switch enumParameter {
        case let .Result(parameter1, parameter2):
            let serverResponse = "Sunrise is at \(parameter1) and sunset is at \(parameter2)."
            return serverResponse;
        case let .Failure(parameter1):
            return "Failure...  \(parameter1)";
        }
    }
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Failure("Out of cheese.")

switch failure {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Failure(message):
    print("Failure...  \(message)")
}

protocol ExampleProtocol {//可多态扩展
    var simpleDescription: String { get }
    mutating func adjust();//mutating 突变 mutating 关键字用来标记这是一个可以修改结构体的方法(可修改结构体的初始值等等)
}

class SimpleClass: ExampleProtocol {
   

    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()

let aDescription = a.simpleDescription


struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}


//使用extension来为现有的类型添加功能，比如新的方法和计算属性。
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

var zero : Int = 1;
zero.adjust()
zero.simpleDescription;
//你可以像使用其他命名类型一样使用协议名——例如，创建一个有不同类型但是都实现一个协议的对象集合。当你处理类型是协议的值时，协议外定义的方法不可用。
var protocolValue: ExampleProtocol = zero
protocolValue.adjust();
(zero as Int);

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

///错误处理 Error 协议
//抛出异常
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    
        defer {//执行在  print("what the hell2"); 之后
            print("what the hell");
        }//defer代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执行。 类比于finally
        print("what the hell2");
   
    
    return "Job sent"
}

//try catch  演变为  do catch   且可以  do catch Error.a  catch Error.b.... 等
//finally 类演变为 defer， 不同之处在于 defer 可以在任何地方写入，而不必在do catch 之后使用，且defer表示函数返回前，函数最后执行的代码

//捕捉异常
do {
//    throw PrinterError.onFire;
    // let aTry = try? send(job: 1, toPrinter: "sdasd");
    let aTry = try send(job: 1, toPrinter: "sdasd");
} catch PrinterError.noToner {
    
} catch {
   print(error);
}

//泛型
func repeatItem<Item/**/>(repeating item: Item/**/, numberOfTimes: Int) -> [Item/**/] {
    var result = [Item]()//可变数组初始化， Item直接就是类型
//    let result2 = ["Str"]();//会自定转类型？？？？
//    let result3 = [String]();//会自定转类型？？？？
    
    for _ in 0..<numberOfTimes {//  _ 省略， numberOfTime
        result.append(item)
    }
    return result
}
repeatItem(repeating: "Nike", numberOfTimes:4)


//在类型名后面使用where来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类。

func anyCommonElements<T: Sequence/*限定实现这个协议的对象*/, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])

//<T: Equatable>和<T> ... where T: Equatable>是等价的。
let nine = 9;

let ten = 10.0;
let eleven : Float = 11;
let `let` : Int = 2;

let twelve : Int64 = 11;
twelve.distance(to: 2)
twelve.advanced(by: 1);
Int64.max
Int32.max

let aTuple : (String, Int) = ("sadads", 1);
let possibleNumber = "dd"
let convertedNumber = Int(possibleNumber)

var optiona : String? = nil;
let optiona2 = optiona;

let saaaa : String? = nil;

assert(true);




