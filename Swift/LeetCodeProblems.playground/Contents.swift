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
