import Foundation

// -- 1. Two Sum --
// * Difficulty: Easy
// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.

class SolutionTwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []
        var laps: Int = 1
        for (index, item) in nums.enumerated() {
            if index != nums.count - 1 {
                let allOtherNumbers = nums[index + 1...nums.count - 1]
                allOtherNumbers.enumerated().forEach {
                    if item + $1 == target {
                        result.append(index)
                        result.append($0 + laps)
                    }
                }
                laps += 1
            }
        }
        return result
    }
    
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        // cur + x = target
        // x = target - cur
        var dictionary =  [Int: Int]()
        var result: [Int] = []
        // 3:0
        // 2:1
        // 4:2
        nums.enumerated().forEach { index, item in
            let x = target - item
            if dictionary.isEmpty {
                dictionary[item] = index
            } else {
                for (itemKey, indexValue) in dictionary {
                    if x == itemKey,
                       indexValue != index {
                        result.append(contentsOf: [index, indexValue])
                        break
                    } else {
                        dictionary[item] = index
                    }
                }
            }
        }
        return result
    }
    
    func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
            var dict = [Int: Int]()
            
            for (index, value) in nums.enumerated() {
                if let addent = dict[value] {
                    return [addent, index]
                } else {
                    dict[target - value] = index
                }
            }
            
            return []
        }
}

let solutionTwoSum: SolutionTwoSum = SolutionTwoSum()
solutionTwoSum.twoSum([3, 2, 4], 6)
solutionTwoSum.twoSum2([3, 2, 4], 6)
solutionTwoSum.twoSum3([3, 2, 4], 6)

// -- 2. Palindrome Number --
// * Difficulty: Easy
// Given an integer x, return true if x is a palindrome, and false otherwise.

class SolutionPalindrome {
    func isPalindrome(_ x: Int) -> Bool {
        var container: [Character] = []
        
        if x < 0 {
            return false
        } else {
            for num in String(x) {
                container.append(num)
            }
            
            var secondContainer: [Character] = []
            for character in container.reversed() {
                secondContainer.append(character)
            }
            
            if container.elementsEqual(secondContainer) {
                return true
            }
        }
        return false
    }
}

let solutionPalindrome: SolutionPalindrome = SolutionPalindrome()
solutionPalindrome.isPalindrome(121)
solutionPalindrome.isPalindrome(-121)
solutionPalindrome.isPalindrome(10)

// -- 3. Roman to Integer --
// * Difficulty: Easy
// Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
// Symbol       Value
// I             1
// V             5
// X             10
// L             50
// C             100
// D             500
// M             1000
// For example, 2 is written as II in Roman numeral, just two ones added together.
// 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.
// Roman numerals are usually written largest to smallest from left to right.
// However, the numeral for four is not IIII. Instead, the number four is written as IV.
// Because the one is before the five we subtract it making four.
// The same principle applies to the number nine, which is written as IX.
// There are six instances where subtraction is used:
// * I can be placed before V (5) and X (10) to make 4 and 9.
// * X can be placed before L (50) and C (100) to make 40 and 90.
// * C can be placed before D (500) and M (1000) to make 400 and 900.
// Given a roman numeral, convert it to an integer.

class SolutionRomanInteger {
    func romanToInt(_ s: String) -> Int {
        var result: Int = 0
        var romanNumbers: [Character] = []
        
        s.forEach { romanNumbers.append($0) }
        
        for (romanIndex, romanNum) in romanNumbers.enumerated() {
            switch romanNum {
                case "I":
                    result += 1
                case "V":
                    if romanIndex == 0 {
                        result += 5
                    } else if romanNumbers[romanIndex - 1] == "I" {
                        result = (result - 1) + 4
                    } else {
                        result += 5
                    }
                case "X":
                    if romanIndex == 0 {
                        result += 10
                    } else if romanNumbers[romanIndex - 1] == "I" {
                        result = (result - 1) + 9
                    } else {
                        result += 10
                    }
                case "L":
                    if romanIndex == 0 {
                        result += 50
                    } else if romanNumbers[romanIndex - 1] == "X" {
                        result = (result - 10) + 40
                    } else {
                        result += 50
                    }
                case "C":
                    if romanIndex == 0 {
                        result += 100
                    } else if romanNumbers[romanIndex - 1] == "X" {
                        result = (result - 10) + 90
                    } else {
                        result += 100
                    }
                case "D":
                    if romanIndex == 0 {
                        result += 500
                    } else if romanNumbers[romanIndex - 1] == "C" {
                        result = (result - 100) + 400
                    } else {
                        result += 500
                    }
                case "M":
                    if romanIndex == 0 {
                        result += 1000
                    } else if romanNumbers[romanIndex - 1] == "C" {
                        result = (result - 100) + 900
                    } else {
                        result += 1000
                    }
                default:
                    result += 0
            }
        }
        return result
    }
}

let solutionRomanInteger: SolutionRomanInteger = SolutionRomanInteger()
solutionRomanInteger.romanToInt("III")
solutionRomanInteger.romanToInt("LVIII")
solutionRomanInteger.romanToInt("MCMXCIV")
