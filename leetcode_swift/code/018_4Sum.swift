//
//  018_4Sum.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/26.
//

import Foundation

extension Solution {
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted(by: <)
        var threeSum = 0
        var twoSum = 0
        var left = 0
        var right = 0
        var res = [[Int]]()
        
        guard nums.count >= 4 else {
            return res
        }
        
        let lefgApproach = {
            repeat {
                left += 1
            } while left < right && nums[left] == nums[left - 1]
        }
        let rightApproach = {
            repeat {
                right -= 1
            } while left < right && nums[right] == nums[right + 1]
        }
        
        for i in 0..<nums.count - 3 {
            guard i == 0 || nums[i] != nums[i - 1] else {
                continue
            }
            threeSum = target - nums[i]
            
            for j in i + 1..<nums.count - 2 {
                guard j == i + 1 || nums[j] != nums[j - 1] else {
                    continue
                }
                twoSum = threeSum - nums[j]
                
                left = j + 1
                right = nums.count - 1
                while left < right {
                    if nums[left] + nums[right] == twoSum {
                        res.append([nums[i], nums[j], nums[left], nums[right]])
                        lefgApproach()
                        rightApproach()
                    } else if nums[left] + nums[right] < twoSum {
                        lefgApproach()
                    } else {
                        rightApproach()
                    }
                }
            }
        }
        return res
    }
    
//    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
//        guard nums.count >= 3 else {
//            return [[Int]]()
//        }
//        let sort_nums = nums.sorted(by: <)
//        let ls = nums.count
//        var res = [[Int]]()
//        var pairs = [Int: [[Int]]]()
//
//        for i in 0..<ls - 3 {
//            for j in i + 1..<ls - 2 {
//                let res_2 = sort_nums[i] + sort_nums[j]
//                if pairs[target - res_2] == nil {
//                    pairs[target - res_2] = [[Int]]()
//                }
//                pairs[target - res_2]?.append([i, j])
//            }
//        }
//        var L = 0, R = ls - 1
//        let lefgApproach = {
//            repeat {
//                L += 1
//            } while L < R && nums[L] == nums[L - 1]
//        }
//        let rightApproach = {
//            repeat {
//                R -= 1
//            } while L < R && nums[R] == nums[R + 1]
//        }
//
//        for (key, temp) in pairs {
//            for pair in temp {
//                L = pair[1] + 1
//                R = ls - 1
//                while L < R {
//                    let current = sort_nums[L] + sort_nums[R]
//                    if current == key {
//                        let result = [sort_nums[pair[0]], sort_nums[pair[1]], sort_nums[L], sort_nums[R]]
//                        if !res.contains(result) {
//                            res.append(result)
//                        }
//                        lefgApproach()
//                        rightApproach()
//                    } else if current < key {
//                        lefgApproach()
//                    } else {
//                        rightApproach()
//                    }
//                }
//            }
//        }
//        return res
//    }
}
