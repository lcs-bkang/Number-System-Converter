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
var fromBase = readLine()!

// Get the "to" number system
print("What number system do you want to convert to?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H): ", terminator: "")
var toBase = readLine()!

// Get the number to convert
print("What number do you want to convert?")
let numberToConvert = readLine()!

// PROCESS
switch fromBase {
case "B":
    _ = 2
case "O":
    _ = 8
case "D":
    _ = 10
case "H":
    _ = 16
default:
    break
}
switch toBase {
case "B":
    _ = 2
case "O":
    _ = 8
case "D":
    _ = 10
case "H":
    _ = 16
default:
    break
}


func numberConverter(numberToConvert value: Int, fromBase base: Int, toBase: Int) -> Double {
    // Exponent value at the rightmost digit
    var exponent = 0.0
    var valueString = String(value)
    // Current sum in decimal
    var decimalEquivalent = 0.0
    // Iterate over each character
    // From right to left
    // For...in will loop the exact right amount of times.
    
    for character in valueString.reversed() {
        if base == 16 {
            // If conversions to doubles work, it is 0-9
            if let digit = Double(String(character)) {
                decimalEquivalent += digit * pow(Double(base), exponent)
            } else {
                // It can't be switched to a double, so its A-F
                switch character {
                case "A":
                    decimalEquivalent += 10 * pow(Double(base), exponent)
                case "B":
                    decimalEquivalent += 11 * pow(Double(base), exponent)
                case "C":
                    decimalEquivalent += 12 * pow(Double(base), exponent)
                case "D":
                    decimalEquivalent += 13 * pow(Double(base), exponent)
                case "E":
                    decimalEquivalent += 14 * pow(Double(base), exponent)
                case "F":
                    decimalEquivalent += 15 * pow(Double(base), exponent)
                default:
                    break
                }
            }
        }
        // Increment exponent
        exponent += 1
        
        var decimalValueLeft = value
        
        var Representation = ""
        
        //  As long as the condition is true, the code will be run repeatedly.
        while decimalValueLeft > 0 {
            // First, get next binary digit
            let nextDigit = decimalValueLeft % base
            // Add the digit to the number

            // IF statement checks a condition.  If true, do something, if false, do something else.
            if base == 16 {
                // We know the base is hexadecimal

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
}
// OUTPUT
let output = numberConverter(numberToConvert: <#T##Int#>, fromBase: <#T##Int#>, toBase: <#T##Int#>)
print(output)
