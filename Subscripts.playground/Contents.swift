import UIKit

struct subexample {
    let decrementer: Int
    subscript(index: Int) -> Int {
        return decrementer / index
    }
}

let division = subexample(decrementer: 100)

print("Number is divisible by \(division[10]) times")


class daysOfWeek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "saturday"]
    
    subscript(index: Int) -> String {
        get {
            return days[index]
        }

    }
}

var dayInWeek = daysOfWeek()

print(dayInWeek[0])
print(dayInWeek[1])
print(dayInWeek[2])


// options in subscript
 
// single to multiple input parameters, any type
// also use variable and variadic parameters
//Subscripts cannot provide default parameter values or use any in-out parameters.

struct Matrix {
    let rows: Int, columns: Int
    var print: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        print = Array(repeating: 0.0, count: rows * columns)
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
           return print[(row * columns) + column]
        }
        set {
           print[(row * columns) + column] = newValue
        }
    }
}

var mat = Matrix(rows: 3, columns: 3)
print(mat.print)

mat[0,0] = 1.0
mat[0,1] = 2.0
mat[1,0] = 3.0
mat[1,1] = 5.0
print(mat.print)


struct Timestable {
    let multipler: Int
    
    subscript (number: Int) -> Int {
        return number * multipler
    }
}

let sevenTimetable = Timestable(multipler: 7)
print(sevenTimetable[1])
print(sevenTimetable[2])
print(sevenTimetable[3])



// type subscript

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n) ?? .mars
    }
}

let mars = Planet[4]
print(mars)



let contacts = [
    "Arthur Dent": [
        "address": [
            "street": "Infinite Drive 101",
            "postcode": "ABCD12",
            "city": "London" ],
        "planet": "Sector ZZ9 Plural Z Alpha",
        "designation": "Mostly Harmless",
        "phone": "+1 1234 56 7890"
    ]
]

let street = contacts["Arthur Dent"]!["address"]
print(street as Any)



