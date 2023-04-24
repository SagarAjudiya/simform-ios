import UIKit

//Print Hello World in swift Play Ground
var helloWorld = "Hello World, Swift"

//Create variables of different types and print it
var myInt = 30
type(of: myInt)

var myDouble = 3.14
type(of: myDouble)

var myFloat: Float = 3.14
type(of: myFloat)

var myBoolean = true
type(of: myBoolean)

var myString = "Simform"
type(of: myString)

var myChar: Character = "S"
type(of: myChar)

var myArray: [Any] = [45, 123, 30, "451"]
type(of: myArray)

var myDictionart: [String : Any] = ["Name": "Sagar", "Company": "Simform", "Salary": 40000]
type(of: myDictionart)


//Create one integer and perform addition with 5 to that and print values

var num: Int = 30
num += 5

//There is one constant with value of interest rate (15%) create one playground for calculate interest for given amount and duration
let r = 15
let p = 10000
let n = 5

let i = (p * r * n)/100
    
//Create example for String concate using operators

let s1 = "Hello "
let s2 = "Simform"
let s3 = s1 + s2
    
//Create one example for show usage of operator's addition, multiplication, division for integers and floats

let n1 = 80
let n2 = 40
let n3: Float = 35.5

let sumInt = n1 + n2
let mulInt = n1 * n2
let divInt = n1 / n2

let sumFloat = Float(n1) + n3
let mulFloat = Float(n1) * n3
let divFloat = Float(n1) / n3

//What is turnery operator and show example of usage?

let marks = 73
let result = (marks >= 33) ? "pass" : "fail"


// String


//Write a Swift program to create a new string made of a copy of the first two characters of a given string. If the given string is shorter than length 2, return whatever there is.
//Input: “Simform”
//Output: “Si”

let str1 = "Simform"
if str1.count < 2 {
    print(str1)
}
else {
    print(str1.prefix(2))
}

//Write a Swift program to create a new string without the first and last character of a given string. The string length must be at least 2.
//Input: “Simform”
//Output: imfor

var str2 = "Simform"
str2.removeFirst()
str2.removeLast()
print(str2)
    

//Write a Swift program that accept two strings and return their concatenation, except the first char of each string. The given strings length must be at least 1.
//Input: "Swift", "Examples"
//Output: wiftxamples

let str3_1 = "Swift"
let str3_2 = "Examples"

if str3_1.count >= 1 && str3_2.count >= 1 {
    print(str3_1.dropFirst() + str3_2.dropFirst())
}

//Write a Swift program to test if a given string starts with "Sw".
//Input: Swift
//Output: true

let str4 = "Swift"
str4.hasPrefix("Sw")

//Write a Swift program to create a new string made of the first and last n chars from a given string. The string length will be at least n.
//Input: “Simform Solutions”, 3
//Output: Simons

let str5 = "Simform Solutions"
let num5 = 3

if str5.count >= num5 {
    print(str5.prefix(num5) + str5.suffix(num5))
}


// Array


//Write a Swift program to check whether the first element and the last element of a given array of integers are equal. The array length must be 1 or more.
//Input: [1,2,3,1]
//Output: true

var arr1 = [1, 2, 3, 1]
if arr1.count >= 1 {
    print(arr1.first == arr1.last)
}


//Write a Swift program to create a new array with double the length of a given array of integers and its last element is the same as the given array. The given array will be length 1 or more. By default, a new integer array contains all 0's.
//Input: [1,2,3,4]
//Output: [0,0,0,0,0,0,0,4]
var arr2_1 = [1, 2, 3, 4]
var arr2_2 = Array(repeating: 0, count: (arr2_1.count) * 2)
arr2_2[arr2_2.count-1] = arr2_1[arr2_1.count-1]
print(arr2_2)


//Write a Swift program to create a new array, taking first two elements from a given array of integers. If the length of the given array is less than 2 use the single element of the given array
//Input: [0,1,2,3]
//Output: [0,1]
var arr3_1 = [0, 1, 2, 3]
var arr3_2: [Int] = []
if arr3_1.isEmpty {
    print("Empty Array")
} else if arr3_1.count < 2 {
    arr3_2.append(arr3_1.startIndex)
    arr3_2.append(arr3_1.startIndex)
} else{
    arr3_2.append(arr3_1.startIndex)
    arr3_2.append(arr3_1[1])
}


