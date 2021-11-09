//
//  052_N-Queens II.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/1.
//

import Foundation

extension Solution {
    func totalNQueens(_ n: Int) -> Int {
        if n == 0 || n == 2 || n == 3 {
            return 0
        }
        if n == 1 {
            return 1
        }

        let chessboard = Array(repeating: Array(repeating: 0, count: n), count: n)
        var total = 0
        for i in 0..<(n + 1) / 2 {
            var currChessboard = chessboard
            currChessboard = fill(chessboard: currChessboard, toIndex: (0, i))
            let res = tryFill(chessboard: currChessboard, 1)
            if n % 2 == 1, i == n / 2 {
                total += res.count
            } else {
                total += (res.count * 2)
            }
        }
        return total
    }
    
    private func tryFill(chessboard: [[Int]], _ level: Int) -> [[[Int]]] {
        
        var res = [[[Int]]]()
        
        let n = chessboard.count
        for i in 0..<n {
            if chessboard[level][i] != 0 { continue }
            var currChessboard = chessboard
            currChessboard = fill(chessboard: currChessboard, toIndex: (level, i))
            if level == n - 1 {
                res.append(currChessboard)
            } else {
                res += tryFill(chessboard: currChessboard, level + 1)
            }
        }
        return res
    }
    
    private func fill(chessboard: [[Int]], toIndex: (Int, Int)) -> [[Int]] {
        let n = chessboard.count
        var currChessboard = chessboard
        currChessboard[toIndex.0][toIndex.1] = 2
        for i in 0..<n {
            for j in 0..<n {
                if currChessboard[i][j] != 0 { continue }
                let row = i == toIndex.0
                let column = j == toIndex.1
                let leftBevel = (toIndex.0 - i) == (toIndex.1 - j)
                let rightBevel = (toIndex.0 + toIndex.1) == (i + j)
                if row || column || leftBevel || rightBevel {
                    currChessboard[i][j] = 1
                }
            }
        }
        return currChessboard
    }
}
