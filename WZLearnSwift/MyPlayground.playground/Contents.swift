//: Playground - noun: a place where people can play

import UIKit

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