//Write a Swift program to take one array and find out maximum number from that array
//Input: [0,50,100,20,80,150]
//Output: 150
var arr4 = [0, 50, 100, 20, 80, 150]
arr4.max()


//Write a Swift program to take one array and sort it in descending order.
//Input: [0,5,6,2,10]
//Output: [10,6,5,2,0]
var arr5 = [0, 5, 500 ,6, 2, 10]
arr5.sorted(by: >)

print("-----------------------------------")


//Print all the numbers from listOfNumbers that are divisible by at least one number from divisors
//Input: var listOfNumbers = [1, 2, 3, 10, 100]
//var divisors = [2, 5]
//Output: 2,10,100
var listOfNumbers = [1, 2, 3, 10, 100]
var divisors = [2, 5]

for i in listOfNumbers {
    for j in divisors {
        if i % j == 0 {
            print(i)
            break
        }
    }
}

print("-----------------------------------")


// Loops


//Print the powers of 2 that are less than or equal to N.
var loop1 = 100

// using for loop
for i in 1..<loop1 where(pow(2, i) <= 100) {
    print(pow(2,i))
}

// using while loop
//var power = 2
//while power <= 100{
//    print(power)
//    power = power * 2
//}

print("-----------------------------------")


//Given an integer N draw a square of N x N asterisks. Look at the examples
var loop2 = 3

for _ in 0..<loop2 {
    for _ in 0..<loop2 {
        print("*",terminator: "")
    }
    print("")
}

print("-----------------------------------")


//Given an integer N draw a triangle of asterisks. The triangle should have N lines, the i-th line should have i asterisks on it.
var loop3 = 4

for i in 1...4 {
    for _ in 1...i {
        print("*",terminator: "")
    }
    print("")
}

print("-----------------------------------")


//Given an integer N draw a pyramid of asterisks. The pyramid should have N lines. On the i-th line there should be N-i spaces followed by i*2-1 asterisks.
var loop5 = 4

// using stride method
//for i in 1...loop5{
//    for _ in stride(from: loop5, to: i, by: -1) {
//        print(" ",terminator: "")
//    }
//    for _ in 1...i*2-1{
//        print("*",terminator: "")
//    }
//print("")
//}
    
    
for i in 1...loop5 {
    for _ in 0...(loop5-i) {
      print(" ", terminator: "")
   }
    for _ in 1...2*i-1 {
      print("*", terminator: "")
   }
   print("")
}

print("-----------------------------------")


//You are given a number. Print "prime" if the number is a prime and "not prime" otherwise. A number is a prime if it has exactly 2 distinct divisors (1 and itself).
var loop6 = 17
var isPrime = true

for i in 2..<loop6 {
    if loop6 % i == 0{
        isPrime = false
        break
    }
}
print(isPrime ? "Prime Number" : "Not Prime Number")

print("-----------------------------------")



// Dictionaries:

// 1. You are given a dictionary code of type [String:String] which has values for all lowercase letters. The codedictionary represents a way to encode a message. For example if code["a"] = "z" and code["b"] = "x" the encoded version if "ababa" will be "zxzxz". You are also given a encodedMessage which contains only lowercase letters and spaces. Use the codedictionary to decode the message and print it. Write a Swift program to decode the message and print final output string
//Input:
//var code = [
//"a" : "b",
//"b" : "c",
//"c" : "d",
//"d" : "e",
//"e" : "f",
//"f" : "g",
//"g" : "h",
//"h" : "i",
//"i" : "j",
//"j" : "k",
//"k" : "l",
//"l" : "m",
//"m" : "n",
//"n" : "o",
//"o" : "p",
//"p" : "q",
//"q" : "r",
//"r" : "s",
//"s" : "t",
//"t" : "u",
//"u" : "v",
//"v" : "w",
//"w" : "x",
//"x" : "y",
//"y" : "z",
//"z" : "a"
//]
//var encodedMessage = "uijt nfttbhf jt ibse up sfbe"
//Output: "this message is hard to read”

