//
//  022_Generate_Parentheses.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/27.
//

import Foundation

extension Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 1 {
            return ["()"]
            
        }
        var res = [String]()
        generate(res: &res, ans: "", count1: 0, count2: 0, n: n)
        return res
        
//        let last_list = generateParenthesis(n - 1)
//
//        for t in last_list {
//            let curr = Array(t + ")")
//            for i in 0..<curr.count {
//                if curr[i] == ")" {
//                    var temp = curr
//                    temp.insert("(", at: i)
//                    res.append(String(temp))
//                }
//            }
//        }
//        return res.enumerated().filter { (index,value) -> Bool in
//            return res.firstIndex(of: value) == index
//        }.map {
//            $0.element
//        }
    }
    
    private func generate(res: inout [String]  , ans: String, count1: Int, count2: Int, n: Int) {
//        print(ans)
        
        if(count1 > n || count2 > n) { return }
        
        if(count1 == n && count2 == n) {
            res.append(ans)
        }

        if(count1 >= count2){
            generate(res: &res, ans: ans + "(", count1: count1+1 , count2: count2, n: n)
            generate(res: &res, ans: ans + ")", count1: count1, count2: count2 + 1, n: n)
        }
    }

}
