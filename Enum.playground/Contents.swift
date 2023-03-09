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

for value in arr1 {
    if let val = value as? [String : Any] {
//        print(val)
        if let val1 = val["history"] as? [Any] {
            print(val1)

            for i in val1 {
                if let a = i as? Int {
                    print("Int \(a)")
                } else if let str = i as? String {
                    print("String \(str)")
                }else if let dub = i as? Double {
                    print("Double \(dub)")
                }else if let classs = i as? xyz {
                    print("Class \(classs)")
                }
            }
        }
    }
}

 