var code = [
"a" : "b",
"b" : "c",
"c" : "d",
"d" : "e",
"e" : "f",
"f" : "g",
"g" : "h",
"h" : "i",
"i" : "j",
"j" : "k",
"k" : "l",
"l" : "m",
"m" : "n",
"n" : "o",
"o" : "p",
"p" : "q",
"q" : "r",
"r" : "s",
"s" : "t",
"t" : "u",
"u" : "v",
"v" : "w",
"w" : "x",
"x" : "y",
"y" : "z",
"z" : "a"
]
var encodedMessage = "uijt nfttbhf jt ibse up sfbe"
for char in encodedMessage{
    print(code[String(char)] ?? " ", terminator: "")
}

print("\n---------------------")

// 2. You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys "firstName” and “lastName”. Create an array of strings called firstNames that contains only the values for “firstName” from each dictionary.
//Input:
var people: [[String : String]]? = [
[
"firstName": "Calvin",
"lastName": "Newton"
],
[
"firstName": "Garry",
"lastName": "Mckenzie"
],
[
"firstName": "Leah",
"lastName": "Rivera"
],
[
"firstName": "Sonja",
"lastName": "Moreno"
],
[
"firstName": "Noel",
"lastName": "Bowen"
]
]

var firstNames : [String] = []

if let people {
    for person in people {
        if let fName = person["firstName"] {
            firstNames.append(fName)
        }
    }
}
    
print(firstNames)

print("---------------------")


// 3. You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. Create an array of strings called fullNames that contains the values for “firstName” and "lastName” from the dictionary separated by a space.
//Input:
//var people: [[String:String]] = [
//[
//"firstName": "Calvin",
//"lastName": "Newton"
//],
//[
//"firstName": "Garry",
//"lastName": "Mckenzie"
//],
//[
//"firstName": "Leah",
//"lastName": "Rivera"
//],
//[
//"firstName": "Sonja",
//"lastName": "Moreno"
//],
//[
//"firstName": "Noel",
//"lastName": "Bowen"
//]
//]
//Output:
//fullNames = ["Calvin Newton","Garry Mckenzie","Leah Rivera",
//"Sonja Moreno","Noel Bowen"]

var fullNames: [String] = []

if let people {
    for person in people {
        if let fName = person["firstName"], let lName = person["lastName"] {
            fullNames.append("\(fName) \(lName)")
        } else if let fName = person["firstName"] {
            fullNames.append(fName)
        }else if let lName = person["lastName"] {
            fullNames.append(lName)
        }
    }
}

print(fullNames)


print("---------------------")


// 4. You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Find the person with the lowest score and print his full name.
//Input:
var peopleOne: [[String : Any]]? = [
[
"firstName": "Calvin",
"lastName": "Newton",
"score": 13
],
[
"firstName": "Garry",
"lastName": "Mckenzie",
"score": 12
],
[
"firstName": "Leah",
"lastName": "Rivera",
"score": 10
],
[
"firstName": "Sonja",
"lastName": "Moreno",
"score": 3
],
[
"firstName": "Noel",
"lastName": "Bowen",
"score": 16
]
]

if var peopleOne {
    var score = peopleOne.first!["score"] as? Int ?? 0
    var nameOfLosser = "\(peopleOne.first?["firstName"] ?? "") \(peopleOne.first?["lastName"] ?? "")"
    for person in peopleOne {
        if score > person["score"] as? Int ?? 0 {
            score = person["score"] as? Int ?? 0
            nameOfLosser = "\(person["firstName"] ?? "") \(person["lastName"] ?? "")"
        }
    }
    print(nameOfLosser)
}

print("---------------------")


// 5. You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Print the leaderboard in the following format:
//1. full name - score
//2. ...
//...
//Input:
var peopleTwo: [[String : Any]]? = [
[
"firstName": "Calvin",
"lastName": "Newton",
"score": 13
],
[
"firstName": "Garry",
"lastName": "Mckenzie",
"score": 23
],
[
"firstName": "Leah",
"lastName": "Rivera",
"score": 10
],
[
"firstName": "Sonja",
"lastName": "Moreno",
"score": 3
],
[
"firstName": "Noel",
"lastName": "Bowen",
"score": 16
]
]
//Output:
//1. Garry Mckenzie - 23
//2. Noel Bowen - 16
//3. Calvin Newton - 13
//4. Leah Rivera - 10
//5. Sonja Moreno - 3

