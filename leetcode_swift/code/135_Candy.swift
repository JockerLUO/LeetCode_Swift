//
//  135_Candy.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/10.
//

import Foundation

extension Solution {
    func candy(_ ratings: [Int]) -> Int {

        var candies = Array(repeating: 1, count: ratings.count)
        for i in 1..<ratings.count { ///从左向右遍历,遇到大的就加1
            if ratings[i] > ratings[i - 1] {
                candies[i] = candies[i - 1] + 1
            }
        }

        var res = candies[ratings.count - 1]
        for i in (0..<(ratings.count - 1)).reversed() { ///从右向左遍历,遇到大的,且不满足条件的就加1
            if ratings[i] > ratings[i + 1], candies[i] <= candies[i + 1] {
                candies[i] = candies[i + 1] + 1
            }
            res += candies[i]
        }
        return res
    }
}
