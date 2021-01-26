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
let fromBase = readLine()!

// Get the "to" number system
print("What number system do you want to convert to?")
print("B: Binary")
print("O: Octal")
print("D: Decimal")
print("H: Hexadecimal")
print("Enter your choice (B/O/D/H): ", terminator: "")
let toBase = readLine()!

// Get the number to convert
print("What number do you want to convert?")
let numberToConvert = String(readLine()!)

// PROCESS
func convert(fromBase f: Int, toBase t: Int) -> String {
    
}
// OUTPUT
