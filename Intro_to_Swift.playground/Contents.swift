//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// ... this is what you see when you create a new Playground in Xcode (leaving it here as example)


//: Intro to Swift - the Basics
// Playground content drawn heavily from https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/GuidedTour.html

// Another nice quick reference (ebook) can be found at https://www.gitbook.com/book/mhm5000/swift-cheat-sheet/details

//////////////
//  BASICS  //
//////////////
var myVariable = 42
myVariable = 50
let myConstant = 42
// myConstant = 43

//** Data types **//
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//** Mixing data types **//
let label = "The width is "
let width = 94
// let widthLabel = label + width
 let widthLabel = label + String(width)

//** There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (\) before the parentheses **//
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."


//** Arrays **//
var shoppingList = ["catfish", "beer", "ice cream"]
shoppingList[1] = "bottled water"
shoppingList
shoppingList.count
shoppingList.isEmpty
shoppingList.append("garlic")
// shoppingList.append(3.14159)

var hardwareStoreList = ["nails", "blue paint", "bottled water"]
var combinedList = shoppingList + hardwareStoreList
combinedList
// var intersectList = shoppingList - hardwareStoreList

//** Mixed data types will work in playground, but not compile properly in project **//
var pocketContents = ["lint", "keys", 3.14159, 42, true, "phone"]
pocketContents[0]
pocketContents[3]

shoppingList.description
combinedList.removeLast()
combinedList
combinedList.removeAll()
combinedList = shoppingList + hardwareStoreList
combinedList.removeAtIndex(6)


//** Dictionaries **//
var occupations = [
  "Malcolm": "Captain",
  "Kaylee": "Mechanic",
]     // note the trailing comma is allowed; not a syntax error

occupations["Jayne"] = "Public Relations"
occupations
occupations["Kaylee"]

occupations.removeValueForKey("Jayne")
occupations
occupations.count
occupations.isEmpty

var people = occupations.keys  // LazyMapCollection
people.first
// people.last
// people[1]


var persons = Array(occupations.keys)
persons.first
persons.last
persons[1]

var jobs = Array(occupations.values)


//** To create an empty array or dictionary, use the initializer syntax **//
var emptyArray = [String]()
var emptyDictionary = [String: Float]()
emptyArray.append("Ankur")


//** Can also allow data types to be inferred **//
shoppingList = []
occupations = [:]

//** For Ankur's question **//
let ankurArray = ["Ankur"]
// ankurArray[0] = "Jenny"


