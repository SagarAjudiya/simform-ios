//: [Previous](@previous)

import Foundation


//Write swift program using enumerations to check week day from given number. Consider Monday as 1 and Sunday as 7. We can be able to get day name as string in short form (sun, mon,...) and same full name (Sunday, Monday...) by given number of the day.
//Example. It should return Monday or mon if I pass parameter 1 for get day name.

enum DayOfWeek: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
    
    static func dayName(num: Int) -> String {
        switch num {
        case Self.Monday.rawValue:
            print("Monday")
            return "Mon"
        case DayOfWeek.Tuesday.rawValue:
            print("Tuesday")
            return "Tues"
        case DayOfWeek.Wednesday.rawValue:
            print("Wednesday")
            return "Wed"
        case DayOfWeek.Thursday.rawValue:
            print("Thursday")
            return "Thur"
        case DayOfWeek.Friday.rawValue:
            print("Friday")
            return "Fri"
        case DayOfWeek.Saturday.rawValue:
            print("Saturday")
            return "Sat"
        case DayOfWeek.Sunday.rawValue:
            print("Sunday")
            return "Sun"
        default:
            print("Invalid")
            return "No Day Found"
        }
    }
}

var day = DayOfWeek.dayName(num: 7)
print(day)


// Create one enumeration program to return number of days in a month.

enum DayInMonth: String {
    case january, february, march, april, may, june, july, august, september, october, november, december
    
    static func dayMonth(month: String) -> Int {
        switch month {
        case DayInMonth.january.rawValue, DayInMonth.march.rawValue, DayInMonth.may.rawValue, DayInMonth.july.rawValue, DayInMonth.august.rawValue, DayInMonth.october.rawValue, DayInMonth.december.rawValue:
            return 31
        case DayInMonth.february.rawValue:
            return 28
        case DayInMonth.april.rawValue, DayInMonth.june.rawValue, DayInMonth.september.rawValue, DayInMonth.november.rawValue:
            return 30
        default:
            return 0
        }
    }
}

var dayInMonth = DayInMonth.dayMonth(month: "march")
print(dayInMonth)


//Write a swift program using enumerations to demonstrate Int enums.

enum Numbers: Int {
    case one = 1, two, three, four, five
}

print(Numbers.one.rawValue)


// Write a swift program to demonstrate string type enum.
// Write a swift program for enum with raw values.
//Create an enum with its rawValues of type String and show usage of .case to print value of case.

enum EnumOfString: String {
    case north = "North", west = "West", south = "South", east = "East"
}

print(EnumOfString.north)


//Write a swift program using enumerations to get all cases as an array with use of CaseIterable(Optional) and without use of CaseIterable(Mandatory).

enum Month: String, CaseIterable {
    case january, february, march, april, may, june, july, august, september, october, november, december
}

var monthArray: [String] = []

for i in Month.allCases {
    monthArray.append(i.rawValue)
}
print(monthArray)


//Write a swift program using enumerations for learn and demonsrate enum cases with parameters (Enum with associated values).

enum Student{
    case name(String)
    case grade(Int, Int, String)
    case department(String)
    case rollNumber(Int)
}

var student = Student.name("Sagar")
print(student)
print(Student.grade(6, 7, "A"))

