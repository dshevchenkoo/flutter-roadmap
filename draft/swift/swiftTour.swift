import UIKit

var greeting = "Hello, playground"

// Комментирование
// Вывод в консоль
// Переменные
// Строки
// Типы данных
// Условные конструкции
// Арифметика -
// Определение и вызов функций
// Работа с логическими типами данных
// Циклы
// ООП

/// Вывод в консоль
print("Hello, world!")

/// Переменные
/// Use let to make a constant and var to make a variable

var myVariable = 42
myVariable = 50
let myConstant = 42

/// Переменная сама определяет тип, но редко когда мы пишем код без указания типов
let implicitInteger = 70
let explicitInteger: Int = 70

/// Пример с конвертацией данных
let label = "The width is "
let width = 55
let labelWithWidth = label + String(width)

///Строки
/// Помещаем переменную в строку, есть умное слово, которым называют такую операцию (вылетело из головы)
let a = 5
let b = 10
let textWithAB = "some \(a) text \(b)"

/// Тройные кавычки сохраняют отсупы текста
let moreText = """
some
\(a)
"text"
\(b)
"""

/// Типы данных
/// Массив и словарь (Map)
/// словарь в swift также как и в php выглядит - ассоциативный массив
var array = ["a", "b", "c"]
array[0] = "d"
print(array) // ["d", "b", "c"]

var map = [
    "a": "b",
    "c": "d",
    "e": "f",
]
map["a"] = "g"
print(map) // ["e": "f", "c": "d", "a": "g"]

/// Добавление в массив
array.append("e") // ["d", "b", "c", "e"]

/// Создание пустого массива  и словаря
/// с указанием типов
let emptyArray: [String] = []
let emptyMap: [String: Float] = [:]

/// без указания типов
/// (?): выдает ошибку Empty collection literal requires an explicit type хотя в доке пишут, что все ок - так можно
//let emptyArray2 = []
//let emptyMap2 = [:]

/// Условные конструкции
var test = 5
if test > 4 {
    print(1)
} else {
    print (2)
}

/// Свитчер
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
// Prints "Is it a spicy red pepper?»

/// Опциональный парметр (optional) или nullable type - тип котороый может быть либо null,
/// либо равнятся какой-нибудь переменной
var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"

var optionalName: String? = "John Appleseed"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

/// Циклы
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

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
// Prints "25"

/// Функции
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

/// именоване парметры устанавливаются по дефолту, чтобы убрать используем _
func greet(_ person: String, on day: String) -> String {
return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

// Функции могут принимать другие функции

/// Классы и объекты
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    // Конструктор
    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

/// Наследование
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test1 = Square(sideLength: 5.2, name: "my test square")
test1.area()
test1.simpleDescription()

/// Геттер и сеттер
class EquilateralTriangle: NamedShape {
var sideLength: Double = 0.0

init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 3
}

var perimeter: Double {
    get {
        return 3.0 * sideLength
    }
    set {
        sideLength = newValue / 3.0
    }
}

override func simpleDescription() -> String {
    return "An equilateral triangle with sides of length \(sideLength)."
}
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
// Prints "9.3"
triangle.perimeter = 9.9
print(triangle.sideLength)
// Prints "3.3000000000000003

///Enumerations and Structures
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

/// async/await
func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

/// Protocols (интерфейсы) and Extensions
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
// Prints "The number 7»

/// Error Handling
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

//do {
//    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
//    print(printerResponse)
//} catch {
//    print(error)
//}
// Prints "Job sent»

/// Generics
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

//Отрывок из книги
//The Swift Programming Language (Swift 5.7)
//Apple Inc.
//https://books.apple.com/ru/book/the-swift-programming-language-swift-5-7/id881256329
//Этот материал может быть защищен авторским правом.
