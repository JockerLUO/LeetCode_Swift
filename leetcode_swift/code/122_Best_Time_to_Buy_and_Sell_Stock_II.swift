//
//  122_Best_Time_to_Buy_and_Sell_Stock_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/28.
//

import Foundation

extension Solution {
    func maxProfit_II(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var maxProfit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                maxProfit += prices[i] - prices[i - 1]
            }
        }
        return maxProfit
    }
}
