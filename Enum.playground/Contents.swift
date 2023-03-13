import UIKit

enum CompassPoint : CaseIterable{
    case north
    case south
    case east
    case west
}
let direction = CompassPoint.allCases.count

var directionToHead = CompassPoint.south

switch directionToHead {
case .north :
    print("North")
case .south :
    print("South")
case .east :
    print("East")
case .west :
    print("West")
}

enum DayInWeek: String {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

print(DayInWeek.sunday.rawValue)

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
for i in Beverage.allCases {
    print(i)
}


enum Barcode {
    case upc (Int, Int, Int, Int)
    case qrCode (String)
}

var productBarcode = Barcode.upc(8, 52346, 45855, 3)
print(productBarcode)
productBarcode = .qrCode("FHRUEHUBVUWEHFUHWE")
print(productBarcode)

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

//If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the case name, for brevity:

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthOrder = Planet.earth.rawValue

let positiontoFind = 3
if let somePlanet = Planet(rawValue: positiontoFind) {
    switch somePlanet {
    case .earth:
        print("Earth")
    default:
        print("Default Case")
    }
}
else {
    print("No planet at position \(positiontoFind)")
}


// Raw value
enum Size : Int {
  case small = 10
  case medium = 12
  case large = 14
}

var result = Size.small.rawValue
print(result)


// Associated value
enum Laptop {
  case name(String)
  case price(Int)
}

var brand = Laptop.name("Dell")
print(brand)

var offer = Laptop.price(1599)
print(offer)


enum Marks {
  case gpa(Double, Double, Double)
  case grade(String, String, String)
}

var marks1 = Marks.gpa(3.6, 2.9, 3.8)
print(marks1)

var marks2 = Marks.grade("A", "B", "C")
print(marks2)


// Names Associated Value
enum Pizza {
    case small (inches: Int)
    case medium (inches: Int)
    case large (inches: Int)
}

let pizza1 = Pizza.medium(inches: 12)
print(pizza1)































class xyz {

}

var a = xyz()

var arr2: [Any?] = []
arr2.append(2)
arr2.append("dsub")
arr2.append(63.89)
arr2.append(Int(57.76))
arr2.append(xyz())


var dictUser: [String : Any] = [:]
dictUser["name"] = "abc"
dictUser["age"] = 20
dictUser["history"] = arr2


var arr1: [Any?] = []
arr1.append(2)
arr1.append("dsub")
arr1.append(63.89)
arr1.append(Int(57.76))
arr1.append(xyz())
arr1.append(dictUser)


for element in arr1 {
    if let dict = element as? [String : Any] {
        print(dict)
        
        if let valueOfkey = dict["history"] as? [Any?] {
            print(valueOfkey)
            
            for index in valueOfkey {
                if let num = index as? Int {
                    print("Int \(num)")
                } else if let str = index as? String {
                    print("String \(str)")
                } else if let dbl = index as? Double {
                    print("Double \(dbl)")
                }
            }
        }
    }
}

var str = "Sagar"

var newStr = str.firstIndex(of: "g")

if let newStr {
    str.replaceSubrange(newStr...newStr, with: "h")
//    str.replace("r", with: "d")
}

if let range = str.firstRange(of: "a") {
    str.replacingCharacters(in: range, with: "d")
}

str.replacingOccurrences(of: "a", with: "z")


let myNum: Int
myNum = 1000
print(myNum)




var dict: [String : Any] = [:]
dict["name"] = "Sagar"





//for value in arr1 {
//    if let val = value as? [String : Any] {
////        print(val)
//        if let val1 = val["history"] as? [Any] {
//            print(val1)
//
//            for i in val1 {
//                if let a = i as? Int {
//                    print("Int \(a)")
//                } else if let str = i as? String {
//                    print("String \(str)")
//                } else if let dub = i as? Double {
//                    print("Double \(dub)")
//                } else if let classs = i as? xyz {
//                    print("Class \(classs)")
//                }
//            }
//        }
//    }
//}

 
