//
//  051_N-Queens.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/1.
//

import Foundation

extension Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        if n == 0 || n == 2 || n == 3 {
            return []
        }
        if n == 1 {
            return [["Q"]]
        }
        
        let chessboard = Array(repeating: Array(repeating: 0, count: n), count: n)
        var resChessboard = [[[Int]]]()
        for i in 0..<(n + 1) / 2 { //遍历至 (n + 1) / 2 就行
            var currChessboard = chessboard
            currChessboard = fill(chessboard: currChessboard, toIndex: (0, i))
            let res = tryFill(chessboard: currChessboard, 1)
            resChessboard += res
        }
        var res = [[String]]()
        var flag = true

        for board in resChessboard {
            var L = [String]()  //转换成字符串
            var R = [String]()  //映射成另一个字符串,减少计算
            for i in 0..<n {
                var strL = ""
                var strR = ""
                
                for j in 0..<n {
                    let num = board[i][j]
                    
                    if flag, num == 2, n % 2 == 1, j == n / 2, i == 0 { ///如果在第一行的正中已经经过回溯计算,不用映射到右侧
                        flag = false
                    }
                    
                    let chr = num == 2 ? "Q" : "."
                    strL = strL.appending(chr)
                    strR = chr.appending(strR)
                }
                
                L.append(strL)
                R.append(strR)
            }
            res.append(L)
            if flag {
                res.append(R)
            }
        }
        
//        print(res.count)
//        for re in res {
//            for ls in re {
//                print(ls)
//            }
//            print("---")
//        }
        
        return res
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
