//: Playground - noun: a place where people can play

import UIKit

let quotes = ["roslin":   "In war you only get killed once. In politics it can happen over and over.",
  "adama":    "Sometimes you have to roll a hard six.",
  "starbuck": "Cause I'm a screw-up, Lee; keep that in mind.",
  "apollo":   "I need every pilot I have. Even the screw-ups.",
  "anders":   "Lighten up a little bit. It's only the end of the world.",
  "baltar":   "So the fate of the entire human race depends upon my wild guess.",
  "six":      "All this has happened before and all of it will happen again",
  "athena":   "You just can't believe I'm not plotting against you." ]

let ages = [ "roslin": 56, "adama": 62, "apollo": 36, "starbuck": 28, "anders": 38, "baltar": 37, "six": 34, "athena": 34 ]

let officers = [ "adama": "admiral", "tigh": "colonel", "apollo": "major", "starbuck": "captain", "athena": "lieutenant" ]

let ranks = ["admiral", "commander", "colonel", "major", "captain", "lieutenant", "ensign"]

let pilots = ["apollo", "starbuck", "athena"]

let cylons = ["six", "athena", "anders"]

let females = ["roslin", "starbuck", "six", "athena"]

struct Quote {
  var person: String
  var quote: String
  
  init(person: String, quote: String){
    self.person = person //.capitalizedString
    self.quote = quote
  }
}

struct Age {
  var person: String
  var age: Int
  
  init(person: String, age: Int){
    self.person = person
    self.age = age
  }
}

struct Officer {
  var person: String
  var rank: String
  
  init(person: String, rank: String){
    self.person = person
    self.rank = rank
  }
}

var objQuotes   = map(quotes){ Quote(person: $0, quote: $1) }
var objAges     = map(ages){ Age(person: $0, age: $1) }
var objOfficers = map(officers){ Officer(person: $0, rank: $1) }

objQuotes
objAges
objOfficers

var allAges = objAges.map({(a:Age) in a.age})
// var allAges = objAges.map({$0.age})
allAges.sort(<)

var cylonAges = objAges.filter{(a:Age) in contains(cylons, a.person)}.map({(a:Age) in a.age})
// var cylonAges = objAges.filter{contains(cylons, $0.person)}.map({$0.age})
cylonAges

var sumCylonAges = objAges.filter{contains(cylons, $0.person)}.map({$0.age}).reduce(0, combine: {$0+$1})
//var sumCylonAges = objAges.filter{contains(cylons, $0.person)}.map({$0.age}).reduce(0){$0+$1}
//var sumCylonAges = objAges.filter{contains(cylons, $0.person)}.map({$0.age}).reduce(0,combine: +)
sumCylonAges


// var strPilots = pilots.join(", ")
var strPilots = ", ".join(pilots)




