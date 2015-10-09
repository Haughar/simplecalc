//
//  main.swift
//  SimpleCalc
//
//  Created by Alison Rose Haugh on 10/7/15.
//  Copyright © 2015 Alison Haugh. All rights reserved.
//

import Foundation

print("Hello, World!")

/*func convert(incoming:String) -> Int {
    return NSFormatter().numberFromString(incoming)!.integerValue
}*/

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

func simpleSolve(operand: String, first_number: Int, second_number: Int) -> Int {
    switch operand {
        case "add":
            return first_number + second_number
        case "sub":
            return first_number - second_number
        case "mul":
            return first_number * second_number
        case "div":
            return first_number / second_number
        case "mod":
            return first_number % second_number
        default:
            return 0
    }
}

func complexSolve(operand:String, intArray:[Int]) -> Int {
    switch operand {
    case "count":
        return intArray.count
    case "avg":
        var total = 0
        for number in intArray {
            total += number
        }
        return total / intArray.count
    default:
        return 0
    }
}

func factorial(value: Int) -> Int {
    return value == 0 ? 1 : value * factorial(value-1)
}

func runCalc() -> Int {
    print("Enter number(s):")
    let number_input = input()
    if number_input.containsString(" ") {
        let numbersArray = number_input.componentsSeparatedByString(" ")
        var intArray = [Int]()
        for number in numbersArray {
            intArray.append(convert(number))
        }
            print("Enter operand (count, avg): ")
    let operand = input()
        return complexSolve(operand, intArray: intArray)
        // call method to do operation
    }
    let first_number = convert(number_input)


    print("Enter operand (add, sub, mul, div, mod, fact):")
    let operand = input()
    if operand == "fact" {
        return factorial(first_number)
    }
    
    print("Enter other number:")
    let number2_input = input()
    let second_number = convert(number2_input)

    return simpleSolve(operand, first_number: first_number, second_number: second_number)
}

let result = runCalc()
if result == 0 {
    print("The operand that you entered didn't match any of ours. Try again.")
}
else {
    print("The solution to your problem is \(result).")
}