if var peopleTwo {
    peopleTwo.sort(by: { ($0["score"] as? Int ?? 0) > ($1["score"] as? Int ?? 0)})
    for index in peopleTwo {
        if let i1 = index["firstName"], let i2 = index["lastName"], let i3 = index["score"] {
            print("\(i1) \(i2) - \(i3)")
        }
    }
}

print("---------------------")


// 6. You are given an array of integers. Find out the frequency of each one.The frequency of a number is the number of times it appears in the array.Print the numbers in ascending order followed by their frequency.
//Input:
//var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
//Output:
//1 2
//2 6
//3 3
//4 1
//5 1

var numbers: [Int]? = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var countDictionary : [Int : Int] = [:]

if let numbers {
    for index in numbers.sorted() {
        if countDictionary.index(forKey: index) == nil {
            countDictionary[index] = 1
            continue
        }
        countDictionary[index]? += 1
    }
    for (key, value) in countDictionary.sorted(by: { $0.key < $1.key }) {
        print("\(key) \(value)")
    }
}

print("---------------------")

















// Optionals:

// 1. Create an example of demonstrating How to declare optionals in swift?
// Declaring a variable optional means variable can contain value of its type plus nil value also might be there
var exampleString : String?
exampleString = "This is Optional String"

print("---------------------")

// 2. What is force unwrapping in optionals show usage in example.
//Force Unwrapping (!) it states to compiler that the value is non-optional and is assured by the developer, and if value is optional than app will crash.
print(exampleString!)

print("---------------------")

// 3. Create one example of show usage of optional binding
// optional binding is way of checking if there is nil value with condition for making sure no crash occurs
if let exampleString = exampleString {
    print("There is value in example String as \"\(exampleString)\"")
}

print("---------------------")

// 4. Create one example using if-let
if let exampleString = exampleString {
    print("There is value in example String as \"\(exampleString)\"")
}

print("---------------------")

// 5. Create one example using guard-let
for _ in 0..<1 {
    guard let exampleString = exampleString else {
        print("There is no value in example String")
        break
    }
    print("There is value in example String as \"\(exampleString)\"")
}

print("---------------------")

// 6. Create one example using nil colloison operator
print("There is value in example String as \"\(exampleString ?? "default value")\"")


print("---------------------")














// The Basics

// 1. Breakfast
//You are working on a smart-fridge. The smart-fridge knows how old the eggs and bacon in it are. You know that eggs spoil after 3 weeks (21 days) and bacon after one week (7 days).
//Given baconAge and eggsAge(in days) determine if you can cook bacon and eggs or what ingredients you need to throw out.
//If you can cook bacon and eggs print you can cook bacon and eggs.
//If you need to throw out any ingredients for each one print a line with the text throw out <ingredient> (where <ingredient> is bacon or eggs) in any order.
//Input:
//var baconAge = 3
//var eggsAge = 2
//Output:
//you can cook bacon and eggs

var baconAge: Int? = 3
var eggsAge: Int? = 2

let baconAgeLimit = 7
let eggAgeLimit = 21

if baconAge ?? 0 > baconAgeLimit || eggsAge ?? 0 > eggAgeLimit {
    if baconAge ?? 0 > baconAgeLimit && eggsAge ?? 0 > eggAgeLimit {
        print("throw out eggs and bacon")
    } else if eggsAge ?? 0 > eggAgeLimit {
        print("throw out eggs")
    } else if baconAge ?? 0 > baconAgeLimit {
        print("throw out bacon")
    }
} else {
    print("You can cook bacon and eggs")
}

print("---------------------")

// 2. Leap Year
//You are given a year, determine if it’s a leap year. A leap year is a year containing an extra day. It has 366 days instead of the normal 365 days. The extra day is added in February, which has 29 days instead of the normal 28 days. Leap years occur every 4 years. 2012 was a leap year and 2016 will also be a leap year.
//The above rule is valid except that every 100 years special rules apply. Years that are divisible by 100 are not leap years if they are not also divisible by 400. For example 1900 was not a leap year, but 2000 was. Print Leap year! or Not a leap year! depending on the case.
//Input:
//var year = 2000
//Output:
//Leap year!

