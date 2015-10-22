//: Playground - noun: a place where people can play

import UIKit


let numbers = [ 10000, 10303, 30913, 50000, 100000, 101039, 1000000 ]

// The traditional for loop process
var formattedNumbers: [String] = []
for number in numbers {
  let formattedNumber = NSNumberFormatter.localizedStringFromNumber(number, numberStyle: .DecimalStyle)
  formattedNumbers.append(formattedNumber)
}

formattedNumbers


// Map
let mappedFormattedNumbers = numbers.map { NSNumberFormatter.localizedStringFromNumber($0, numberStyle: .DecimalStyle) }

mappedFormattedNumbers


// Filter
let evenNumbers = numbers.filter { $0 % 2 == 0 }

evenNumbers

// Reduce
let total = numbers.reduce(0) { $0 + $1 }

total