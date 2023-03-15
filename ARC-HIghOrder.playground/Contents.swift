import Cocoa

// ARC reference
class Traveler {
    var name: String
    var account: Account?
    
    init(name: String) {
        self.name = name
    }
    
    func printSummary() {
        if let account = account {
            print("\(name) has \(account.points) points")
        }
    }
    
    deinit {
        print("\(name) is deinitialize")
    }
}

class Account {
    weak var traveler: Traveler?
    var points: Int
    
    init(traveler: Traveler, points: Int) {
        self.traveler = traveler
        self.points = points
    }
}

func test() {
    let traveler = Traveler(name: "Sagar")
    let account = Account(traveler: traveler, points: 100)
    traveler.account = account
    traveler.printSummary()
    print("Done..!!")
}

test()



class TravelerOne {
    var nameOne: String
    var accountOne: AccountOne?
    
    init(nameOne: String) {
        self.nameOne = nameOne
    }
    
    func printSummary() {
        if let accountOne = accountOne {
            print("\(nameOne) has \(accountOne.pointsOne) points")
        }
    }
    
    deinit {
        print("\(nameOne) is deinitialize")
    }
}

class AccountOne {
    unowned var travelerOne: TravelerOne
    var pointsOne: Int
    
    init(travelerOne: TravelerOne, pointsOne: Int) {
        self.travelerOne = travelerOne
        self.pointsOne = pointsOne
    }
}


var travelerOne: TravelerOne? = TravelerOne(nameOne: "One")
var accountOne: AccountOne?
if let travelerOne {
    accountOne = AccountOne(travelerOne: travelerOne, pointsOne: 200)
    travelerOne.accountOne = accountOne
    travelerOne.printSummary()
    print("Done..!!")
}
travelerOne = nil
print(accountOne?.travelerOne)




// Higher Order Function

// forEach
let numbersInWord = ["One", "Two", "Three", "Four", "Five", "Six"]
numbersInWord.forEach { element in
    print(element)
}

let numbersEach = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]
numbersEach.forEach { num in
    num.isMultiple(of: 2) ? print("\(num) is even") : print("\(num) is odd")
}

let numbersWithNil = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]
 
for number in numbersWithNil {
    guard let number = number else {
        print("Found nil")
        continue
    }
    print("The double of \(number) is \(number * 2)")
}


// map
let numbers = [1, 2, 3, 4, 5, 6, 7]
let numInStr = numbers.map { num in
    String(num)
}
print(numInStr)

let numDOuble = numbers.map { num in
    num * 2
}
print(numDOuble)

let upperCase = numbersInWord.map { element in
    element.uppercased()
}
print(upperCase)

let lowerCase = numbersInWord.map { $0.lowercased()}
print(lowerCase)

var info = [String: String]()
info["name"] = "andrew"
info["city"] = "berlin"
info["job"] = "developer"
info["hobby"] = "computer games"

let key = info.map { $0.key }.sorted(by: <)
print(key)
type(of: key)
let value = info.map { $0.value.capitalized }
print(value)

// compactMap
let numbersInString = ["1", "x2", "3", "4", nil, "five5"]
type(of: numbersInString)

let validNum = numbersInString.compactMap { value in
    Int(value ?? "" )
}
print(validNum)

let numbersWithNil1 = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]
let doubleNum = numbersWithNil1.compactMap { num in
    num != nil ? num : num
}
print(doubleNum)


// flatMap
let marks = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]

var allMark = marks.flatMap { mark -> [Int] in
    mark
}.sorted(by: >)
print(allMark)

//let allMark = marks.flatMap({$0})
//print(allMark)

let valuesWithNil = [[2, nil, 5], [4, 3, nil], [nil, nil, 1]]
let result = valuesWithNil.flatMap({$0})
print(result)


// filter

let numbersFilter = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

let numGreat = numbersFilter.filter { num in
    num > 10
}.sorted(by: <)
print(numGreat)

let over15 = numbersFilter.filter{$0 > 15}
print(over15.count)


class Tester {
    var name: String
    var age: Int
 
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
 
let testers = [Tester(name: "John", age: 23), Tester(name: "Lucy", age: 25), Tester(name: "Tom", age: 32), Tester(name: "Mike", age: 29), Tester(name: "Hellen", age: 19), Tester(name: "Jim", age: 35)]

let testAns = testers.filter({ $0.name.prefix(1) == "J" && $0.age >= 30})
print(testAns[0].name, testAns[0].age)


// reduce
let numberReduce = [5, 3, 8, 4, 2]
let ansReduce = numberReduce.reduce(8) {(parRes,num) -> Int in
    parRes + num
}
print(ansReduce)

let ansReduce1 = numberReduce.reduce(1, {$0 + $1})
print(ansReduce1)

let ansReduce2 = numberReduce.reduce(1, *)
print(ansReduce2)


let friendsAndMoney = ["Alex": 150.00, "Tim": 62.50, "Alice": 79.80, "Jane": 102.00, "Bob": 94.20]
let allMoney = friendsAndMoney.reduce(0, {$0 + $1.value})
print(allMoney)


// contains

let numContains = [5, 3, 8, 4, 2]
let lessFive = numContains.contains{$0 < 5}
print(lessFive)

let temperatures = ["London": 7, "Athens": 14, "New York": 15, "Cairo": 19, "Sydney": 28]
let highTemp = temperatures.contains(where: {$0.value > 30})
print(highTemp)


// removeAll
var numRemove = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]
numRemove.removeAll(where: {$0 > 15})
print(numRemove)


// sorted
let toSort = [5, 3, 8, 2, 10]

let sorted = toSort.sorted()
print(sorted)


// split

let message = "Hello Simform"

let resultMsg =  message.split(separator: " ")
type(of: resultMsg)
print(resultMsg)
let resMsg = message.split{$0 == " "}
print(resMsg)

let anotherMessage = "This message is going to be broken in pieces!"

let splitOne = anotherMessage.split(maxSplits: 2, whereSeparator: {$0 == " " })
print(splitOne)

let anotherMessage1 = "This message is going to    be broken in pieces!"
let emptySeq = anotherMessage1.split(omittingEmptySubsequences: false, whereSeparator: {$0 == " "})
print(emptySeq)
type(of: emptySeq)

let allString =  emptySeq.map({String($0)})
print(allString)
type(of: allString)

let paragraph = "This paragraph will be separated in parts. Based on the periods and the exclamation mark! There will be three strings!"

let paraSplit = paragraph.split{
    $0 == "." || $0 == "!"
}
print(paraSplit)