var year: Int? = 2000
if let year {
    if year % 4 == 0, year % 100 != 0 {
        print("Leap year!")
    } else if year % 400 == 0 {
        print("Leap year!")
    } else {
        print("Not a leap year!")
    }
}

print("---------------------")

// 3. Hitpoints
//You are working on a videogame where the character has a certain number of hitpoints(HP) ranging from 0 to 100.
// 100 represents full health
// 0 represents dead.
//You want to add regenerating health to the game using the following rules:
//HP always regenerates up to numbers of the form X0 (75 -> 80 , 32 -> 40 …)
//When HP is below 20 it regenerates up to 20 (13 -> 20, 5 -> 20, …)
//If the character has 0 HP then he doesn’t regenerate life (he’s dead)
//Given the current hp of the character stored in a variable hp print the hp the player will have after regenerating life.
//Input:
//var hp = 60
//Output:
//60

var hp: Int? = 60

if var hp {
    if hp == 0 {
        print("Player Dead!")
    } else if hp < 20 {
        hp = 20
    } else if hp % 10 != 0 {
        let remainder = hp % 10
        hp = hp - remainder + 10
    }
    print(hp)
}

print("---------------------")

// 4. Above average
//You are given three grades obtained by 3 students in a class stored in variables grade1, grade2, grade3 of type Double.
//You are also given your grade in the class stored in a variable yourGrade of type Double.
//Print above average if your grade is greater than the class average or below average” otherwise.
// Note: the average of the class includes your grade.
//Input:
var grade1: Double? = 7.0
var grade2: Double? = 9.0
var grade3: Double? = 5.0
var yourGrade: Double? = 8.0
//Output:
//"above average"

if let grade1, let grade2, let grade3, let yourGrade {
    var averageGrade = (grade1 + grade2 + grade3 + yourGrade) / 4
    if averageGrade < yourGrade {
        print("Above Average!")
    } else {
        print("below Average!")
    }
}

print("---------------------")

// 5. Tipping
//You have the cost of a meal at a restaurant stored in a variable mealCost of type Double.
//You would like to leave a tip of a certain percentage. The percentage is stored in a variable tip of type Int.
//Print the total cost of the meal.
//Input:
//var mealCost:Double = 3.5
//var tip:Int = 20
//Output:
//4.2

var mealCost: Double? = 3.5
var tip: Int? = 20

if let mealCost, let tip {
    var tipCost = (mealCost * Double(tip)) / 100
    var totalCost = tipCost + mealCost
    print("Total Cost of meal is: \(totalCost)")
}

print("---------------------")













// Practicals


// 1. Convert this to an Array of dictionary:

var companydata : String?
var userData : [String?] = [ "Shilpriya,shah,simform,ahmedabad", "Priyanshu,Desai,\(companydata),ahmedabad", "Sagar,Ajudiya,ahmedabad", "Rajan,Patel,ahmedabad" ]
var userDictionary : [[(String) : (String)]] = []
var arrayOfkeys = ["firstName", "lastName", "company", "city"]
for index in 0...userData.count-1 {
    if let data : [Substring] = userData[index]?.split(separator: ",") {
        
        var dictionary : [String : String] = [:]
        
        for dataIndex in 0..<data.count {
            if data[dataIndex] != "nil" {
                dictionary[arrayOfkeys[dataIndex]] = String(data[dataIndex])
            }
            else {
                dictionary[arrayOfkeys[dataIndex]] = ""
            }
        }
        userDictionary.append(dictionary)
    }
    
}

for user in userDictionary {
    print("FirstName: \(user["firstName"] ?? "")")
    print("LastName: \(user["lastName"] ?? "")")
    print("Company: \(user["company"] ?? "")")
    print("City: \(user["city"] ?? "")")
}
print(userDictionary)

// 2. Find starting index of word : e.g Simform Solutions first index of solutions

var stringTwo: String? = "Simform Solutions"
if let stringTwo {
    if let rangeOfmatch = stringTwo.firstRange(of: "Solutions") {
        let index = stringTwo.distance(from: stringTwo.startIndex, to: rangeOfmatch.lowerBound)
        print(stringTwo[rangeOfmatch.lowerBound..<rangeOfmatch.upperBound])
        stringTwo[rangeOfmatch.lowerBound]
    } else {
        print("String Doesn't contain substring")
    }
}

