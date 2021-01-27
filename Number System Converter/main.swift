//
//  main.swift
//  Number System Converter
//
//  Created by Brad Kang on 2021-01-26.
//

import Foundation

print("Hello, World!")

// INPUT

// Get the "from" number system
print("What number system do you want to convert from?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H): ", terminator: "") // Keep following output on same line
let from = readLine()!
var fromBase = from.uppercased()

// Get the "to" number system
print("What number system do you want to convert to?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H): ", terminator: "")
let to = readLine()!
var toBase = to.uppercased()

// Get the number to convert
print("What number do you want to convert?")
let numberConvert = readLine()!
var numberToConvert = numberConvert

// PROCESS
var fromBaseSystem = "From"
var fromBaseNumber = 0
switch fromBase {
case "B":
    fromBaseNumber = 2
    fromBaseSystem = "Binary"
case "O":
    fromBaseNumber = 8
    fromBaseSystem = "Octal"
case "D":
    fromBaseNumber = 10
    fromBaseSystem = "Decimal"
case "H":
    fromBaseNumber = 16
    fromBaseSystem = "Hexadecimal"
default:
    break
}
var toBaseNumber = 0
var toBaseSystem = "To"
switch toBase {
case "B":
    toBaseNumber = 2
    toBaseSystem = "Binary"
case "O":
    toBaseNumber = 8
    toBaseSystem = "Octal"
case "D":
    toBaseNumber = 10
    toBaseSystem = "Decimal"
case "H":
    toBaseNumber = 16
    toBaseSystem = "Hexadecimal"
default:
    break
}

func toDecimal(number: String, from: Int) -> Int {
// Exponent value at the rightmost digit
var exponent = 0.0

// Current sum in decimal
    var decimalEquivalent = 0.0
    let decimalNumber = number
// Iterate over each character
// From right to left
// For...in will loop the exact right amount of times.
    if from == 10 {
        return Int(decimalNumber)!
    } else {
    for character in number.reversed() {
    if from == 16 {
        // If conversions to doubles work, it is 0-9
        if let digit = Double(String(character)) {
            decimalEquivalent += digit * pow(Double(from), exponent)
        } else {
            // It can't be switched to a double, so its A-F
        switch character {
        case "A":
            decimalEquivalent += 10 * pow(Double(from), exponent)
        case "B":
            decimalEquivalent += 11 * pow(Double(from), exponent)
        case "C":
            decimalEquivalent += 12 * pow(Double(from), exponent)
        case "D":
            decimalEquivalent += 13 * pow(Double(from), exponent)
        case "E":
            decimalEquivalent += 14 * pow(Double(from), exponent)
        case "F":
            decimalEquivalent += 15 * pow(Double(from), exponent)
        default:
            break
        }
    }
    }
    // Increment exponent
    exponent += 1
}
// Get the result
    return Int(decimalEquivalent)
}
}
let decimalNumber = toDecimal(number: numberToConvert, from: fromBaseNumber)

func getRepresentation(of valueToConvert: Int, in base: Int) -> String {

    // Creates a variable with value valueToConvert
    // Variables can be changed once created
    var decimalValueLeft =  valueToConvert
    // Creates an empty string
    // Strings are text
    var Representation = ""

    // Abstraction used is a loop.
    // Our end condition is that the decimal value left to convert is 0
    //  As long as the condition is true, the code will be run repeatedly.
    while decimalValueLeft > 0 {
        // First, get next binary digit
        let nextDigit = Int(decimalValueLeft) % base
        // Add the digit to the number
        // Swift is a stricty typed language
        // Does not convert data types
        // So to make the Int into a string, we must identify this
        
        // IF statement checks a condition.  If true, do something, if false, do something else.
        // First statement is true.  Else is when the condition is false.
        if base == 16 {
            // We know the base is hexadecimal
            
            // Carefully set the next digit
            // When the digit is not 0-9, make digits A B C D E and F
            
            // Switch statement evaluates a value and takes different actions depending on the value.
            switch nextDigit {
            case 0...9:
                Representation = String(nextDigit) + Representation
            case 10:
                Representation = "A" + Representation
            case 11:
                Representation = "B" + Representation
            case 12:
                Representation = "C" + Representation
            case 13:
                Representation = "D" + Representation
            case 14:
                Representation = "E" + Representation
            case 15:
                Representation = "F" + Representation

            default:
                break
            }
        } else {
            // We know the base is octal or binary
            Representation = String(nextDigit) + Representation
        }
        
        
        // Get decimal value left to convert
        decimalValueLeft = decimalValueLeft / base
        
    }
   return Representation

}


// OUTPUT
let output = getRepresentation(of: decimalNumber, in: toBaseNumber)
print("The number \(numberConvert) in the number system of \(fromBaseSystem) is converted to the number \(output) in the number system of \(toBaseSystem).")
