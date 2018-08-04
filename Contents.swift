//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
let three = 3

typealias newType = UInt16
newType.max
newType.min

let http404Error = (404, "Not Found")
http404Error.0
http404Error.1

var serverResponseCode: Int? = 404
serverResponseCode = nil

if serverResponseCode != nil {
    print("\(serverResponseCode!)")
}

if let firstNumber = Int("30") {
    if let secondNumber = Int("50") {
        if firstNumber < secondNumber && secondNumber < 100 {
            
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

// throws
func canThrowAnError() throws {
    
}

do {
    try canThrowAnError()
} catch {
    
}

// nil coalescing operator (空合运算符)
let defaultColorName = "red"
var userDefindColorName: String?

var colorNameToUser = userDefindColorName ?? defaultColorName

// 区间运算符
for index in 1...5 { // 1..<5
    print("\(index) * 5 = \(index * 5)")
}

var empty = ""
var anotherEmptyString = String()
if empty.isEmpty && anotherEmptyString.isEmpty {
    print("Nothing to see here")
}

let string1 = "hello"
//string1 = "world" // 不能进行更改

string1.startIndex

string1[string1.startIndex]
string1[string1.index(before: string1.endIndex)]
string1[string1.index(after: string1.startIndex)]
string1[string1.index(string1.startIndex, offsetBy:1)]

string1.indices // 0...string1.count

string1.hasPrefix("11")
string1.hasSuffix("o")

// 集合: array, set, dict
var fourDoubles = Array(repeating: 1.0, count: 4)
fourDoubles.append(1.2)
fourDoubles.insert(3, at: 4)
print(fourDoubles)

for (index, value) in fourDoubles.enumerated() {
    print("\(index): \(value)")
}

var letters = Set<Character>()
letters.insert("j")
letters.insert("h")
print(letters)

for letter in letters.sorted() {
    print("\(letter)")
}

letters.remove("b")
letters.removeAll()

var namesOfIntegers = [Int: String]()
namesOfIntegers[15] = "fifteen"
namesOfIntegers[16] = "fifteen"
namesOfIntegers[17] = "fifteen"
namesOfIntegers

//namesOfIntegers = [:]
namesOfIntegers

print("-----------------")

for dict in namesOfIntegers {
    print("\(dict.key),\(dict.value)")
}

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    
    // 做判断nil处理,返回可选元祖
    if array.isEmpty {
        return nil
    }
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let array = [1, 5, 5, 6, 2, 0]
minMax(array: [])

func arithmeticMean(_ numbers: Double...) -> Double {
    
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1.0, 3.0)


func swapTwoInts(_ a: inout Int,_ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 5
swapTwoInts(&someInt, &anotherInt)
someInt
anotherInt

var mathfunc: (Double...) -> Double = arithmeticMean
mathfunc(1, 4)

let names = ["lihua", "wangwu", "fangfang"]
let namesResults = names.sorted { $0 < $1 }
namesResults

// 闭包表达式
let digitNames = [0: "zero", 1: "one", 2: "two", 3: "three", 4: "four",
                  5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine"]
let numbers = [16, 35, 234]

// 闭包是引用类型
let strings = numbers.map { (number) -> String in
    var number = number
    var outpunt = ""
    repeat {
        outpunt = digitNames[number % 10]! + outpunt
        number /= 10
    } while number > 0
    return outpunt
}

// 枚举
enum CompassPoint {
    case north
    case south
    case east
    case west
}
CompassPoint.north // rawvalue

var directionToHead = CompassPoint.west
directionToHead = .east
switch directionToHead {
    case .north:
        print("\(directionToHead)")
    case .south:
        print("\(directionToHead)")
    case .east:
        print("\(directionToHead)")
    case .west:
        print("\(directionToHead)")
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrc(String)
}
var productBarcode = Barcode.upc(10, 10, 23, 32)
productBarcode = .qrc("23423423r3242fdadfa")

//switch productBarcode {
//    case .upc(let num1, let num2, let num3, let num4)
//        print("\(num1) + \(num2) + \(num3) + \(num4)")
//    case .qrc(let code)
//        print("\(code)")
//}

struct Resolution {
    var width = 0
    var height = 0 // 存储属性
    var center: Double { // 计算属性
        get {
            return Double(width + height) / 2.0
        }
        set {
            width = Int(newValue * 2.0) - 2
            height = Int(newValue * 2.0) - 10
        }
    }
    var totalSteps: Int = 0 { //属性观察器
        willSet(newValue) {
            print("\(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("yes")
            }
            
        }
    }
    
    subscript(index: Int) -> Int {
        get { // 如果为只读,可以直接省略get关键字
            return width * index
        }
        set/*(newValue)*/ {
            
        }
    }
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// 枚举和结构体都是值类型.整数,浮点,string,array,dict均为值类型
// 类为引用类型
let someResolution = Resolution(width: 3, height: 3, totalSteps: 4)
let someVideoMode = VideoMode()
someVideoMode.resolution.width = 4

// 存储属性: struct, class
// 计算属性: sturct, class, enum

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
//    convenience init() {
//        self.init()
//    }
}
final class Bicycle: Vehicle {
    var hasBasket = false
    var gear = 0
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
    override var description: String {
        return super.description + "has\(hasBasket)"
    }
    override func makeNoise() {
        print("Bicycle no noise")
    }
    required override init() { // 加上required关键字,
        print("ovverrid")
    }
//    convenience init() {
//        self.init()
//    }
    deinit {
    
    }
}

// arc
class Person {
    let name: String
    weak var card: CreditCard?
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    var person: Person?
    init(number: UInt64) {
        self.number = number
        print("\(number) is being initialized")
    }
    deinit {
        print("card\(number) is being deinitialized")
    }
}

class Apartment {
    let unit: UInt16
    var person: Person2?
    init(unit: UInt16) {
        self.unit = unit
        print("\(unit) is being initialized")
    }
    deinit {
        print("\(unit) is being deinitialized")
    }
}

class Person2 {
    let name: String
    unowned let apart: Apartment
    init(name: String, apart: Apartment) {
        self.name = name
        self.apart = apart
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?
var personApartRef: Person2?

var cardReference: CreditCard?
var apartReference: Apartment?

// weak
reference1 = Person(name: "liming")
cardReference = CreditCard(number: 20)
reference1?.card = cardReference
cardReference?.person = reference1
cardReference = nil

// unowned
apartReference = Apartment(unit: 234)
personApartRef = Person2(name: "24", apart: apartReference!)
apartReference?.person = personApartRef
apartReference = nil
personApartRef = nil

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

print("==========didi=========")
class Country {
    let name: String
    var capitalCity: City?
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var country: Country? = Country(name: "China", capitalName:"Beijing")
country?.capitalCity?.name
country = nil

// 闭包引起的强引用
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var heading: HTMLElement? = HTMLElement(name: "h1")
let defaultText = "some default text"
//heading.asHTML = {
//    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
//}
print(heading!.asHTML())
heading = nil

// throwing
func canThrowErrors() throws -> String {
    return "error"
}

func somethingFunction() throws -> Int {
    return 2
}
let x = try? somethingFunction()
let y: Int?
do {
    y = try somethingFunction()
} catch {
    y = nil
}

enum VendingMachineError: Error {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        //
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        guard item.count > 0  else {
            throw VendingMachineError.OutOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
    }
}

func buySnack(person: String, vendingMachine: VendingMachine) throws {
    try vendingMachine.vend(itemNamed: person)
}

var vendMachine = VendingMachine()
do {
   try buySnack(person: "heeh", vendingMachine: vendMachine)
} catch VendingMachineError.InvalidSelection {
    print("invalid selection")
} catch VendingMachineError.OutOfStock {
    print("out of stock")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("insufficient funds\(coinsNeeded)")
}

func fetchDataFromDisk() throws -> Data? {
    return nil
}

func fetchDataFromServer() throws -> Data? {
    return Data()
}

func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data}
    if let data = try? fetchDataFromServer() {return data}
    return nil
}

// Extensions
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
let defuult = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 4.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - size.width / 2.0
        let originY = center.y - size.height / 2.0
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    mutating func square() {
        self = self * self
        print("\(self)")
    }
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
    enum Kind {
        case Negative
        case Zero
        case Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

Rect(center: Point(x: 4.0, y: 6.0), size: Size(width: 2, height: 6))
3.repetitions {
    print("Hello world")
}

var threeInt = 3
threeInt.square()
123456[0]
123456[6] // 如果越界,则返回0
3.kind
0.kind
(-5).kind

// Protocol: 类, 结构体, 枚举
Protocol SomeProtocol {
    var mustBeSettable: Int { get set}
    var doesNotNeedToBeSettable: Int { get }
}









