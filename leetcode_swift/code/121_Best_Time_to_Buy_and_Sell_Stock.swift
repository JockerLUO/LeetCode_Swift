//
//  121_Best_Time_to_Buy_and_Sell_Stock.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/28.
//

import Foundation

extension Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        
        var minP = prices[0], maxP = 0;
        for p in prices[1...] {
            maxP = max(maxP, p - minP)
            minP = min(minP, p)
        }
        return maxP
    }
}