print("---------------------")


// 3. 10.50909 => “10.50”: get only two digit decimal value

var floatPresionValue : Double? = 10.98763456
print(String(format: "%.2f", floatPresionValue ?? 0.0))

print("---------------------")


// 4. Update Lorem with your name from below paragraph
var paragraph = "Lorem ipsum dolor sit amet. Sed nihil nemo et eius aperiam hic natus quidem sit impedit fuga et sint nostrum. Eum incidunt rerum quo adipisci laboriosam et amet magnam eos eligendi tempore. Qui eveniet similique vel alias itaque At placeat velit ea accusantium natus sed ipsa Lorem  obcaecati.In quod magnam non harum impedit est fugiat deserunt sit expedita repellat et dolores porro. Ea Quis optio est optio voluptatem et dolor excepturi. Id aperiam architecto qui magnam dolor sit voluptatibus placeat u Lorem t nostrum porro. Qui modi illo aut quia reprehenderit quo dolores voluptates?Non excepturi optio vel nobis quis est temporibus galisum eos placeat ipsam? Et molestiae similique aut reiciendis necessitatibus vel re Lorem iciendis quibusdam id iure pro Lorem  vident nam ipsam facilis 33 suscipit recusandae. Hic incidunt magni a officiis enim vel assumenda alias!"

paragraph.replacingOccurrences(of: "Lorem", with: "Sagar")
var myName = "Sagar"

for range in paragraph.ranges(of: "Lorem").reversed() {
    paragraph.replaceSubrange(range, with: myName)
}
print(paragraph)



var response: [String : Any?]? = [
        "page": 2,
        "per_page": 6,
        "total": 12,
        "total_pages": 2,
        "data": [
            [
                "id": 7,
                "email": "michael.lawson@reqres.in",
                "first_name": "Michael",
                "last_name": "Lawson",
                "avatar": "https://reqres.in/img/faces/7-image.jpg"
            ],
            [
                "id": 8,
                "email": "lindsay.ferguson@reqres.in",
                "first_name": "Lindsay",
                "last_name": "Ferguson",
                "avatar": "https://reqres.in/img/faces/8-image.jpg"
            ],
            [
                "id": 9,
                "email": "tobias.funke@reqres.in",
                "first_name": "Tobias",
                "last_name": "Funke",
                "avatar": "https://reqres.in/img/faces/10-image.jpg"
            ],
            [
                "id": 10,
                "email": "byron.fields@reqres.in",
                "first_name": "Byron",
                "last_name": "Fields",
                "avatar": "https://reqres.in/img/faces/10-image.jpg"
            ],
            [
                "id": 11,
                "email": "george.edwards@reqres.in",
                "first_name": nil,
                "last_name": "Edwards",
                "avatar": "https://reqres.in/img/faces/11-image.jpg"
            ],
            [
                "id": 12,
                "email": "rachel.howell@reqres.in",
                "first_name": "Rachel",
                "last_name": nil,
                "avatar": "https://reqres.in/img/faces/12-image.jpg"
            ]
        ],
        "support": [
            "url": "https://reqres.in/#support-heading",
            "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
        ]
]

//2. Print all user name
if let data = response?["data"] as? [Any?] {
//    print(data)
    for dataResponse in data {
        if let newResponse = dataResponse as? [String : Any?] {
            print(newResponse["first_name"] as? String ?? "")
        }
    }
}

//3. combine first_name and last name
if let data = response?["data"] as? [Any?] {
    for dataResponse in data {
        if let newResponse = dataResponse as? [String : Any?] {
            print("\(newResponse["first_name"] as? String ?? "") \(newResponse["last_name"] as? String ?? "")")
        }
    }
}

//4. print all user id and fullname who have even id
if let data = response?["data"] as? [Any?] {
    for dataResponse in data {
        if let newResponse = dataResponse as? [String : Any?], (newResponse["id"] as? Int ?? 0) % 2 == 0 {
            print("\(newResponse["id"] as? Int ?? 0) \(newResponse["first_name"] as? String ?? "") \(newResponse["last_name"] as? String ?? "")")
        }
    }
}
