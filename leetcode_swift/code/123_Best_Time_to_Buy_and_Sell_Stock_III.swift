//
//  123_Best_Time_to_Buy_and_Sell_Stock_III.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/28.
//

import Foundation

extension Solution {
    func maxProfit_III(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var fstBuy = Int.min, fstSell = 0
        var secBuy = Int.min, secSell = 0
        for p in prices {
            fstBuy = max(fstBuy, -p)
            fstSell = max(fstSell, fstBuy + p)
            secBuy = max(secBuy, fstSell - p)
            secSell = max(secSell, secBuy + p)
        }
        return secSell
        
//        var profits = [0]
//        var left = prices[0], right = prices[0]
//
//        for i in 1..<prices.count {
//            let p = prices[i]
//            if p <= right {
//                profits.append(right - left)
//                left = p
//            }
//            right = p
//        }
//        if right > left {
//            profits.append(right - left)
//        }
//        profits = profits.sorted(by: { $0 > $1 })
//        return profits[0] + profits[1]
    }
}
