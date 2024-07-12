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

// -- 4. Longest Common Prefix --
// * Difficulty: Easy
// Write a function to find the longest common prefix string amongst an array of strings.
// If there is no common prefix, return an empty string "".

class SolutionLongestCommonPrefix {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var commonPrefix: String = ""
        var prefixes: [String] = []
        let firstPrefix: String = strs[0]
        let firstPrefixSize: Int = firstPrefix.count
        
        if firstPrefixSize != 0 {
            for x in 1...firstPrefixSize {
                prefixes.append(String(firstPrefix.prefix(x)))
            }
        } else {
            prefixes = [""]
            return commonPrefix
        }
        
        if prefixes.count == 1,
           strs.count == 1 {
            return prefixes[0]
        }
        
        for (index, prefix) in prefixes.enumerated() {
            for indexStrs in 1...strs.count - 1 {
                if !strs[indexStrs].hasPrefix(prefix),
                    index != 0 {
                    commonPrefix = prefixes[index - 1]
                    return commonPrefix
                } else if !strs[indexStrs].hasPrefix(prefix),
                          index == 0 {
                    return ""
                }
            }
        }
        
        return strs[0]
    }
}

let solutionLongestCommonPrefix: SolutionLongestCommonPrefix = SolutionLongestCommonPrefix()
solutionLongestCommonPrefix.longestCommonPrefix(["flower","flow","flight"])
solutionLongestCommonPrefix.longestCommonPrefix(["dog","racecar","car"])
solutionLongestCommonPrefix.longestCommonPrefix([""])
solutionLongestCommonPrefix.longestCommonPrefix(["a"])
solutionLongestCommonPrefix.longestCommonPrefix(["flower","flower","flower","flower"])
solutionLongestCommonPrefix.longestCommonPrefix(["a","b"])

// -- 5. Valid Parentheses --
// * Difficulty: Easy
// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
// An input string is valid if:
//     1. Open brackets must be closed by the same type of brackets.
//     2. Open brackets must be closed in the correct order.
//     3. Every close bracket has a corresponding open bracket of the same type.

class SolutionValidParentheses {
    func isValid(_ s: String) -> Bool {
        var parentheses: [Character] = []

        for character in s {
            switch character {
                case "(", "[", "{":
                    parentheses.append(character)
                case ")":
                    if !parentheses.isEmpty {
                        if parentheses[parentheses.count - 1] == "(" {
                            parentheses.removeLast()
                        } else {
                            return false
                        }
                    } else {
                        return false
                    }
                case "]":
                    if !parentheses.isEmpty {
                        if parentheses[parentheses.count - 1] == "[" {
                            parentheses.removeLast()
                        } else {
                            return false
                        }
                    } else {
                        return false
                    }
                case "}":
                    if !parentheses.isEmpty {
                       if parentheses[parentheses.count - 1] == "{" {
                            parentheses.removeLast()
                        } else {
                            return false
                        }
                    } else {
                        return false
                    }
                default:
                    return false
                }
        }

        if parentheses.count == 0 {
            return true
        }

        return false
    }
}

let solutionValidParentheses: SolutionValidParentheses = SolutionValidParentheses()
solutionValidParentheses.isValid("()") // true
solutionValidParentheses.isValid("()[]{}") // true
solutionValidParentheses.isValid("(]") // false
solutionValidParentheses.isValid("([)]") // false
solutionValidParentheses.isValid("{[]}") // true
solutionValidParentheses.isValid("{[()]}") // true
solutionValidParentheses.isValid("[") // false
solutionValidParentheses.isValid("){") // false
solutionValidParentheses.isValid("(){}}{") // false
solutionValidParentheses.isValid("(}{)") // false
solutionValidParentheses.isValid("[])") // false
solutionValidParentheses.isValid("(([]){})") // true
solutionValidParentheses.isValid("(])") // false

// -- 6. Find the Index of the First Occurrence in a String --
// * Difficulty: Easy
// Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

class SolutionFirstOccurrence{
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.contains(needle) {
            var needleSplitted: [Character] = []
            for letter in needle {
                needleSplitted.append(letter)
            }

            var haystackSplitted: [Character] = []
            for letter in haystack {
                haystackSplitted.append(letter)
            }

            if needleSplitted == haystackSplitted {
                return 0
            } else {
                var stack: [Character] = []
                for (index, value) in haystackSplitted.enumerated() {
                    if value == needleSplitted[0] {
                        stack.append(value)
                        if stack == needleSplitted {
                            return index
                        } else {
                           for i in index + 1...index + (needleSplitted.count - 1) {
                                stack.append(haystackSplitted[i])
                            }
                            if stack == needleSplitted {
                                return index
                            } else {
                                stack = []
                            }
                        }
                    }
                }
            }

            return 0
        } else {
            return -1
        }
    }
}

let solutionFirstOccurrence: SolutionFirstOccurrence = SolutionFirstOccurrence()
print(solutionFirstOccurrence.strStr("sadbutsad", "sad")) // 0
print(solutionFirstOccurrence.strStr("leetcode", "leeto")) // -1
print(solutionFirstOccurrence.strStr("butsad", "sad")) // 3
print(solutionFirstOccurrence.strStr("hello", "ll")) // 2
print(solutionFirstOccurrence.strStr("mississippi", "issi")) // 1
print(solutionFirstOccurrence.strStr("a", "a")) // 1
print(solutionFirstOccurrence.strStr("abc", "c")) // 2
